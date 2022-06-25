@def title = "Model Internals"

# Understanding Model Internals

The `@model` macro accepts a function definition and rewrites it such that call of the function generates a `Model` struct for use by the sampler.
Models can be constructed by hand without the use of a macro.
Taking the `gdemo` model as an example, the macro-based definition

```julia
using Turing
@model function gdemo(x)
  # Set priors.
  s² ~ InverseGamma(2, 3)
  m ~ Normal(0, sqrt(s²))
  # Observe each value of x.
  @. x ~ Normal(m, sqrt(s²))
end
model = gdemo([1.5, 2.0])
```

can be implemented also (a bit less generally) with the macro-free version

```julia
using Turing
# Create the model function.
function gdemo(model, varinfo, context, x)
    # Assume s² has an InverseGamma distribution.
    s², varinfo = DynamicPPL.tilde_assume!!(
        context,
        InverseGamma(2, 3),
        Turing.@varname(s²),
        varinfo,
    )
    # Assume m has a Normal distribution.
    m, varinfo = DynamicPPL.tilde_assume!!(
        context,
        Normal(0, sqrt(s²)),
        Turing.@varname(m),
        varinfo,
    )
    # Observe each value of x[i] according to a Normal distribution.
    DynamicPPL.dot_tilde_observe!!(context, Normal(m, sqrt(s²)), x, Turing.@varname(x), varinfo)
end
gdemo(x) = Turing.Model(gdemo, (; x))
# Instantiate a Model object with our data variables.
model = gdemo([1.5, 2.0])
```
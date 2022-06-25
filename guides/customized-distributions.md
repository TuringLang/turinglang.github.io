@def title = "Customized Distributions"

# How to Define Customized Distributions

Turing.jl supports the use of distributions from the Distributions.jl package. By extension it also supports the use of customized distributions, by defining them as subtypes of `Distribution` type of the Distributions.jl package, as well as corresponding functions.


Below shows a workflow of how to define a customized distribution, using our own implementation of a simple `Uniform` distribution as a simple example.


## 1. Define the Distribution Type


First, define a type of the distribution, as a subtype of a corresponding distribution type in the Distributions.jl package.


```julia
struct CustomUniform <: ContinuousUnivariateDistribution end
```

## 2. Implement Sampling and Evaluation of the log-pdf


Second, define `rand` and `logpdf`, which will be used to run the model.


```julia
# sample in [0, 1]
Distributions.rand(rng::AbstractRNG, d::CustomUniform) = rand(rng)
# p(x) = 1 → logp(x) = 0
Distributions.logpdf(d::CustomUniform, x::Real) = zero(x)
```

## 3. Define Helper Functions


In most cases, it may be required to define some helper functions.

## 3.1 Domain Transformation

Certain samplers, such as `HMC`, require the domain of the priors to be unbounded. Therefore, to use our `CustomUniform` as a prior in a model we also need to define how to transform samples from `[0, 1]` to `ℝ`. To do this, we simply need to define the corresponding `Bijector` from `Bijectors.jl`, which is what `Turing.jl` uses internally to deal with constrained distributions.

To transform from `[0, 1]` to `ℝ` we can use the `Logit` bijector:

```julia
Bijectors.bijector(d::CustomUniform) = Logit(0., 1.)
```

You'd do the exact same thing for `ContinuousMultivariateDistribution` and `ContinuousMatrixDistribution`. For example, `Wishart` defines a distribution over positive-definite matrices and so `bijector` returns a `PDBijector` when called with a `Wishart` distribution as an argument. For discrete distributions, there is no need to define a bijector; the `Identity` bijector is used by default.

Alternatively, for `UnivariateDistribution` we can define the `minimum` and `maximum` of the distribution

```julia
Distributions.minimum(d::CustomUniform) = 0.
Distributions.maximum(d::CustomUniform) = 1.
```

and `Bijectors.jl` will return a default `Bijector` called `TruncatedBijector` which makes use of `minimum` and `maximum` derive the correct transformation.

Internally, Turing basically does the following when it needs to convert a constrained distribution to an unconstrained distribution, e.g. when sampling using `HMC`:
```julia
b = bijector(dist)
transformed_dist = transformed(dist, b) # results in distribution with transformed support + correction for logpdf
```
and then we can call `rand` and `logpdf` as usual, where
- `rand(transformed_dist)` returns a sample in the unconstrained space, and
- `logpdf(transformed_dist, y)` returns the log density of the original distribution, but with `y` living in the unconstrained space.

To read more about Bijectors.jl, check out [the project README](https://github.com/TuringLang/Bijectors.jl).
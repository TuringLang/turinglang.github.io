@def title = "Accumulated Log Probability"

# How to Update the Accumulated Log Probability Directly

Turing accumulates log probabilities internally in an internal data structure that is accessible through
the internal variable `__varinfo__` inside of the model definition (see below for more details about model internals).
However, since users should not have to deal with internal data structures, a macro `Turing.@addlogprob!` is provided
that increases the accumulated log probability. For instance, this allows you to
[include arbitrary terms in the likelihood](https://github.com/TuringLang/Turing.jl/issues/1332)

```julia
using Turing
myloglikelihood(x, μ) = loglikelihood(Normal(μ, 1), x)
@model function demo(x)
    μ ~ Normal()
    Turing.@addlogprob! myloglikelihood(x, μ)
end
```

and to [reject samples](https://github.com/TuringLang/Turing.jl/issues/1328):

```julia
using Turing
using LinearAlgebra
@model function demo(x)
    m ~ MvNormal(zero(x), I)
    if dot(m, x) < 0
        Turing.@addlogprob! -Inf
        # Exit the model evaluation early
        return
    end
    x ~ MvNormal(m, I)
    return
end
```

Note that `@addlogprob!` always increases the accumulated log probability, regardless of the provided
sampling context. For instance, if you do not want to apply `Turing.@addlogprob!` when evaluating the
prior of your model but only when computing the log likelihood and the log joint probability, then you
should [check the type of the internal variable `__context_`](https://github.com/TuringLang/DynamicPPL.jl/issues/154)
such as

```julia
if DynamicPPL.leafcontext(__context__) !== Turing.PriorContext()
    Turing.@addlogprob! myloglikelihood(x, μ)
end
```
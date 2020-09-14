---
title: API
permalink: /docs/library/
toc: true
---



<a id='Index'></a>

<a id='Index-1'></a>

## Index

- [`Turing.BinomialLogit`]({{site.baseurl}}/docs/library/#Turing.BinomialLogit)
- [`Turing.Flat`]({{site.baseurl}}/docs/library/#Turing.Flat)
- [`Turing.FlatPos`]({{site.baseurl}}/docs/library/#Turing.FlatPos)
- [`Turing.OrderedLogistic`]({{site.baseurl}}/docs/library/#Turing.OrderedLogistic)
- [`Turing.Inference.Gibbs`]({{site.baseurl}}/docs/library/#Turing.Inference.Gibbs)
- [`Turing.Inference.HMC`]({{site.baseurl}}/docs/library/#Turing.Inference.HMC)
- [`Turing.Inference.HMCDA`]({{site.baseurl}}/docs/library/#Turing.Inference.HMCDA)
- [`Turing.Inference.IS`]({{site.baseurl}}/docs/library/#Turing.Inference.IS)
- [`Turing.Inference.MH`]({{site.baseurl}}/docs/library/#Turing.Inference.MH)
- [`Turing.Inference.NUTS`]({{site.baseurl}}/docs/library/#Turing.Inference.NUTS)
- [`Turing.Inference.PG`]({{site.baseurl}}/docs/library/#Turing.Inference.PG)
- [`Turing.Inference.SMC`]({{site.baseurl}}/docs/library/#Turing.Inference.SMC)
- [`Libtask.TArray`]({{site.baseurl}}/docs/library/#Libtask.TArray)
- [`Libtask.tzeros`]({{site.baseurl}}/docs/library/#Libtask.tzeros)


<a id='Modelling'></a>

<a id='Modelling-1'></a>

## Modelling

### <a id='DynamicPPL.@model' href='#DynamicPPL.@model'>#</a> **`DynamicPPL.@model`** &mdash; *Macro*.


```julia
@model(expr[, warn = true])
```

Macro to specify a probabilistic model.

If `warn` is `true`, a warning is displayed if internal variable names are used in the model definition.

**Examples**

Model definition:

```julia
@model function model(x, y = 42)
    ...
end
```

To generate a `Model`, call `model(xvalue)` or `model(xvalue, yvalue)`.


<a id='Samplers'></a>

<a id='Samplers-1'></a>

## Samplers

### <a id='DynamicPPL.Sampler' href='#DynamicPPL.Sampler'>#</a> **`DynamicPPL.Sampler`** &mdash; *Type*.


```julia
Sampler{T}
```

Generic interface for implementing inference algorithms. An implementation of an algorithm should include the following:

1. A type specifying the algorithm and its parameters, derived from InferenceAlgorithm
2. A method of `sample` function that produces results of inference, which is where actual inference happens.

DynamicPPL translates models to chunks that call the modelling functions at specified points. The dispatch is based on the value of a `sampler` variable. To include a new inference algorithm implements the requirements mentioned above in a separate file, then include that file at the end of this one.

### <a id='Turing.Inference.Gibbs' href='#Turing.Inference.Gibbs'>#</a> **`Turing.Inference.Gibbs`** &mdash; *Type*.


```julia
Gibbs(algs...)
```

Compositional MCMC interface. Gibbs sampling combines one or more sampling algorithms, each of which samples from a different set of variables in a model.

Example:

```julia
@model gibbs_example(x) = begin
    v1 ~ Normal(0,1)
    v2 ~ Categorical(5)
end
```

**Use PG for a 'v2' variable, and use HMC for the 'v1' variable.**

**Note that v2 is discrete, so the PG sampler is more appropriate**

**than is HMC.**

alg = Gibbs(HMC(0.2, 3, :v1), PG(20, :v2)) ```

Tips:

  * `HMC` and `NUTS` are fast samplers, and can throw off particle-based

methods like Particle Gibbs. You can increase the effectiveness of particle sampling by including more particles in the particle sampler.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/gibbs.jl#L14-L39' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.HMC' href='#Turing.Inference.HMC'>#</a> **`Turing.Inference.HMC`** &mdash; *Type*.


```julia
HMC(ϵ::Float64, n_leapfrog::Int)
```

Hamiltonian Monte Carlo sampler with static trajectory.

Arguments:

  * `ϵ::Float64` : The leapfrog step size to use.
  * `n_leapfrog::Int` : The number of leapfrop steps to use.

Usage:

```julia
HMC(0.05, 10)
```

Tips:

  * If you are receiving gradient errors when using `HMC`, try reducing the leapfrog step size `ϵ`, e.g.

```julia
# Original step size
sample(gdemo([1.5, 2]), HMC(0.1, 10), 1000)

# Reduced step size
sample(gdemo([1.5, 2]), HMC(0.01, 10), 1000)
```


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/hmc.jl#L46-L73' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.HMCDA' href='#Turing.Inference.HMCDA'>#</a> **`Turing.Inference.HMCDA`** &mdash; *Type*.


```julia
HMCDA(n_adapts::Int, δ::Float64, λ::Float64; ϵ::Float64=0.0)
```

Hamiltonian Monte Carlo sampler with Dual Averaging algorithm.

Usage:

```julia
HMCDA(200, 0.65, 0.3)
```

Arguments:

  * `n_adapts::Int` : Numbers of samples to use for adaptation.
  * `δ::Float64` : Target acceptance rate. 65% is often recommended.
  * `λ::Float64` : Target leapfrop length.
  * `ϵ::Float64=0.0` : Inital step size; 0 means automatically search by Turing.

For more information, please view the following paper ([arXiv link](https://arxiv.org/abs/1111.4246)):

  * Hoffman, Matthew D., and Andrew Gelman. "The No-U-turn sampler: adaptively setting path lengths in Hamiltonian Monte Carlo." Journal of Machine Learning Research 15, no. 1 (2014): 1593-1623.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/hmc.jl#L218-L241' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.IS' href='#Turing.Inference.IS'>#</a> **`Turing.Inference.IS`** &mdash; *Type*.


```julia
IS()
```

Importance sampling algorithm.

Note that this method is particle-based, and arrays of variables must be stored in a [`TArray`]({{site.baseurl}}/docs/library/#Libtask.TArray) object.

Usage:

```julia
IS()
```

Example:

```julia
# Define a simple Normal model with unknown mean and variance.
@model gdemo(x) = begin
    s ~ InverseGamma(2,3)
    m ~ Normal(0,sqrt.(s))
    x[1] ~ Normal(m, sqrt.(s))
    x[2] ~ Normal(m, sqrt.(s))
    return s, m
end

sample(gdemo([1.5, 2]), IS(), 1000)
```


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/is.jl#L1-L29' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.MH' href='#Turing.Inference.MH'>#</a> **`Turing.Inference.MH`** &mdash; *Type*.


```julia
MH(space...)
```

Construct a Metropolis-Hastings algorithm. 

The arguments `space` can be 

  * Blank (i.e. `MH()`), in which case `MH` defaults to using the prior for each parameter as the proposal distribution.
  * A set of one or more symbols to sample with `MH` in conjunction with `Gibbs`, i.e. `Gibbs(MH(:m), PG(10, :s))`
  * An iterable of pairs or tuples mapping a `Symbol` to a `AdvancedMH.Proposal`, `Distribution`, or `Function`  that generates returns a conditional proposal distribution.
  * A covariance matrix to use as for mean-zero multivariate normal proposals.

**Examples**

The default `MH` will use propose samples from the prior distribution using `AdvancedMH.StaticProposal`.

```julia
@model function gdemo(x, y)
    s ~ InverseGamma(2,3)
    m ~ Normal(0, sqrt(s))
    x ~ Normal(m, sqrt(s))
    y ~ Normal(m, sqrt(s))
end

chain = sample(gdemo(1.5, 2.0), MH(), 1_000)
mean(chain)
```

Alternatively, you can specify particular parameters to sample if you want to combine sampling from multiple samplers:

`````julia
@model function gdemo(x, y)
    s ~ InverseGamma(2,3)
    m ~ Normal(0, sqrt(s))
    x ~ Normal(m, sqrt(s))
    y ~ Normal(m, sqrt(s))
end

# Samples s with MH and m with PG
chain = sample(gdemo(1.5, 2.0), Gibbs(MH(:s), PG(10, :m)), 1_000)
mean(chain)
````

Using custom distributions defaults to using static MH:

`````

julia @model function gdemo(x, y)     s ~ InverseGamma(2,3)     m ~ Normal(0, sqrt(s))     x ~ Normal(m, sqrt(s))     y ~ Normal(m, sqrt(s)) end

**Use a static proposal for s and random walk with proposal**

**standard deviation of 0.25 for m.**

chain = sample(     gdemo(1.5, 2.0),      MH(         :s => InverseGamma(2, 3),         :m => Normal(0, 1)     ),      1_000 ) mean(chain)

````

Specifying explicit proposals using the `AdvancedMH` interface:

```julia
@model function gdemo(x, y)
    s ~ InverseGamma(2,3)
    m ~ Normal(0, sqrt(s))
    x ~ Normal(m, sqrt(s))
    y ~ Normal(m, sqrt(s))
end

# Use a static proposal for s and random walk with proposal 
# standard deviation of 0.25 for m.
chain = sample(
    gdemo(1.5, 2.0), 
    MH(
        :s => AdvancedMH.StaticProposal(InverseGamma(2,3)),
        :m => AdvancedMH.RandomWalkProposal(Normal(0, 0.25))
    ), 
    1_000
)
mean(chain)
````

Using a custom function to specify a conditional distribution:

`````julia
@model function gdemo(x, y)
    s ~ InverseGamma(2,3)
    m ~ Normal(0, sqrt(s))
    x ~ Normal(m, sqrt(s))
    y ~ Normal(m, sqrt(s))
end

# Use a static proposal for s and and a conditional proposal for m,
# where the proposal is centered around the current sample.
chain = sample(
    gdemo(1.5, 2.0), 
    MH(
        :s => InverseGamma(2, 3),
        :m => x -> Normal(x, 1)
    ), 
    1_000
)
mean(chain)
````

Providing a covariance matrix will cause `MH` to perform random-walk
sampling in the transformed space with proposals drawn from a multivariate
normal distribution. The provided matrix must be positive semi-definite and square. Usage:

`````

julia @model function gdemo(x, y)     s ~ InverseGamma(2,3)     m ~ Normal(0, sqrt(s))     x ~ Normal(m, sqrt(s))     y ~ Normal(m, sqrt(s)) end

**Providing a custom variance-covariance matrix**

chain = sample(     gdemo(1.5, 2.0),      MH(         [0.25 0.05;           0.05 0.50]     ),      1_000 ) mean(chain) ````


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/mh.jl#L12-L150' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.NUTS' href='#Turing.Inference.NUTS'>#</a> **`Turing.Inference.NUTS`** &mdash; *Type*.


```julia
NUTS(n_adapts::Int, δ::Float64; max_depth::Int=5, Δ_max::Float64=1000.0, ϵ::Float64=0.0)
```

No-U-Turn Sampler (NUTS) sampler.

Usage:

```julia
NUTS()            # Use default NUTS configuration. 
NUTS(1000, 0.65)  # Use 1000 adaption steps, and target accept ratio 0.65.
```

Arguments:

  * `n_adapts::Int` : The number of samples to use with adaptation.
  * `δ::Float64` : Target acceptance rate for dual averaging.
  * `max_depth::Int` : Maximum doubling tree depth.
  * `Δ_max::Float64` : Maximum divergence during doubling tree.
  * `ϵ::Float64` : Inital step size; 0 means automatically searching using a heuristic procedure.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/hmc.jl#L284-L304' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.PG' href='#Turing.Inference.PG'>#</a> **`Turing.Inference.PG`** &mdash; *Type*.


```julia
struct PG{space, R} <: Turing.Inference.ParticleInference
```

Particle Gibbs sampler.

Note that this method is particle-based, and arrays of variables must be stored in a [`TArray`]({{site.baseurl}}/docs/library/#Libtask.TArray) object.

**Fields**

  * `nparticles::Int64`

    Number of particles.
  * `resampler::Any`

    Resampling algorithm.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/AdvancedSMC.jl#L154' class='documenter-source'>source</a><br>

### <a id='Turing.Inference.SMC' href='#Turing.Inference.SMC'>#</a> **`Turing.Inference.SMC`** &mdash; *Type*.


```julia
struct SMC{space, R} <: Turing.Inference.ParticleInference
```

Sequential Monte Carlo sampler.

**Fields**

  * `resampler::Any`


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/inference/AdvancedSMC.jl#L35' class='documenter-source'>source</a><br>


<a id='Distributions'></a>

<a id='Distributions-1'></a>

## Distributions

### <a id='Turing.Flat' href='#Turing.Flat'>#</a> **`Turing.Flat`** &mdash; *Type*.


```julia
Flat <: ContinuousUnivariateDistribution
```

A distribution with support and density of one everywhere.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/stdlib/distributions.jl#L4-L9' class='documenter-source'>source</a><br>

### <a id='Turing.FlatPos' href='#Turing.FlatPos'>#</a> **`Turing.FlatPos`** &mdash; *Type*.


```julia
FlatPos(l::Real)
```

A distribution with a lower bound of `l` and a density of one at every `x` above `l`.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/stdlib/distributions.jl#L20-L25' class='documenter-source'>source</a><br>

### <a id='Turing.BinomialLogit' href='#Turing.BinomialLogit'>#</a> **`Turing.BinomialLogit`** &mdash; *Type*.


```julia
BinomialLogit(n<:Real, I<:Integer)
```

A univariate binomial logit distribution.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/stdlib/distributions.jl#L40-L44' class='documenter-source'>source</a><br>


!!! warning "Missing docstring."
    Missing docstring for `VecBinomialLogit`. Check Documenter's build log for details.


### <a id='Turing.OrderedLogistic' href='#Turing.OrderedLogistic'>#</a> **`Turing.OrderedLogistic`** &mdash; *Type*.


```julia
OrderedLogistic(η::Any, cutpoints<:AbstractVector)
```

An ordered logistic distribution.


<a target='_blank' href='https://github.com/TuringLang/Turing.jl/blob/7f942864273f49f4bdda5c05e1411a54c498d6ec/src/stdlib/distributions.jl#L72-L76' class='documenter-source'>source</a><br>


<a id='Data-Structures'></a>

<a id='Data-Structures-1'></a>

## Data Structures

### <a id='Libtask.TArray' href='#Libtask.TArray'>#</a> **`Libtask.TArray`** &mdash; *Type*.


```julia
TArray{T}(dims, ...)
```

Implementation of data structures that automatically perform copy-on-write after task copying.

If current*task is an existing key in `s`, then return `s[current*task]`. Otherwise, return`s[current*task] = s[last*task]`.

Usage:

```julia
TArray(dim)
```

Example:

```julia
ta = TArray(4)              # init
for i in 1:4 ta[i] = i end  # assign
Array(ta)                   # convert to 4-element Array{Int64,1}: [1, 2, 3, 4]
```


<a id='Utilities'></a>

<a id='Utilities-1'></a>

## Utilities

### <a id='Libtask.tzeros' href='#Libtask.tzeros'>#</a> **`Libtask.tzeros`** &mdash; *Function*.


```julia
 tzeros(dims, ...)
```

Construct a distributed array of zeros. Trailing arguments are the same as those accepted by `TArray`.

```julia
tzeros(dim)
```

Example:

```julia
tz = tzeros(4)              # construct
Array(tz)                   # convert to 4-element Array{Int64,1}: [0, 0, 0, 0]
```


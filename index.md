@def title = "Turing.jl"
@def tags = ["syntax", "code"]

# Turing.jl: Bayesian inference with probabilistic programming

@@table-gallery
| Intuitive | General-purpose | Modular | High-performance |
|-----------|-----------------|---------|------------------|
| Turing models are easy to read and write — models work the way you write them. | Turing supports models with discrete parameters and stochastic control flow. Specify complex models quickly and easily. | Turing is modular, written fully in Julia, and can be modified to suit your needs. | Turing is [fast](https://arxiv.org/abs/2002.02702). |
@@

## Hello World in Turing — Linear Gaussian Model

@@row-flex
@@col-flex-large
Turing's modelling syntax allows you to specify a model quickly and easily. Straightforward models can be expressed in the same way as complex, hierarchical models with stochastic control flow.

[Get Started]()
@@
@@col-flex-small
```julia
@model gdemo(x, y) = begin
  # Assumptions
  σ ~ InverseGamma(2,3)
  μ ~ Normal(0,sqrt(σ))
  # Observations
  x ~ Normal(μ, sqrt(σ))
  y ~ Normal(μ, sqrt(σ))
end
```
@@
@@

## News

## Advanced Markov chain Monte Carlo samplers

@@row-flex
@@col-flex-small
![](/assets/sampler.svg)
@@
@@col-flex-large
Turing provides Hamiltonian Monte Carlo sampling for differentiable posterior distributions, Particle MCMC sampling for complex posterior distributions involving discrete variables and stochastic control flow, and Gibbs sampling which combines particle MCMC, HMC and many other MCMC algorithms.

[Samplers]()
@@
@@

## Interoperation with deep learning libraries

@@row-flex
@@col-flex-large
Turing supports Julia's Flux package for automatic differentiation. Combine Turing and Flux to construct probabilistic variants of traditional machine learning models.

[Bayesian Neural Network Tutrial]()
@@
@@col-flex-small
![](/assets/bnn.png)
@@
@@

## Community

Join the Turing community to contribute, learn and get your questions answered.

@@table-blocks
| GitHub | Discourse | Slack | 
|--------|-----------|-------|
| Report bugs, request features, discuss statistical applications/theory, and more. | Browse and join discussions on Turing. | Discuss advanced topics. ~~~<br>~~~ Request access [here](https://julialang.org/slack/). |
| [Go to GitHub](https://github.com/TuringLang/Turing.jl) | [Go to Discourse](https://discourse.julialang.org/c/domain/probprog) | [Go to Slack](https://julialang.slack.com/messages/turing/) | 
@@

## Ecosystem

Explore a rich ecosystem of libraries, tools, and more to support development.

@@table-blocks,table-no-border
| AdvancedHMC | MCMCChains | Bijectors | 
|-------------|------------|-----------|
| Robust, modular and efficient implementation of advanced Hamiltonian Monte Carlo algorithms. | Chain types and utility functions for MCMC simulations. | Automatic transformations for constrained random variables. |
| [Go to AdvancedHMC](https://github.com/TuringLang/AdvancedHMC.jl) | [Go to MCMCChains](https://github.com/TuringLang/MCMCChains.jl) | [Go to Bijectors](https://github.com/TuringLang/Bijectors.jl) | 
@@
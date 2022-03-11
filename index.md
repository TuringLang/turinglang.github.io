@def title = "Turing.jl"
@def tags = ["syntax", "code"]

# Turing.jl: Bayesian inference with probabilistic programming

@@grid,grid-cols-4,p-2
@@px-2
### Intuitive
Turing models are easy to read and write--models work the way you write them.
@@
@@px-2
### General-purpose
Specify complex models with discrete parameters and stochastic control flow easily.
@@
@@px-2
### Modular
Turing is modular, written fully in Julia and can be modified to suit your needs.
@@
@@px-2
### High-performance
Turing is [fast](https://arxiv.org/abs/2002.02702).
@@
@@

## Hello World in Turing: Linear Gaussian Model

@@grid,grid-cols-3
@@col-span-1
Turing's modelling syntax allows you to specify a model easily. 
Simple models can be expressed in the same way as complex, hierarchical models with stochastic control flow.

[Get Started]()
@@
@@col-span-1
### As math
\begin{align*}
  \sigma^2 &\sim \mathcal{I}\text{nverse}\mathcal{G}\text{amma}(2, 3) \\
     \mu &\sim \mathcal{N}\text{ormal}(0, \sigma^2) \\
       x &\sim \mathcal{N}\text{ormal}(0, \sigma^2) \\
       y &\sim \mathcal{N}\text{ormal}(0, \sigma^2) \\
\end{align*}
@@
@@col-span-1
### As Turing program
```julia
@model function gdemo(x, y)
  # Assumptions
  σ² ~ InverseGamma(2, 3)
  μ ~ Normal(0, sqrt(σ²))
  # Observations
  x ~ Normal(μ, sqrt(σ²))
  y ~ Normal(μ, sqrt(σ²))
end
```
@@
@@

## News

[All news](/news/)

## Advanced Markov chain Monte Carlo samplers

@@grid,grid-cols-5
@@col-span-2
![](/assets/sampler.svg)
@@
@@col-span-3
Turing provides Hamiltonian Monte Carlo sampling for differentiable posterior distributions, Particle MCMC sampling for complex posterior distributions involving discrete variables and stochastic control flow, and Gibbs sampling which combines particle MCMC, HMC and many other MCMC algorithms.

[Samplers]()
@@
@@

## Interoperation with deep learning libraries

@@grid,grid-cols-5
@@col-span-3
Turing supports Julia's Flux package for automatic differentiation. Combine Turing and Flux to construct probabilistic variants of traditional machine learning models.

[Bayesian Neural Network Tutrial]()
@@
@@col-span-2
![](/assets/bnn.png)
@@
@@

## Community

Join the Turing community to contribute, learn and get your questions answered.

@@grid,grid-cols-3,gap-4,p-4
@@border,border-slate-700,p-4,pb-8,relative
### GitHub
Report bugs, request features, discuss statistical applications/theory, and more.
@@absolute,bottom-0,right-0,p-2
[Go to GitHub](https://github.com/TuringLang/Turing.jl)
@@
@@
@@border,border-slate-700,p-4,pb-8,relative
### Discourse
Browse and join discussions on Turing.
@@absolute,bottom-0,right-0,p-2
[Go to Discourse](https://discourse.julialang.org/c/domain/probprog)
@@
@@
@@border,border-slate-700,p-4,pb-8,relative
### Slack
Discuss advanced topics.
Request access [here](https://julialang.org/slack/).
@@absolute,bottom-0,right-0,p-2
[Go to Slack](https://julialang.slack.com/messages/turing/)
@@
@@
@@

## Ecosystem

Explore a rich ecosystem of libraries, tools, and more to support development.

@@grid,grid-cols-3,gap-4,p-4
@@p-4
### AdvancedHMC
Robust, modular and efficient implementation of advanced Hamiltonian Monte Carlo algorithms.

[Go to AdvancedHMC](https://github.com/TuringLang/AdvancedHMC.jl)
@@
@@p-4
### MCMCChains
Chain types and utility functions for MCMC simulations.

[Go to MCMCChains](https://github.com/TuringLang/MCMCChains.jl)
@@
@@p-4
### Bijectors
Automatic transformations for constrained random variables.

[Go to Bijectors](https://github.com/TuringLang/Bijectors.jl)
@@
@@

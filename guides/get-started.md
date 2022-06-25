@def title = "Get Started"

# Get Started

## Installation

To use Turing, you need to install Julia first and then install Turing via Julia.

### Install Julia

You will need Julia 1.3 or greater, which you can get from [the downloads page](http://julialang.org/downloads/) of Julia's official website.


### Install Turing.jl

Turing is available from the Julia package `Turing.jl`. 
As it is officially registered, you can install it using Julia's built-in package manager `Pkg`.

```julia
julia> using Pkg; Pkg.add("Turing")
```

Note above installs the stable version of Turing.
To install the version on the `master` branch, do `Pkg.add("Turing#master")` instead.

## Simple example

Below is a simple example showing the package in action.

```julia
# Load Turing and a plotting package
using Turing, StatsPlots
# Define a simple Gaussian model with unknown mean and variance.
@model function gauss_unknown(x, y)
    # Assumptions
    σ² ~ InverseGamma(2, 3)
    μ  ~ Normal(0, sqrt(σ²))
    # Observations
    x  ~ Normal(μ, sqrt(σ²))
    y  ~ Normal(μ, sqrt(σ²))
end
# Collect 1,000 samples using the HMC sampler
chain = sample(gauss_unknown(1.5, 2), HMC(0.1, 5), 1_000)
# Summarise inference results
describe(chain)
# Plot and save results
plot(chain)
savefig("gauss_unknown.png")
```
```
\begin{align*}
    \sigma^2 &\sim \text{InverseGamma}(3, 4/10) \\
    \gamma &\sim \mathcal{N}(0, \sqrt{10}) \\
    \beta &\sim \mathcal{N}(0, I) \\
    y_i &\sim \log \mathcal{N}(\beta \cdot x_i + \gamma, \sigma) \quad \text{for } i = 1, \dots, N
\end{align*}
```

to Turing.jl:

Let's give id 1 to this block
```julia
@model function linear_regression(x)
    d = size(x, 1)
    
    # Priors
    σ² ~ InverseGamma(3, 4 / 10)
    γ ~ Normal(0, √10)
    β ~ MvNormal(zeros(d), I)
    
    # Likelihood
    y ~ MvLogNormal(x' * β .+ γ, σ² * I) 
end

model = linear_regression(x_data)
```

From id 1 to Prior Checks:

```julia
model_gen = fix(model, params_gen)
(; y) = rand(model_gen)
chain_gen = sample(model | (y = y,), NUTS(), 1000)
```

From Prior Checks to Determinability (ID 2):

PLOT Image

From ID 1, also goes Condition:

```julia
model_conditioned = model | (y = y_data,)
```

Condtion to Perform Inference:

```julia
chain = sample(model_conditioned, NUTS(), 1000)
```

Perform Inference to Post-inference Analysis:

```
Summary Statistics
parameters    mean      std      mcse     ...
Symbol        Float64   Float64  Float64  ...

σ²            0.0543    0.0032   0.0000   ...
γ             7.7252    0.3688   0.0066   ...
β[1]          -0.2270   0.1247   0.0022   ...
β[2]          0.0133    0.1229   0.0022   ...
```

Plot Image

Then to Posterior Predictions (ID 3):

Plot image

From ID 3 to ID 2 (Determinability) in a dashed line arrow with label "Iterate if necessary"
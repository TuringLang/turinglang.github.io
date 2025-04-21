using Distributions, Plots, Colors

# Gaussian with known variance
# mu ~ Normal(mu0, sig0)
# xi ~ Normal(mu, sig_like)
# Ref: https://en.wikipedia.org/wiki/Conjugate_prior#Continuous_distributions
function get_posterior_parameters(xs, mu0, sig0, siglike)
    n = length(xs)
    var = inv(1 / sig0^2 + n / siglike^2)
    mu = var * (mu0 / sig0^2 + sum(xs) / siglike^2)
    return mu, sqrt(var)
end

function turinglogo(filename::String; figsize=(450, 300))
    default(size=figsize, leg=false)

    mu0, sig0, siglike = 0.0, 1.0, 1.0
    prior = Normal(mu0, sig0)
    # Inference with one datum
    obs = [5.0]
    post1 = Normal(get_posterior_parameters(obs, mu0, sig0, siglike)...)
    # Inference with more data
    push!(obs, 1.0)
    post2 = Normal(get_posterior_parameters(obs, mu0, sig0, siglike)...)

    julia_purple = parse(Colorant, RGBA(0.702, 0.322, 0.8))
    julia_brown  = parse(Colorant, RGBA(0.8, 0.2, 0.2))
    julia_green  = parse(Colorant, RGBA(0.133, 0.541, 0.133))

    xs = -3:0.01:5
    lw = 15.0
    fig = plot(xs,  pdf.(Ref(prior), xs), color=julia_purple, linewidth=lw, grid=false)
    plot!(xs, pdf.(Ref(post1), xs), color=julia_brown,  linewidth=lw)
    plot!(xs, pdf.(Ref(post2), xs), color=julia_green,  linewidth=lw)
    xaxis!(false)
    yaxis!(false)

    display(fig)

    for suffix in ("png", "svg")
        savefig(joinpath(@__DIR__, "$filename.$suffix"))
    end
end

turinglogo("../images/logo-small";  figsize=(450, 300))
turinglogo("../images/logo-medium"; figsize=(600, 400))
turinglogo("../images/logo-large";  figsize=(750, 500))

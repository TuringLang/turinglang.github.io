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

    julia_purple = parse(Colorant, RGBA(0.702, 0.322, 0.8,   0.3))
    julia_brown  = parse(Colorant, RGBA(0.8,   0.2,   0.2,   0.6))
    julia_green  = parse(Colorant, RGBA(0.133, 0.541, 0.133, 1.0))

    # mu0, sig0, siglike = 0.0, 1.0, 1.0
    # prior = Normal(mu0, sig0)
    # # Inference with one datum
    # obs = [5.0]
    # post1 = Normal(get_posterior_parameters(obs, mu0, sig0, siglike)...)
    # # Inference with more data
    # push!(obs, 1.0)
    # post2 = Normal(get_posterior_parameters(obs, mu0, sig0, siglike)...)
    # x = -3:0.01:5
    # lw = 20.0
    # ms = 11.8
    # ymin = -0.1
    # xext = 3
    # yext = 0.4

    prior = Beta(2, 3)
    post1 = Beta(4, 4)
    post2 = Beta(8, 5)
    x = 0:0.01:1
    lw = 20.0
    ms = 11.5
    ymin = -0.3
    xext = 0.4
    yext = 2.0

    fig = plot(background_color=RGBA(0.16, 0.15, 0.216, 1.0), grid=false)
    yprior = pdf.(Ref(prior), x)
    plot!(x, yprior; color=julia_purple, linewidth=lw)
    scatter!(
        [x[1], x[end]], [yprior[1], yprior[end]];
        markercolor=julia_purple, markeralpha=0.3, markersize=ms, markerstrokewidth=0
    )
    ypost1 = pdf.(Ref(post1), x)
    plot!(x, ypost1; color=julia_brown,  linewidth=lw)
    scatter!(
        [x[1], x[end]], [ypost1[1], ypost1[end]];
        markercolor=julia_brown, markeralpha=0.6, markersize=ms, markerstrokewidth=0
    )
    ypost2 = pdf.(Ref(post2), x)
    plot!(x, ypost2; color=julia_green,  linewidth=lw)
    scatter!(
        [x[1], x[end]], [ypost2[1], ypost2[end]];
        markercolor=julia_green, markeralpha=1.0, markersize=ms, markerstrokewidth=0
    )
    xxaxis, yxaxis = [x[1], x[end]], [ymin, ymin]
    plot!(xxaxis, yxaxis; color=:white, alpha=1.0, linewidth=lw)
    scatter!(
        xxaxis, yxaxis;
        markercolor=:white, markeralpha=1.0, markersize=ms, markerstrokewidth=0
    )
    ymax = max(yprior..., ypost1..., ypost2...)
    xlims!(-x[1] - xext, x[end] + xext)
    ylims!(ymin - yext, ymax + yext)
    xaxis!(false)
    yaxis!(false)

    display(fig)

    for suffix in ("png", "svg")
        savefig(joinpath(@__DIR__, "$filename.$suffix"))
    end
end

turinglogo("../images/logo-small";  figsize=(450, 450))
turinglogo("../images/logo-medium"; figsize=(600, 600))
turinglogo("../images/logo-large";  figsize=(750, 750))

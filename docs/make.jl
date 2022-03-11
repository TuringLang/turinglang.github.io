using Documenter
include("page.jl")

using AdvancedHMC

makedocs(
    sitename="Turing.jl",
    build=joinpath(@__DIR__, "../__site/documentation"),
    modules=[AdvancedHMC],
    format = Documenter.HTML(
        assets = ["assets/style.css"],
    ),
)
using Pkg
Pkg.instantiate()

using Documenter
include("page.jl")

using Turing, AdvancedHMC

makedocs(
    sitename="The Turing Language",
    build=joinpath(@__DIR__, "../__site/documentation"),
    modules=[Turing, AdvancedHMC],
    format = Documenter.HTML(
        assets = ["assets/style.css"],
    ),
)
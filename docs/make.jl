using Pkg
Pkg.instantiate()

using Documenter, TuringWeb

using AdvancedHMC

makedocs(
    sitename="The Turing Language",
    build=joinpath(@__DIR__, "../__site/documentation"),
    modules=[AdvancedHMC],
)
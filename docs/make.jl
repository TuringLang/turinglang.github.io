using Pkg
Pkg.instantiate()

using Documenter, TuringWeb

using Turing: Turing
using Turing.Inference: AdvancedHMC
using Turing.Essential: Bijectors

makedocs(
    sitename="Turing Documentations",
    build=joinpath(@__DIR__, "../__site/docs"),
    modules=[AdvancedHMC, Bijectors],
    pages = [
        "Home" => "index.md",
        "Developer Guides" => [
            "developer-guides/compiler-design.md",
            "developer-guides/sampling-interface.md",
            "developer-guides/turing-abstractmcmc.md",
            "developer-guides/how-to-contribute.md",
            "developer-guides/style-guide.md",
        ],
        "turing.md",
        "advancedhmc.md",
        "bijectors.md",
    ]
)
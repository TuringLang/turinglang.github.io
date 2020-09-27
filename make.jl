import Pkg
Pkg.activate(".")

using Documenter, DocumenterMarkdown, Turing, AdvancedHMC, Bijectors, AdvancedMH
using LibGit2: clone, tag_list, GitRepo

# Include the utility functions.
include("make-utils.jl")

# Find the package directory
package_directory = dirname(dirname(pathof(Turing)))
source_path = joinpath(package_directory, "docs", "src")

# Paths.
build_path = joinpath(@__DIR__, "_docs")

# Build docs
with_clean_docs(source_path, build_path) do source, build
    makedocs(
        sitename = "Turing.jl",
        source = source,
        build = build,
        format = Markdown(),
        checkdocs = :all,
    )
end

# You can skip this part if you are on a metered
# connection by calling `julia make.jl no-tutorials`
tutorial_path = joinpath(@__DIR__, "_tutorials")
in("no-tutorials", ARGS) || copy_tutorial(tutorial_path)

# set default baseurl for the master branch
baseurl = "/turing.ml/" * ENV["TURING_VERSION"]

@info "" baseurl

# deploy
devurl = "dev"

jekyll_build = joinpath(@__DIR__, "jekyll-build")
with_baseurl(() -> run(`$jekyll_build`), baseurl)

# repo = "github.com:TuringLang/Turing.jl.git"

deploydocs(
    target = "_site",
    # repo = repo,
    repo = "github.com:cpfiffer/turing.ml.git",
    branch = "gh-pages",
    devbranch = "master",
    devurl = devurl,
    versions = ["stable" => "v^", "v#.#", devurl => devurl]
)

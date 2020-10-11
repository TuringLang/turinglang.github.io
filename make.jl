import Pkg
Pkg.activate(".")

using Documenter, DocumenterMarkdown, Turing, AdvancedHMC, Bijectors, AdvancedMH
using LibGit2: clone, tag_list, GitRepo

# Include the utility functions.
include("make-utils.jl")

# Get the version number
trim_version(x) = x[1:findlast('.', x) - 1]
version = if haskey(ENV, "TURING_VERSION")
    ENV["TURING_VERSION"]
else
    if length(ARGS) > 0
        trim_version(ARGS[1])
    else
        error("Version unknown")
    end
end

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
baseurl = "/turing.ml/" * version

@info "" baseurl

# deploy
jekyll_build = joinpath(@__DIR__, "jekyll-build")
with_baseurl(() -> run(`$jekyll_build`), baseurl)

deploydocs(
    target = "_site",
    repo = "github.com:cpfiffer/turing.ml.git",
    branch = "gh-pages",
    devbranch = "master",
    devurl = "dev",
    versions = ["stable" => "v^", "v#.#", "dev" => "dev"]
)

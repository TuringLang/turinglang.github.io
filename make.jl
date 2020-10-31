import Pkg
Pkg.activate(".")

using Documenter, DocumenterMarkdown, Turing, AdvancedHMC, Bijectors, AdvancedMH
using LibGit2: clone, tag_list, GitRepo
using Documenter: GitHubActions

# Include the utility functions.
include("make-utils.jl")

# Get the version number
trim_version(x) = x[1:findlast('.', x) - 1]

version, is_dev = if haskey(ENV, "TURING_VERSION")
    ENV["TURING_VERSION"], true
else
    if length(ARGS) > 0
        trim_version(ARGS[1]), false
    else
        error("Version unknown")
    end
end

# Find the package directory
package_directory = dirname(dirname(pathof(Turing)))
source_path = joinpath(package_directory, "docs", "src")

# Paths.
build_path = joinpath(package_directory, "_docs")

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
tutorial_path = joinpath(package_directory, "docs", "_tutorials")
in("no-tutorials", ARGS) || copy_tutorial(tutorial_path)

# set default baseurl for the master branch
baseurl = "/" * version

@info "" baseurl

# deploy
jekyll_build = joinpath(@__DIR__, "jekyll-build")
with_baseurl(() -> run(`$jekyll_build`), baseurl)
repo = "github.com:cpfiffer/turing.ml.git"

deploy_config = GitHubActions(
    "cpfiffer/turing.ml", #github_repository::String
    "push", #github_event_name::String
    is_dev ? "refs/branch/master" : "refs/tags/$(ARGS[1])" #github_ref::String
)

deploydocs(
    target = "_site",
    repo = repo,
    branch = "gh-pages",
    devbranch = "master",
    devurl = "dev",
    versions = ["stable" => "v^", "v#.#", "dev" => "dev"],
    deploy_config = deploy_config
)

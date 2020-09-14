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
baseurl = "/dev"

# deploy
devurl = "dev"
tags = tag_list(GitRepo(package_directory))
versions = VersionNumber.(tags)

# Find the most recent tag
function highest_tags(versions)
    majors = unique(map(x -> x.major, versions))
    tags_to_use = []

    for major in majors
        filtered = filter(x -> x.major == major, versions)
        minors = unique(map(x -> x.minor, filtered))

        for minor in minors
            minor_filtered = sort(filter(x -> x.minor == minor, filtered))
            
            push!(tags_to_use, minor_filtered[end])
        end
    end
    return sort(tags_to_use)
end

highest = maximum(highest_tags(versions))

# set baseurl for version tag when current head is tagged
vtag = "v" * string(highest)

version_match = match(r"^(v\d+\.\d+\.\d+)$", vtag)
if !isnothing(version_match)
    baseurl = "/" * version_match[1]
end

jekyll_build = joinpath(@__DIR__, "jekyll-build")
with_baseurl(() -> run(`$jekyll_build`), baseurl)

repo = "github.com:TuringLang/Turing.jl.git"

# Lying to GitHub
# ENV["GITHUB_REPOSITORY"] = "TuringLang/Turing.jl"

deploydocs(
    target = "_site",
    # repo = repo,
    repo = "github.com:cpfiffer/turing.ml.git",
    branch = "gh-pages",
    devbranch = "master",
    devurl = devurl,
    versions = ["stable" => "v^", "v#.#", devurl => devurl]
)

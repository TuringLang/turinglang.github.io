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
    if ENV["TURING_VERSION"] == "dev"
        ENV["TURING_VERSION"], true
    else
        ENV["TURING_VERSION"], false
    end
else
    if length(ARGS) > 0
        trim_version(ARGS[1]), false
    else
        "dev", true
    end
end

# set default baseurl for the master branch
baseurl = "/" * version
@info "" baseurl

# Make a temporary folder to build from
tmp_path = mktempdir(cleanup=false)

# Paths
## The location of the package to build (Turing())
package_directory = dirname(dirname(pathof(Turing)))
## The location of the docs folder inside that package
docs_path = joinpath(package_directory, "docs")
## The src files for the docs -- markdown documents, typically.
source_path = joinpath(package_directory, "docs", "src")
## The path of turing.ml that we are running this code from.
local_path = @__DIR__
## The place to put the files from source_path after they go through Documenter.jl
build_path = joinpath(local_path, "_docs")

# Get any files from Turing's directory
for (root, dirs, files) in walkdir(docs_path)
    new_root = replace(root, docs_path => build_path)

    for file in files
        old_file = joinpath(root, file)
        new_file = joinpath(new_root, file)
        @debug "" old_file new_file
        if !isdir(dirname(new_file))
            mkpath(dirname(new_file))
        end
        cp(old_file, new_file, force=true)
    end
end

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
tutorial_path = joinpath(tmp_path, "_tutorials")
in("no-tutorials", ARGS) || copy_tutorial(tutorial_path)

# deploy
old_jekyll_build = joinpath(local_path, "jekyll-build")
with_baseurl(() -> run(`$old_jekyll_build`), baseurl, joinpath(local_path, "_config.yml"))

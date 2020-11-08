import Pkg
Pkg.activate(".")

using Documenter, DocumenterMarkdown, Turing, AdvancedHMC, Bijectors, AdvancedMH
using LibGit2: clone, tag_list, GitRepo
using Documenter: GitHubActions

# Include the utility functions.
include("make-utils.jl")

# Get the version number
trim_version(x) = x[1:findlast('.', x) - 1]

# Set this ENV to "master" to trigger deploydocs.
# Without this line, Documenter.jl and GH Actions
# won't deploy the docs.
ENV["GITHUB_REF"] = "master"

version, is_dev = if haskey(ENV, "TURING_VERSION")
    ENV["TURING_VERSION"], true
else
    if length(ARGS) > 0
        trim_version(ARGS[1]), false
    else
        "dev", true
    end
end

# Make a temporary folder to build from
tmp_path = mktempdir()

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
build_path = joinpath(tmp_path, "_docs")

# Get any files from Turing's directory
for (root, dirs, files) in walkdir(docs_path)
    new_root = replace(root, docs_path => tmp_path)

    for file in files
        old_file = joinpath(root, file)
        new_file = joinpath(new_root, file)
        @debug "" old_file new_file
        if !isdir(dirname(new_file))
            mkpath(dirname(new_file))
        end
        cp(old_file, new_file)
    end
end

# Copy all the local files to the temporary path
paths = readdir(local_path, join=true)
filter!(x -> !(basename(x) in ["make.jl", "make-utils.jl"]), paths)
for path in paths
    new_path = replace(path, local_path => tmp_path)
    @debug "" path new_path
    cp(path, new_path, force=true)
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

# set default baseurl for the master branch
baseurl = "/" * version

@info "" baseurl

# deploy
old_jekyll_build = joinpath(local_path, "jekyll-build")
new_jekyll_build = joinpath(tmp_path, "jekyll-build")

# Move jekyll-build to the temporary path
cp(old_jekyll_build, new_jekyll_build, force=true)
with_baseurl(() -> run(`$new_jekyll_build`), baseurl, joinpath(local_path, "_config.yml"))
repo = "github.com:TuringLang/turing.ml.git"

deploy_config = GitHubActions(
    "TuringLang/turing.ml", #github_repository::String
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

using MultiDocumenter

clonedir = mktempdir()

docs = [
        MultiDocumenter.DropdownNav("Modelling languages", [
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "DynamicPPL"),
                    path = "DynamicPPL",
                    name = "DynamicPPL",
                    giturl = "https://github.com/TuringLang/DynamicPPL.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "SymbolicPPL"),
                    path = "SymbolicPPL",
                    name = "SymbolicPPL",
                    giturl = "https://github.com/TuringLang/SymbolicPPL.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "TuringGLM"),
                    path = "TuringGLM",
                    name = "TuringGLM",
                    giturl = "https://github.com/TuringLang/TuringGLM.jl.git",
                ),
        ]),
        #= 
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "Turing"),
            path = "Turing",
            name = "Turing",
            giturl = "https://github.com/TuringLang/Turing.jl.git",
        ),
        =#
        MultiDocumenter.DropdownNav("MCMC", [
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "AdvancedHMC"),
                    path = "AdvancedHMC",
                    name = "AdvancedHMC",
                    giturl = "https://github.com/TuringLang/AdvancedHMC.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "AbstractMCMC"),
                    path = "AbstractMCMC",
                    name = "AbstractMCMC",
                    giturl = "https://github.com/TuringLang/AbstractMCMC.jl.git",
                ),
                #= 
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "AdvancedMH"),
                    path = "AdvancedMH",
                    name = "AdvancedMH",
                    giturl = "https://github.com/TuringLang/AdvancedMH.jl.git",
                ),
                =#
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "ThermodynamicIntegration"),
                    path = "ThermodynamicIntegration",
                    name = "ThermodynamicIntegration",
                    giturl = "https://github.com/theogf/ThermodynamicIntegration.jl.git",
                ),
                # See also: https://github.com/treigerm/AnnealedIS.jl and MCMCTempering.jl
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "AdvancedPS"),
                    path = "AdvancedPS",
                    name = "AdvancedPS",
                    giturl = "https://github.com/TuringLang/AdvancedPS.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "EllipticalSliceSampling"),
                    path = "EllipticalSliceSampling",
                    name = "EllipticalSliceSampling",
                    giturl = "https://github.com/TuringLang/EllipticalSliceSampling.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "NestedSamplers"),
                    path = "NestedSamplers",
                    name = "NestedSamplers",
                    giturl = "https://github.com/TuringLang/NestedSamplers.jl.git",
                ),
        ]),
        MultiDocumenter.DropdownNav("Diagnostics", [
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "MCMCChains"),
                    path = "MCMCChains",
                    name = "MCMCChains",
                    giturl = "https://github.com/TuringLang/MCMCChains.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "MCMCDiagnosticTools"),
                    path = "MCMCDiagnosticTools",
                    name = "MCMCDiagnosticTools",
                    giturl = "https://github.com/TuringLang/MCMCDiagnosticTools.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "ParetoSmooth"),
                    path = "ParetoSmooth",
                    name = "ParetoSmooth",
                    giturl = "https://github.com/TuringLang/ParetoSmooth.jl.git",
                ),
        ]),
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "Bijectors"),
            path = "Bijectors",
            name = "Bijectors",
            giturl = "https://github.com/TuringLang/Bijectors.jl.git",
        ),
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "TuringCallbacks"),
            path = "TuringCallbacks",
            name = "TuringCallbacks",
            giturl = "https://github.com/TuringLang/TuringCallbacks.jl.git",
        ),
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "Benchmarking"),
            path = "TuringBenchmarking",
            name = "TuringBenchmarking",
            giturl = "https://github.com/torfjelde/TuringBenchmarking.jl.git",
        ),
        MultiDocumenter.DropdownNav("Gaussian Processes", [
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "AbstractGPs"),
                    path = "AbstractGPs",
                    name = "AbstractGPs",
                    giturl = "https://github.com/JuliaGaussianProcesses/AbstractGPs.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "KernelFunctions"),
                    path = "KernelFunctions",
                    name = "KernelFunctions",
                    giturl = "https://github.com/JuliaGaussianProcesses/KernelFunctions.jl.git",
                ),
                MultiDocumenter.MultiDocRef(
                    upstream = joinpath(clonedir, "ApproximateGPs"),
                    path = "ApproximateGPs",
                    name = "ApproximateGPs",
                    giturl = "https://github.com/JuliaGaussianProcesses/ApproximateGPs.jl.git",
                ),
        ]),
]

outpath = joinpath(@__DIR__, "html")

# TODO: Remove if MultiDocumenter.jl ever ends up supporting non-root hosting.
# Related issue: https://github.com/JuliaComputing/MultiDocumenter.jl/issues/36
# HACK: Make search work properly.
multidoc_path = "library"

function MultiDocumenter.FlexSearch.generate_index(root, docs, config)
    search_index = MultiDocumenter.FlexSearch.SearchIndex()
    MultiDocumenter.FlexSearch.walk_outputs(root, docs, config.index_versions) do path, file
        MultiDocumenter.FlexSearch.add_to_index!(search_index, "/$(multidoc_path)" * path, file)
    end

    return search_index
end

MultiDocumenter.make(
    outpath,
    docs;
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    )
)

# HACK: Make search work properly.
let path = joinpath(outpath, "assets", "default", "flexsearch_integration.js")
    write(path, replace(read(path, String), "/search-data/" => "/$(multidoc_path)/search-data/"))
end

# Deploy to Github with running as a Github action
if haskey(ENV, "GITHUB_ACTIONS")
    output_dir = multidoc_path
    mkpath(output_dir)
    multidocroot = normpath(joinpath(@__DIR__, "..", output_dir))
    run(`git pull`)
    outbranch = "gh-pages"
    has_outbranch = true
    if !success(`git checkout $outbranch`)
        has_outbranch = false
        if !success(`git switch --orphan $outbranch`)
            @error "Cannot create new orphaned branch $outbranch."
            exit(1)
        end
    end
    for file in readdir(multidocroot; join = true)
        endswith(file, ".git") && continue
        rm(file; force = true, recursive = true)
    end
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(multidocroot, file))
    end
    run(`git add $(output_dir)`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout master`)
    else
        @info "No changes to aggregated documentation."
    end
end

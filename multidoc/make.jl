using MultiDocumenter

clonedir = mktempdir()

docs = [
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "Bijectors"),
            path = "Bijectors",
            name = "Bijectors",
            giturl = "https://github.com/TuringLang/Bijectors.jl.git",
        ),
        #= 
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "Turing"),
            path = "Turing",
            name = "Turing",
            giturl = "https://github.com/TuringLang/Turing.jl.git",
        ),
        =#
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
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "MCMCChains"),
            path = "MCMCChains",
            name = "MCMCChains",
            giturl = "https://github.com/TuringLang/MCMCChains.jl.git",
        ),
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "AdvancedPS"),
            path = "AdvancedPS",
            name = "AdvancedPS",
            giturl = "https://github.com/TuringLang/AdvancedPS.jl.git",
        ),
]

outpath = joinpath(@__DIR__, "html")

MultiDocumenter.make(
    outpath,
    docs;
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    )
)

# Deploy to Github with running as a Github action
if haskey(ENV, "GITHUB_ACTIONS")
    multidoc-root = normpath(joinpath(@__DIR__, "../multidoc-preview/"))
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
    for file in readdir(multidoc-root; join = true)
        endswith(file, ".git") && continue
        rm(file; force = true, recursive = true)
    end
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(multidoc-root, file))
    end
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout main`)
    else
        @info "No changes to aggregated documentation."
    end
end

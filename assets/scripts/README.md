This `scripts` folder contains utilities for building Turing language satellite packages' documentation. 

- `insert_navbar.sh`: This function inserts a MultiDocumenter-style top navigation bar to `Documenter.jl` generated sites.
- `navbar.html`: the content of the top navigation bar inserted by `insert_navbar.sh`.

## How to use

Add a new Github Actions workflow, `DocsNav.yml` in your `main` or `master` branch and update 5th line, `workflows` in `DocsNav.yml` by adding your other workflow names that are generating docs site, previews and publishing them to gh-pages branch.

You can find `DocsNav.yml` template [here](DocsNav.yml).

See https://github.com/TuringLang/AbstractMCMC.jl/pull/141 for an example. 

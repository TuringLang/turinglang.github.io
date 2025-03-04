This `scripts` folder contains utilities for building Turing language satellite packages' documentation. 

- `insert_navbar.sh`: This function inserts a MultiDocumenter-style top navigation bar to `Documenter.jl` generated sites.
- `TuringNavbar.html`: the content of the top navigation bar inserted by `insert_navbar.sh`.

## How to use

Add a new Github Actions workflow, `DocsNav.yml`, in your default branch.

You can find `DocsNav.yml` template [here](DocsNav.yml).
Update the NAVBAR URL in case you want to use another navigation bar and make sure NAVBAR START AND NAVBAR END comments are there in your new navigation bar.

See [AbstractMCMC.jl](https://github.com/TuringLang/AbstractMCMC.jl/blob/main/.github/workflows/DocsNav.yml) for an example. 

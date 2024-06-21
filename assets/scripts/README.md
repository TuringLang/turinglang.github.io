This `scripts` folder contains utilities for building Turing language satellite packages' documentation. 

- `insert_navbar.sh`: This function inserts a MultiDocumenter-style top navigation bar to `Documenter.jl` generated sites.
- `navbar.html`: the content of the top navigation bar inserted by `insert_navbar.sh`.

## How to use

Add the following line after `makedocs()` function in `docs/make.jl` of each package:

```julia
# Insert navbar in each html file
run(`sh -c "curl -s https://raw.githubusercontent.com/TuringLang/turinglang.github.io/main/assets/scripts/insert_navbar.sh | bash -s docs/build"`)
```

See https://github.com/TuringLang/AbstractMCMC.jl/pull/141 for an example. 

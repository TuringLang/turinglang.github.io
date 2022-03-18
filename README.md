# Turing website and web utilities

The new Turing website built via [Frankln.jl](https://franklinjl.org/).

## Local development

To develop the website locally, first clone this repo and do the following

1. Activate the environment by `]activate .` and then instantiate it by `]instantiate`
2. Start Frankln's server mode by `using Franklin; serve()`---this will open a page in your browser
3. Edit source files (`index.md`, `news.md`, `team.md`, etc) and changes will be reflected in the page automatically

Note that the generated site is located in `__site`, which should NOT be edited directly.

For more information, please consult [Frankln's official guide](https://franklinjl.org/workflow/).

### Styling tips

To reduce the complexity of styling the website,
[Tailwind CSS](https://tailwindcss.com/docs) is heavily used together with Frankln's `@@` syntax---see `index.md` for an example.
We recommend doing similar styling using Tailwind CSS than writing external CSS in `_css/turinglang.css`.

## The `TuringWeb` utility

`src/TuringWeb.jl` provides a reusable Turing customization to Documenter.jl by providing the same top navigation bar as the home page.
See the [`docs` folder of AdvancedHMC.jl](https://github.com/TuringLang/AdvancedHMC.jl/tree/master/docs) for an example of how to use it.
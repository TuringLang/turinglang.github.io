@def title = "Task Copying"

# Task Copying in Turing

Turing [copies](https://github.com/JuliaLang/julia/issues/4085) Julia tasks to deliver efficient inference algorithms, but it also provides alternative slower implementation as a fallback. Task copying is enabled by default. Task copying requires us to use the `TapedTask` facility which is provided by [Libtask](https://github.com/TuringLang/Libtask.jl) to create tasks.
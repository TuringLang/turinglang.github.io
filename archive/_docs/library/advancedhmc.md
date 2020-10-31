---
title: AdvancedHMC
permalink: /docs/library/advancedhmc/
toc: true
---

<a id='Index'></a>

<a id='Index-1'></a>

## Index

- [`AdvancedHMC.AbstractIntegrator`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.AbstractIntegrator)
- [`AdvancedHMC.AbstractProposal`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.AbstractProposal)
- [`AdvancedHMC.AbstractTrajectory`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.AbstractTrajectory)
- [`AdvancedHMC.AbstractTrajectorySampler`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.AbstractTrajectorySampler)
- [`AdvancedHMC.BinaryTree`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.BinaryTree)
- [`AdvancedHMC.ClassicNoUTurn`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.ClassicNoUTurn)
- [`AdvancedHMC.EndPointTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.EndPointTS)
- [`AdvancedHMC.GeneralisedNoUTurn`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.GeneralisedNoUTurn)
- [`AdvancedHMC.HMCDA`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.HMCDA)
- [`AdvancedHMC.JitteredLeapfrog`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.JitteredLeapfrog)
- [`AdvancedHMC.Leapfrog`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.Leapfrog)
- [`AdvancedHMC.MultinomialTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.MultinomialTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint})
- [`AdvancedHMC.MultinomialTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.MultinomialTS-Tuple{MultinomialTS,AbstractFloat,AdvancedHMC.PhasePoint})
- [`AdvancedHMC.MultinomialTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.MultinomialTS)
- [`AdvancedHMC.NUTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.NUTS)
- [`AdvancedHMC.NUTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.NUTS-Tuple)
- [`AdvancedHMC.NUTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.NUTS-Union{Tuple{I}, Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{I,Int64}, Tuple{I,Int64,F}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator)
- [`AdvancedHMC.SliceTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.SliceTS)
- [`AdvancedHMC.SliceTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.SliceTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint})
- [`AdvancedHMC.SliceTS`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.SliceTS-Tuple{SliceTS,AbstractFloat,AdvancedHMC.PhasePoint})
- [`AdvancedHMC.StaticTrajectory`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.StaticTrajectory)
- [`AdvancedHMC.StrictGeneralisedNoUTurn`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.StrictGeneralisedNoUTurn)
- [`AdvancedHMC.TemperedLeapfrog`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.TemperedLeapfrog)
- [`AdvancedHMC.Termination`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.Termination)
- [`AdvancedHMC.Termination`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.Termination-Union{Tuple{F}, Tuple{MultinomialTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat)
- [`AdvancedHMC.Termination`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.Termination-Union{Tuple{F}, Tuple{SliceTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat)
- [`AdvancedHMC.Transition`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.Transition)
- [`AdvancedHMC.A`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.A-Tuple{Any,Any,Any})
- [`AdvancedHMC.build_tree`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.build_tree-Union{Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{Random.AbstractRNG,AdvancedHMC.NUTS{S,C,I,F},Hamiltonian,AdvancedHMC.PhasePoint,AdvancedHMC.AbstractTrajectorySampler,Int64,Int64,AbstractFloat}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator)
- [`AdvancedHMC.check_left_subtree`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.check_left_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn))
- [`AdvancedHMC.check_right_subtree`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.check_right_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn))
- [`AdvancedHMC.combine`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.combine-Tuple{AdvancedHMC.BinaryTree,AdvancedHMC.BinaryTree})
- [`AdvancedHMC.find_good_stepsize`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.find_good_stepsize-Union{Tuple{T}, Tuple{Random.AbstractRNG,Hamiltonian,AbstractArray{T,1}}} where T<:Real)
- [`AdvancedHMC.isterminated`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.isterminated-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn))
- [`AdvancedHMC.isterminated`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:ClassicNoUTurn})
- [`AdvancedHMC.isterminated`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:GeneralisedNoUTurn})
- [`AdvancedHMC.maxabs`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.maxabs-Tuple{Any,Any})
- [`AdvancedHMC.mh_accept_ratio`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.mh_accept_ratio-Union{Tuple{T}, Tuple{Random.AbstractRNG,T,T}} where T<:AbstractFloat)
- [`AdvancedHMC.nom_step_size`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.nom_step_size-Tuple{AdvancedHMC.AbstractIntegrator})
- [`AdvancedHMC.pm_next!`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.pm_next!-Tuple{Any,NamedTuple})
- [`AdvancedHMC.randcat`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.randcat-Union{Tuple{T}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s20",1} where var"#s20"<:Random.AbstractRNG},AbstractArray{T,2}}} where T)
- [`AdvancedHMC.simple_pm_next!`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.simple_pm_next!-Tuple{Any,NamedTuple})
- [`AdvancedHMC.stat`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.stat-Tuple{AdvancedHMC.Transition})
- [`AdvancedHMC.step_size`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.step_size)
- [`AdvancedHMC.temper`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.temper-Tuple{TemperedLeapfrog,Any,NamedTuple{(:i, :is_half),var"#s57"} where var"#s57"<:Tuple{Integer,Bool},Int64})
- [`AdvancedHMC.transition`]({{site.baseurl}}/docs/library/advancedhmc/#AdvancedHMC.transition-Tuple{AdvancedHMC.AbstractTrajectory,Hamiltonian,AdvancedHMC.PhasePoint})


<a id='Functions'></a>

<a id='Functions-1'></a>

## Functions

<a id='AdvancedHMC.A-Tuple{Any,Any,Any}' href='#AdvancedHMC.A-Tuple{Any,Any,Any}'>#</a>
**`AdvancedHMC.A`** &mdash; *Method*.



A single Hamiltonian integration step.

NOTE: this function is intended to be used in `find_good_stepsize` only.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L784-L788' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.build_tree-Union{Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{Random.AbstractRNG,AdvancedHMC.NUTS{S,C,I,F},Hamiltonian,AdvancedHMC.PhasePoint,AdvancedHMC.AbstractTrajectorySampler,Int64,Int64,AbstractFloat}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator' href='#AdvancedHMC.build_tree-Union{Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{Random.AbstractRNG,AdvancedHMC.NUTS{S,C,I,F},Hamiltonian,AdvancedHMC.PhasePoint,AdvancedHMC.AbstractTrajectorySampler,Int64,Int64,AbstractFloat}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator'>#</a>
**`AdvancedHMC.build_tree`** &mdash; *Method*.



Recursivly build a tree for a given depth `j`.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L675-L677' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.check_left_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)' href='#AdvancedHMC.check_left_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)'>#</a>
**`AdvancedHMC.check_left_subtree`** &mdash; *Method*.



```julia
check_left_subtree(
    h::Hamiltonian, t::T, tleft::T, tright::T
) where {T<:BinaryTree{<:StrictGeneralisedNoUTurn}}
```

Do a U-turn check between the leftmost phase point of `t` and the leftmost  phase point of `tright`, the right subtree.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L635-L642' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.check_right_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)' href='#AdvancedHMC.check_right_subtree-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)'>#</a>
**`AdvancedHMC.check_right_subtree`** &mdash; *Method*.



```julia
check_left_subtree(
    h::Hamiltonian, t::T, tleft::T, tright::T
) where {T<:BinaryTree{<:StrictGeneralisedNoUTurn}}
```

Do a U-turn check between the rightmost phase point of `t` and the rightmost phase point of `tleft`, the left subtree.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L651-L658' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.combine-Tuple{AdvancedHMC.BinaryTree,AdvancedHMC.BinaryTree}' href='#AdvancedHMC.combine-Tuple{AdvancedHMC.BinaryTree,AdvancedHMC.BinaryTree}'>#</a>
**`AdvancedHMC.combine`** &mdash; *Method*.



```julia
combine(treeleft::BinaryTree, treeright::BinaryTree)
```

Merge a left tree `treeleft` and a right tree `treeright` under given Hamiltonian `h`, then draw a new candidate sample and update related statistics for the resulting tree.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L556-L561' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.find_good_stepsize-Union{Tuple{T}, Tuple{Random.AbstractRNG,Hamiltonian,AbstractArray{T,1}}} where T<:Real' href='#AdvancedHMC.find_good_stepsize-Union{Tuple{T}, Tuple{Random.AbstractRNG,Hamiltonian,AbstractArray{T,1}}} where T<:Real'>#</a>
**`AdvancedHMC.find_good_stepsize`** &mdash; *Method*.



Find a good initial leap-frog step-size via heuristic search.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L795-L797' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:ClassicNoUTurn}' href='#AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:ClassicNoUTurn}'>#</a>
**`AdvancedHMC.isterminated`** &mdash; *Method*.



```julia
isterminated(h::Hamiltonian, t::BinaryTree{<:ClassicNoUTurn})
```

Detect U turn for two phase points (`zleft` and `zright`) under given Hamiltonian `h` using the (original) no-U-turn cirterion.

Ref: https://arxiv.org/abs/1111.4246, https://arxiv.org/abs/1701.02434


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L573-L580' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:GeneralisedNoUTurn}' href='#AdvancedHMC.isterminated-Tuple{Hamiltonian,AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:GeneralisedNoUTurn}'>#</a>
**`AdvancedHMC.isterminated`** &mdash; *Method*.



```julia
isterminated(h::Hamiltonian, t::BinaryTree{<:GeneralisedNoUTurn})
```

Detect U turn for two phase points (`zleft` and `zright`) under given Hamiltonian `h` using the generalised no-U-turn criterion.

Ref: https://arxiv.org/abs/1701.02434


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L589-L596' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.isterminated-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)' href='#AdvancedHMC.isterminated-Union{Tuple{T}, Tuple{Hamiltonian,T,T,T}} where T<:(AdvancedHMC.BinaryTree{var"#s57"} where var"#s57"<:StrictGeneralisedNoUTurn)'>#</a>
**`AdvancedHMC.isterminated`** &mdash; *Method*.



```julia
isterminated(
    h::Hamiltonian, t::T, tleft::T, tright::T
) where {T<:BinaryTree{<:StrictGeneralisedNoUTurn}}
```

Detect U turn for two phase points (`zleft` and `zright`) under given Hamiltonian `h` using the generalised no-U-turn criterion with additional U-turn checks.

Ref: https://arxiv.org/abs/1701.02434 https://github.com/stan-dev/stan/pull/2800


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L603-L612' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.maxabs-Tuple{Any,Any}' href='#AdvancedHMC.maxabs-Tuple{Any,Any}'>#</a>
**`AdvancedHMC.maxabs`** &mdash; *Method*.



```julia
maxabs(a, b)
```

Return the value with the largest absolute value.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L549-L553' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.mh_accept_ratio-Union{Tuple{T}, Tuple{Random.AbstractRNG,T,T}} where T<:AbstractFloat' href='#AdvancedHMC.mh_accept_ratio-Union{Tuple{T}, Tuple{Random.AbstractRNG,T,T}} where T<:AbstractFloat'>#</a>
**`AdvancedHMC.mh_accept_ratio`** &mdash; *Method*.



Perform MH acceptance based on energy, i.e. negative log probability.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L873-L875' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.nom_step_size-Tuple{AdvancedHMC.AbstractIntegrator}' href='#AdvancedHMC.nom_step_size-Tuple{AdvancedHMC.AbstractIntegrator}'>#</a>
**`AdvancedHMC.nom_step_size`** &mdash; *Method*.



```julia
nom_step_size(::AbstractIntegrator)
```

Get the nominal integration step size. The current integration step size may differ from this, for example if the step size is jittered. Nominal step size is usually used in adaptation.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L25-L31' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.pm_next!-Tuple{Any,NamedTuple}' href='#AdvancedHMC.pm_next!-Tuple{Any,NamedTuple}'>#</a>
**`AdvancedHMC.pm_next!`** &mdash; *Method*.



Progress meter update with all trajectory stats, iteration number and metric shown.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/sampler.jl#L90-L92' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.randcat-Union{Tuple{T}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s20",1} where var"#s20"<:Random.AbstractRNG},AbstractArray{T,2}}} where T' href='#AdvancedHMC.randcat-Union{Tuple{T}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s20",1} where var"#s20"<:Random.AbstractRNG},AbstractArray{T,2}}} where T'>#</a>
**`AdvancedHMC.randcat`** &mdash; *Method*.



```julia
randcat(rng, P::AbstractMatrix)
```

Generating Categorical random variables in a vectorized mode. `P` is supposed to be a matrix of (D, N) where each column is a probability vector.

Example

```
P = [
    0.5 0.3;
    0.4 0.6;
    0.1 0.1
]
u = [0.3, 0.4]
C = [
    0.5 0.3
    0.9 0.9
    1.0 1.0
]
```

Then `C .< u'` is

```
[
    0 1
    0 0
    0 0
]
```

thus `convert.(Int, vec(sum(C .< u'; dims=1))) .+ 1` equals `[1, 2]`.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/utilities.jl#L48-L78' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.simple_pm_next!-Tuple{Any,NamedTuple}' href='#AdvancedHMC.simple_pm_next!-Tuple{Any,NamedTuple}'>#</a>
**`AdvancedHMC.simple_pm_next!`** &mdash; *Method*.



Simple progress meter update without any show values.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/sampler.jl#L97-L99' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.stat-Tuple{AdvancedHMC.Transition}' href='#AdvancedHMC.stat-Tuple{AdvancedHMC.Transition}'>#</a>
**`AdvancedHMC.stat`** &mdash; *Method*.



Returns the statistics for transition `t`.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L27' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.step_size' href='#AdvancedHMC.step_size'>#</a>
**`AdvancedHMC.step_size`** &mdash; *Function*.



```julia
step_size(::AbstractIntegrator)
```

Get the current integration step size.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L34-L38' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.temper-Tuple{TemperedLeapfrog,Any,NamedTuple{(:i, :is_half),var"#s57"} where var"#s57"<:Tuple{Integer,Bool},Int64}' href='#AdvancedHMC.temper-Tuple{TemperedLeapfrog,Any,NamedTuple{(:i, :is_half),var"#s57"} where var"#s57"<:Tuple{Integer,Bool},Int64}'>#</a>
**`AdvancedHMC.temper`** &mdash; *Method*.



```julia
temper(lf::TemperedLeapfrog, r, step::NamedTuple{(:i, :is_half),<:Tuple{Integer,Bool}}, n_steps::Int)
```

Tempering step. `step` is a named tuple with

  * `i` being the current leapfrog iteration and
  * `is_half` indicating whether or not it's (the first) half momentum/tempering step


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L208-L214' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.transition-Tuple{AdvancedHMC.AbstractTrajectory,Hamiltonian,AdvancedHMC.PhasePoint}' href='#AdvancedHMC.transition-Tuple{AdvancedHMC.AbstractTrajectory,Hamiltonian,AdvancedHMC.PhasePoint}'>#</a>
**`AdvancedHMC.transition`** &mdash; *Method*.



```julia
transition(τ::AbstractTrajectory{I}, h::Hamiltonian, z::PhasePoint)
```

Make a MCMC transition from phase point `z` using the trajectory `τ` under Hamiltonian `h`.

NOTE: This is a RNG-implicit fallback function for `transition(GLOBAL_RNG, τ, h, z)`


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L163-L169' class='documenter-source'>source</a><br>

<a id='StatsBase.sample-Union{Tuple{T}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s194",1} where var"#s194"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s195",1} where var"#s195"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64,AdvancedHMC.Adaptation.AbstractAdaptor}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s196",1} where var"#s196"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64,AdvancedHMC.Adaptation.AbstractAdaptor,Int64}} where T<:(Union{AbstractArray{var"#s193",1}, AbstractArray{var"#s193",2}} where var"#s193"<:AbstractFloat)' href='#StatsBase.sample-Union{Tuple{T}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s194",1} where var"#s194"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s195",1} where var"#s195"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64,AdvancedHMC.Adaptation.AbstractAdaptor}, Tuple{Union{Random.AbstractRNG, AbstractArray{var"#s196",1} where var"#s196"<:Random.AbstractRNG},Hamiltonian,AdvancedHMC.AbstractProposal,T,Int64,AdvancedHMC.Adaptation.AbstractAdaptor,Int64}} where T<:(Union{AbstractArray{var"#s193",1}, AbstractArray{var"#s193",2}} where var"#s193"<:AbstractFloat)'>#</a>
**`StatsBase.sample`** &mdash; *Method*.



```julia
sample(
    rng::AbstractRNG,
    h::Hamiltonian,
    τ::AbstractProposal,
    θ::AbstractVecOrMat{T},
    n_samples::Int,
    adaptor::AbstractAdaptor=NoAdaptation(),
    n_adapts::Int=min(div(n_samples, 10), 1_000);
    drop_warmup::Bool=false,
    verbose::Bool=true,
    progress::Bool=false
)
```

Sample `n_samples` samples using the proposal `τ` under Hamiltonian `h`.

  * The randomness is controlled by `rng`. 

      * If `rng` is not provided, `GLOBAL_RNG` will be used.
  * The initial point is given by `θ`.
  * The adaptor is set by `adaptor`, for which the default is no adaptation.

      * It will perform `n_adapts` steps of adaptation, for which the default is the minimum of `1_000` and 10% of `n_samples`
  * `drop_warmup` controls to drop the samples during adaptation phase or not
  * `verbose` controls the verbosity
  * `progress` controls whether to show the progress meter or not


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/sampler.jl#L131-L154' class='documenter-source'>source</a><br>


<a id='Types'></a>

<a id='Types-1'></a>

## Types

<a id='AdvancedHMC.AbstractIntegrator' href='#AdvancedHMC.AbstractIntegrator'>#</a>
**`AdvancedHMC.AbstractIntegrator`** &mdash; *Type*.



```julia
abstract type AbstractIntegrator
```

Represents an integrator used to simulate the Hamiltonian system.

**Implementation**

A `AbstractIntegrator` is expected to have the following implementations:

  * `stat`(@ref)
  * `nom_step_size`(@ref)
  * `step_size`(@ref)


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L10' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.AbstractProposal' href='#AdvancedHMC.AbstractProposal'>#</a>
**`AdvancedHMC.AbstractProposal`** &mdash; *Type*.



Abstract Markov chain Monte Carlo proposal.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L30-L32' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.AbstractTrajectory' href='#AdvancedHMC.AbstractTrajectory'>#</a>
**`AdvancedHMC.AbstractTrajectory`** &mdash; *Type*.



Hamiltonian dynamics numerical simulation trajectories.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L35-L37' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.AbstractTrajectorySampler' href='#AdvancedHMC.AbstractTrajectorySampler'>#</a>
**`AdvancedHMC.AbstractTrajectorySampler`** &mdash; *Type*.



Defines how to sample a phase-point from the simulated trajectory.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L44-L46' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.BinaryTree' href='#AdvancedHMC.BinaryTree'>#</a>
**`AdvancedHMC.BinaryTree`** &mdash; *Type*.



A full binary tree trajectory with only necessary leaves and information stored.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L537-L539' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.ClassicNoUTurn' href='#AdvancedHMC.ClassicNoUTurn'>#</a>
**`AdvancedHMC.ClassicNoUTurn`** &mdash; *Type*.



```julia
struct ClassicNoUTurn <: AdvancedHMC.AbstractTerminationCriterion
```

Classic No-U-Turn criterion as described in Eq. (9) in [1].

Informally, this will terminate the trajectory expansion if continuing the simulation either forwards or backwards in time will decrease the distance between the left-most and right-most positions.

**References**

1. Hoffman, M. D., & Gelman, A. (2014). The No-U-Turn Sampler: adaptively setting path lengths in Hamiltonian Monte Carlo. Journal of Machine Learning Research, 15(1), 1593-1623. ([arXiv](http://arxiv.org/abs/1111.4246))


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L375' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.EndPointTS' href='#AdvancedHMC.EndPointTS'>#</a>
**`AdvancedHMC.EndPointTS`** &mdash; *Type*.



```julia
struct EndPointTS <: AdvancedHMC.AbstractTrajectorySampler
```

Samples the end-point of the trajectory.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L49' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.GeneralisedNoUTurn' href='#AdvancedHMC.GeneralisedNoUTurn'>#</a>
**`AdvancedHMC.GeneralisedNoUTurn`** &mdash; *Type*.



```julia
struct GeneralisedNoUTurn{T<:(AbstractArray{var"#s58",1} where var"#s58"<:Real)} <: AdvancedHMC.AbstractTerminationCriterion
```

Generalised No-U-Turn criterion as described in Section A.4.2 in [1].

**Fields**

  * `rho::AbstractArray{var"#s58",1} where var"#s58"<:Real`

    Integral or sum of momenta along the integration path.

**References**

1. Betancourt, M. (2017). A Conceptual Introduction to Hamiltonian Monte Carlo. [arXiv preprint arXiv:1701.02434](https://arxiv.org/abs/1701.02434).


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L391' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.HMCDA' href='#AdvancedHMC.HMCDA'>#</a>
**`AdvancedHMC.HMCDA`** &mdash; *Type*.



```julia
struct HMCDA{S<:AdvancedHMC.AbstractTrajectorySampler, I<:AdvancedHMC.AbstractIntegrator} <: AdvancedHMC.DynamicTrajectory{I<:AdvancedHMC.AbstractIntegrator}
```

Standard HMC implementation with fixed total trajectory length.

**Fields**

  * `integrator::AdvancedHMC.AbstractIntegrator`

    Integrator used to simulate trajectory.
  * `λ::AbstractFloat`

    Total length of the trajectory, i.e. take `floor(λ / integrator_step)` number of leapfrog steps.

**References**

1. Neal, R. M. (2011). MCMC using Hamiltonian dynamics. Handbook of Markov chain Monte Carlo, 2(11), 2. ([arXiv](https://arxiv.org/pdf/1206.1901))


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L324' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.JitteredLeapfrog' href='#AdvancedHMC.JitteredLeapfrog'>#</a>
**`AdvancedHMC.JitteredLeapfrog`** &mdash; *Type*.



```julia
struct JitteredLeapfrog{FT<:AbstractFloat, T<:Union{AbstractArray{FT<:AbstractFloat,1}, FT<:AbstractFloat}} <: AdvancedHMC.AbstractLeapfrog{T<:Union{AbstractArray{FT<:AbstractFloat,1}, FT<:AbstractFloat}}
```

Leapfrog integrator with randomly "jittered" step size `ϵ` for every trajectory.

**Fields**

  * `ϵ0::Union{AbstractArray{FT,1}, FT} where FT<:AbstractFloat`

    Nominal (non-jittered) step size.
  * `jitter::AbstractFloat`

    The proportion of the nominal step size `ϵ0` that may be added or subtracted.
  * `ϵ::Union{AbstractArray{FT,1}, FT} where FT<:AbstractFloat`

    Current (jittered) step size.

**Description**

This is the same as `LeapFrog`(@ref) but with a "jittered" step size. This means  that at the beginning of each trajectory we sample a step size `ϵ` by adding or  subtracting from the nominal/base step size `ϵ0` some random proportion of `ϵ0`,  with the proportion specified by `jitter`, i.e. `ϵ = ϵ0 - jitter * ϵ0 * rand()`. p Jittering might help alleviate issues related to poor interactions with a fixed step size:

  * In regions with high "curvature" the current choice of step size might mean over-shoot  leading to almost all steps being rejected. Randomly sampling the step size at the  beginning of the trajectories can therefore increase the probability of escaping such high-curvature regions.
  * Exact periodicity of the simulated trajectories might occur, i.e. you might be so unlucky as to simulate the trajectory forwards in time `L ϵ` and ending up at the same point (which results in non-ergodicity; see Section 3.2 in [1]). If momentum is refreshed before each trajectory, then this should not happen *exactly* but it can still be an issue in practice. Randomly choosing the step-size `ϵ` might help alleviate such problems.

**References**

1. Neal, R. M. (2011). MCMC using Hamiltonian dynamics. Handbook of Markov chain Monte Carlo, 2(11), 2. ([arXiv](https://arxiv.org/pdf/1206.1901))


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L118' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.Leapfrog' href='#AdvancedHMC.Leapfrog'>#</a>
**`AdvancedHMC.Leapfrog`** &mdash; *Type*.



```julia
struct Leapfrog{T<:(Union{AbstractArray{var"#s58",1}, var"#s58"} where var"#s58"<:AbstractFloat)} <: AdvancedHMC.AbstractLeapfrog{T<:(Union{AbstractArray{var"#s58",1}, var"#s58"} where var"#s58"<:AbstractFloat)}
```

Leapfrog integrator with fixed step size `ϵ`.

**Fields**

  * `ϵ::Union{AbstractArray{var"#s58",1}, var"#s58"} where var"#s58"<:AbstractFloat`

    Step size.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L101' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.MultinomialTS' href='#AdvancedHMC.MultinomialTS'>#</a>
**`AdvancedHMC.MultinomialTS`** &mdash; *Type*.



```julia
struct MultinomialTS{F<:AbstractFloat} <: AdvancedHMC.AbstractTrajectorySampler
```

Multinomial trajectory sampler carried during the building of the tree. It contains the weight of the tree, defined as the total probabilities of the leaves.

**Fields**

  * `zcand::AdvancedHMC.PhasePoint`

    Sampled candidate `PhasePoint`.
  * `ℓw::AbstractFloat`

    Total energy for the given tree, i.e. the sum of energies of all leaves.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L77' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.MultinomialTS-Tuple{MultinomialTS,AbstractFloat,AdvancedHMC.PhasePoint}' href='#AdvancedHMC.MultinomialTS-Tuple{MultinomialTS,AbstractFloat,AdvancedHMC.PhasePoint}'>#</a>
**`AdvancedHMC.MultinomialTS`** &mdash; *Method*.



```julia
MultinomialTS(s::MultinomialTS, H0::AbstractFloat, zcand::PhasePoint)
```

Multinomial sampler for a trajectory consisting only a leaf node.

  * tree weight is the (unnormalised) energy of the leaf.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L123-L128' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.MultinomialTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint}' href='#AdvancedHMC.MultinomialTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint}'>#</a>
**`AdvancedHMC.MultinomialTS`** &mdash; *Method*.



```julia
MultinomialTS(rng::AbstractRNG, z0::PhasePoint)
```

Multinomial sampler for the starting single leaf tree. (Log) weights for leaf nodes are their (unnormalised) Hamiltonian energies.

Ref: https://github.com/stan-dev/stan/blob/develop/src/stan/mcmc/hmc/nuts/base_nuts.hpp#L226


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L102-L109' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.NUTS' href='#AdvancedHMC.NUTS'>#</a>
**`AdvancedHMC.NUTS`** &mdash; *Type*.



Dynamic trajectory HMC using the no-U-turn termination criteria algorithm.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L440-L442' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.NUTS-Tuple' href='#AdvancedHMC.NUTS-Tuple'>#</a>
**`AdvancedHMC.NUTS`** &mdash; *Method*.



```julia
NUTS(args...) = NUTS{MultinomialTS,GeneralisedNoUTurn}(args...)
```

Create an instance for the No-U-Turn sampling algorithm with multinomial sampling and original no U-turn criterion.

Below is the doc for NUTS{S,C}.

```
NUTS{S,C}(
    integrator::I,
    max_depth::Int=10,
    Δ_max::F=1000.0
) where {I<:AbstractIntegrator,F<:AbstractFloat,S<:AbstractTrajectorySampler,C<:AbstractTerminationCriterion}
```

Create an instance for the No-U-Turn sampling algorithm.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L487-L496' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.NUTS-Union{Tuple{I}, Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{I,Int64}, Tuple{I,Int64,F}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator' href='#AdvancedHMC.NUTS-Union{Tuple{I}, Tuple{C}, Tuple{S}, Tuple{F}, Tuple{I}, Tuple{I,Int64}, Tuple{I,Int64,F}} where C<:AdvancedHMC.AbstractTerminationCriterion where S<:AdvancedHMC.AbstractTrajectorySampler where F<:AbstractFloat where I<:AdvancedHMC.AbstractIntegrator'>#</a>
**`AdvancedHMC.NUTS`** &mdash; *Method*.



```julia
NUTS{S,C}(
    integrator::I,
    max_depth::Int=10,
    Δ_max::F=1000.0
) where {I<:AbstractIntegrator,F<:AbstractFloat,S<:AbstractTrajectorySampler,C<:AbstractTerminationCriterion}
```

Create an instance for the No-U-Turn sampling algorithm.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L478-L486' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.SliceTS' href='#AdvancedHMC.SliceTS'>#</a>
**`AdvancedHMC.SliceTS`** &mdash; *Type*.



```julia
struct SliceTS{F<:AbstractFloat} <: AdvancedHMC.AbstractTrajectorySampler
```

Trajectory slice sampler carried during the building of the tree. It contains the slice variable and the number of acceptable condidates in the tree.

**Fields**

  * `zcand::AdvancedHMC.PhasePoint`

    Sampled candidate `PhasePoint`.
  * `ℓu::AbstractFloat`

    Slice variable in log-space.
  * `n::Int64`

    Number of acceptable candidates, i.e. those with probability larger than slice variable `u`.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L56' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.SliceTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint}' href='#AdvancedHMC.SliceTS-Tuple{Random.AbstractRNG,AdvancedHMC.PhasePoint}'>#</a>
**`AdvancedHMC.SliceTS`** &mdash; *Method*.



```julia
SliceTS(rng::AbstractRNG, z0::PhasePoint)
```

Slice sampler for the starting single leaf tree. Slice variable is initialized.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L94-L99' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.SliceTS-Tuple{SliceTS,AbstractFloat,AdvancedHMC.PhasePoint}' href='#AdvancedHMC.SliceTS-Tuple{SliceTS,AbstractFloat,AdvancedHMC.PhasePoint}'>#</a>
**`AdvancedHMC.SliceTS`** &mdash; *Method*.



```julia
SliceTS(s::SliceTS, H0::AbstractFloat, zcand::PhasePoint)
```

Create a slice sampler for a single leaf tree:

  * the slice variable is copied from the passed-in sampler `s` and
  * the number of acceptable candicates is computed by comparing the slice variable against the current energy.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L112-L118' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.StaticTrajectory' href='#AdvancedHMC.StaticTrajectory'>#</a>
**`AdvancedHMC.StaticTrajectory`** &mdash; *Type*.



```julia
struct StaticTrajectory{S<:AdvancedHMC.AbstractTrajectorySampler, I<:AdvancedHMC.AbstractIntegrator} <: AdvancedHMC.AbstractTrajectory{I<:AdvancedHMC.AbstractIntegrator}
```

Static HMC with a fixed number of leapfrog steps.

**Fields**

  * `integrator::AdvancedHMC.AbstractIntegrator`

    Integrator used to simulate trajectory.
  * `n_steps::Int64`

    Number of steps to simulate, i.e. length of trajectory will be `n_steps + 1`.

**References**

1. Neal, R. M. (2011). MCMC using Hamiltonian dynamics. Handbook of Markov chain Monte Carlo, 2(11), 2. ([arXiv](https://arxiv.org/pdf/1206.1901))


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L178' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.StrictGeneralisedNoUTurn' href='#AdvancedHMC.StrictGeneralisedNoUTurn'>#</a>
**`AdvancedHMC.StrictGeneralisedNoUTurn`** &mdash; *Type*.



```julia
struct StrictGeneralisedNoUTurn{T<:(AbstractArray{var"#s58",1} where var"#s58"<:Real)} <: AdvancedHMC.AbstractTerminationCriterion
```

Generalised No-U-Turn criterion as described in Section A.4.2 in [1] with  added U-turn check as described in [2].

**Fields**

  * `rho::AbstractArray{var"#s58",1} where var"#s58"<:Real`

    Integral or sum of momenta along the integration path.

**References**

1. Betancourt, M. (2017). A Conceptual Introduction to Hamiltonian Monte Carlo. [arXiv preprint arXiv:1701.02434](https://arxiv.org/abs/1701.02434).
2. [https://github.com/stan-dev/stan/pull/2800](https://github.com/stan-dev/stan/pull/2800)


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L410' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.TemperedLeapfrog' href='#AdvancedHMC.TemperedLeapfrog'>#</a>
**`AdvancedHMC.TemperedLeapfrog`** &mdash; *Type*.



```julia
struct TemperedLeapfrog{FT<:AbstractFloat, T<:Union{AbstractArray{FT<:AbstractFloat,1}, FT<:AbstractFloat}} <: AdvancedHMC.AbstractLeapfrog{T<:Union{AbstractArray{FT<:AbstractFloat,1}, FT<:AbstractFloat}}
```

Tempered leapfrog integrator with fixed step size `ϵ` and "temperature" `α`.

**Fields**

  * `ϵ::Union{AbstractArray{FT,1}, FT} where FT<:AbstractFloat`

    Step size.
  * `α::AbstractFloat`

    Temperature parameter.

**Description**

Tempering can potentially allow greater exploration of the posterior, e.g.  in a multi-modal posterior jumps between the modes can be more likely to occur.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/integrator.jl#L183' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.Termination' href='#AdvancedHMC.Termination'>#</a>
**`AdvancedHMC.Termination`** &mdash; *Type*.



```julia
Termination
```

Termination reasons

  * `dynamic`: due to stoping criteria
  * `numerical`: due to large energy deviation from starting (possibly numerical errors)


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L503-L509' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.Termination-Union{Tuple{F}, Tuple{MultinomialTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat' href='#AdvancedHMC.Termination-Union{Tuple{F}, Tuple{MultinomialTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat'>#</a>
**`AdvancedHMC.Termination`** &mdash; *Method*.



```julia
Termination(s::MultinomialTS, nt::NUTS, H0::F, H′::F) where {F<:AbstractFloat}
```

Check termination of a Hamiltonian trajectory.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L528-L532' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.Termination-Union{Tuple{F}, Tuple{SliceTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat' href='#AdvancedHMC.Termination-Union{Tuple{F}, Tuple{SliceTS,AdvancedHMC.NUTS,F,F}} where F<:AbstractFloat'>#</a>
**`AdvancedHMC.Termination`** &mdash; *Method*.



```julia
Termination(s::SliceTS, nt::NUTS, H0::F, H′::F) where {F<:AbstractFloat}
```

Check termination of a Hamiltonian trajectory.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L519-L523' class='documenter-source'>source</a><br>

<a id='AdvancedHMC.Transition' href='#AdvancedHMC.Transition'>#</a>
**`AdvancedHMC.Transition`** &mdash; *Type*.



```julia
struct Transition{P<:AdvancedHMC.PhasePoint, NT<:NamedTuple}
```

A transition that contains the phase point and other statistics of the transition.

**Fields**

  * `z::AdvancedHMC.PhasePoint`

    Phase-point for the transition.
  * `stat::NamedTuple`

    Statistics related to the transition, e.g. energy.


<a target='_blank' href='https://github.com/TuringLang/AdvancedHMC.jl/blob/07236bf6a236f3e86c101ecd5c609b2dca779f17/src/trajectory.jl#L10' class='documenter-source'>source</a><br>


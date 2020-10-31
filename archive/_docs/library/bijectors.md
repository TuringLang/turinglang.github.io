---
title: Bijectors
permalink: /docs/library/bijectors/
toc: true
---

<a id='Index'></a>

<a id='Index-1'></a>

## Index

- [`Bijectors.ADBijector`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.ADBijector)
- [`Bijectors.AbstractBijector`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.AbstractBijector)
- [`Bijectors.Bijector`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.Bijector)
- [`Bijectors.Composed`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.Composed)
- [`Bijectors.CorrBijector`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.CorrBijector)
- [`Bijectors.Inverse`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.Inverse)
- [`Bijectors.Permute`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.Permute)
- [`Bijectors.Stacked`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.Stacked)
- [`Bijectors._link_chol_lkj`]({{site.baseurl}}/docs/library/bijectors/#Bijectors._link_chol_lkj-Tuple{Any})
- [`Bijectors.bijector`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.bijector-Tuple{Distribution{Univariate,Discrete}})
- [`Bijectors.composel`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.composel-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N)
- [`Bijectors.composer`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.composer-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N)
- [`Bijectors.compute_r`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.compute_r-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any})
- [`Bijectors.find_alpha`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.find_alpha-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any,Any})
- [`Bijectors.forward`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.forward-Tuple{Distribution})
- [`Bijectors.forward`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.forward-Tuple{Bijector,Any})
- [`Bijectors.isclosedform`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.isclosedform-Tuple{Bijector})
- [`Bijectors.logabsdetjac`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.logabsdetjac-Tuple{Inverse{var"#s23",N} where N where var"#s23"<:Bijector,Any})
- [`Bijectors.logabsdetjac`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.logabsdetjac-Tuple{ADBijector,Real})
- [`Bijectors.logabsdetjacinv`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.logabsdetjacinv-Tuple{Bijector,Any})
- [`Bijectors.logabsdetjacinv`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.logabsdetjacinv-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real})
- [`Bijectors.logpdf_with_jac`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.logpdf_with_jac-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real})
- [`Bijectors.transformed`]({{site.baseurl}}/docs/library/bijectors/#Bijectors.transformed-Tuple{Distribution,Bijector})


<a id='Functions'></a>

<a id='Functions-1'></a>

## Functions

<a id='Bijectors._link_chol_lkj-Tuple{Any}' href='#Bijectors._link_chol_lkj-Tuple{Any}'>#</a>
**`Bijectors._link_chol_lkj`** &mdash; *Method*.



```julia
function _link_chol_lkj(w)
```

Link function for cholesky factor.

An alternative and maybe more efficient implementation was considered:

```
for i=2:K, j=(i+1):K
    z[i, j] = (w[i, j] / w[i-1, j]) * (z[i-1, j] / sqrt(1 - z[i-1, j]^2))
end
```

But this implementation will not work when w[i-1, j] = 0. Though it is a zero measure set, unit matrix initialization will not work.

For equivelence, following explanations is given by @torfjelde:

For `(i, j)` in the loop below, we define

```
z₍ᵢ₋₁, ⱼ₎ = w₍ᵢ₋₁,ⱼ₎ * ∏ₖ₌₁ⁱ⁻² (1 / √(1 - z₍ₖ,ⱼ₎²))
```

and so

```
z₍ᵢ,ⱼ₎ = w₍ᵢ,ⱼ₎ * ∏ₖ₌₁ⁱ⁻¹ (1 / √(1 - z₍ₖ,ⱼ₎²))
        = (w₍ᵢ,ⱼ₎ * / √(1 - z₍ᵢ₋₁,ⱼ₎²)) * (∏ₖ₌₁ⁱ⁻² 1 / √(1 - z₍ₖ,ⱼ₎²))
        = (w₍ᵢ,ⱼ₎ * / √(1 - z₍ᵢ₋₁,ⱼ₎²)) * (w₍ᵢ₋₁,ⱼ₎ * ∏ₖ₌₁ⁱ⁻² 1 / √(1 - z₍ₖ,ⱼ₎²)) / w₍ᵢ₋₁,ⱼ₎
        = (w₍ᵢ,ⱼ₎ * / √(1 - z₍ᵢ₋₁,ⱼ₎²)) * (z₍ᵢ₋₁,ⱼ₎ / w₍ᵢ₋₁,ⱼ₎)
        = (w₍ᵢ,ⱼ₎ / w₍ᵢ₋₁,ⱼ₎) * (z₍ᵢ₋₁,ⱼ₎ / √(1 - z₍ᵢ₋₁,ⱼ₎²))
```

which is the above implementation.

<a id='Bijectors.bijector-Tuple{Distribution{Univariate,Discrete}}' href='#Bijectors.bijector-Tuple{Distribution{Univariate,Discrete}}'>#</a>
**`Bijectors.bijector`** &mdash; *Method*.



```julia
bijector(d::Distribution)
```

Returns the constrained-to-unconstrained bijector for distribution `d`.

<a id='Bijectors.composel-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N' href='#Bijectors.composel-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N'>#</a>
**`Bijectors.composel`** &mdash; *Method*.



```julia
composel(ts::Bijector...)::Composed{<:Tuple}
```

Constructs `Composed` such that `ts` are applied left-to-right.

<a id='Bijectors.composer-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N' href='#Bijectors.composer-Union{Tuple{Vararg{Bijector{N},N1} where N1}, Tuple{N}} where N'>#</a>
**`Bijectors.composer`** &mdash; *Method*.



```julia
composer(ts::Bijector...)::Composed{<:Tuple}
```

Constructs `Composed` such that `ts` are applied right-to-left.

<a id='Bijectors.compute_r-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any}' href='#Bijectors.compute_r-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any}'>#</a>
**`Bijectors.compute_r`** &mdash; *Method*.



```julia
compute_r(y_minus_z0::AbstractVector{<:Real}, α, α_plus_β_hat)
```

Compute the unique solution $r$ to the equation

$$
\|y_minus_z0\|_2 = r \left(1 + \frac{α_plus_β_hat - α}{α + r}\right)
$$

subject to $r ≥ 0$ and $r ≠ α$.

Since $α > 0$ and $α_plus_β_hat > 0$, the solution is unique and given by

$$
r = (\sqrt{(α_plus_β_hat - γ)^2 + 4 α γ} - (α_plus_β_hat - γ)) / 2,
$$

where $γ = \|y_minus_z0\|_2$. For details see appendix A.2 of the reference.

**References**

D. Rezende, S. Mohamed (2015): Variational Inference with Normalizing Flows. arXiv:1505.05770

<a id='Bijectors.find_alpha-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any,Any}' href='#Bijectors.find_alpha-Tuple{AbstractArray{var"#s107",1} where var"#s107"<:Real,Any,Any,Any}'>#</a>
**`Bijectors.find_alpha`** &mdash; *Method*.



```julia
find_alpha(y::AbstractVector{<:Real}, wt_y, wt_u_hat, b)
```

Compute an (approximate) real-valued solution $α$ to the equation

$$
wt_y = α + wt_u_hat tanh(α + b)
$$

The uniqueness of the solution is guaranteed since $wt_u_hat ≥ -1$. For details see appendix A.1 of the reference.

**References**

D. Rezende, S. Mohamed (2015): Variational Inference with Normalizing Flows. arXiv:1505.05770

<a id='Bijectors.forward-Tuple{Bijector,Any}' href='#Bijectors.forward-Tuple{Bijector,Any}'>#</a>
**`Bijectors.forward`** &mdash; *Method*.



```julia
forward(b::Bijector, x)
```

Computes both `transform` and `logabsdetjac` in one forward pass, and returns a named tuple `(rv=b(x), logabsdetjac=logabsdetjac(b, x))`.

This defaults to the call above, but often one can re-use computation in the computation of the forward pass and the computation of the `logabsdetjac`. `forward` allows the user to take advantange of such efficiencies, if they exist.

<a id='Bijectors.forward-Tuple{Distribution}' href='#Bijectors.forward-Tuple{Distribution}'>#</a>
**`Bijectors.forward`** &mdash; *Method*.



```julia
forward(d::Distribution)
forward(d::Distribution, num_samples::Int)
```

Returns a `NamedTuple` with fields `x`, `y`, `logabsdetjac` and `logpdf`.

In the case where `d isa TransformedDistribution`, this means

  * `x = rand(d.dist)`
  * `y = d.transform(x)`
  * `logabsdetjac` is the logabsdetjac of the "forward" transform.
  * `logpdf` is the logpdf of `y`, not `x`

In the case where `d isa Distribution`, this means

  * `x = rand(d)`
  * `y = x`
  * `logabsdetjac = 0.0`
  * `logpdf` is logpdf of `x`

<a id='Bijectors.isclosedform-Tuple{Bijector}' href='#Bijectors.isclosedform-Tuple{Bijector}'>#</a>
**`Bijectors.isclosedform`** &mdash; *Method*.



```julia
isclosedform(b::Bijector)::bool
isclosedform(b⁻¹::Inverse{<:Bijector})::bool
```

Returns `true` or `false` depending on whether or not evaluation of `b` has a closed-form implementation.

Most bijectors have closed-form evaluations, but there are cases where this is not the case. For example the *inverse* evaluation of `PlanarLayer` requires an iterative procedure to evaluate and thus is not differentiable.

<a id='Bijectors.logabsdetjac-Tuple{ADBijector,Real}' href='#Bijectors.logabsdetjac-Tuple{ADBijector,Real}'>#</a>
**`Bijectors.logabsdetjac`** &mdash; *Method*.



Computes the absolute determinant of the Jacobian of the inverse-transformation.

<a id='Bijectors.logabsdetjac-Tuple{Inverse{var"#s23",N} where N where var"#s23"<:Bijector,Any}' href='#Bijectors.logabsdetjac-Tuple{Inverse{var"#s23",N} where N where var"#s23"<:Bijector,Any}'>#</a>
**`Bijectors.logabsdetjac`** &mdash; *Method*.



```julia
logabsdetjac(b::Bijector, x)
logabsdetjac(ib::Inverse{<:Bijector}, y)
```

Computes the log(abs(det(J(b(x))))) where J is the jacobian of the transform. Similarily for the inverse-transform.

Default implementation for `Inverse{<:Bijector}` is implemented as `- logabsdetjac` of original `Bijector`.

<a id='Bijectors.logabsdetjacinv-Tuple{Bijector,Any}' href='#Bijectors.logabsdetjacinv-Tuple{Bijector,Any}'>#</a>
**`Bijectors.logabsdetjacinv`** &mdash; *Method*.



```julia
logabsdetjacinv(b::Bijector, y)
```

Just an alias for `logabsdetjac(inv(b), y)`.

<a id='Bijectors.logabsdetjacinv-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real}' href='#Bijectors.logabsdetjacinv-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real}'>#</a>
**`Bijectors.logabsdetjacinv`** &mdash; *Method*.



```julia
logabsdetjacinv(td::UnivariateTransformed, y::Real)
logabsdetjacinv(td::MultivariateTransformed, y::AbstractVector{<:Real})
```

Computes the `logabsdetjac` of the *inverse* transformation, since `rand(td)` returns the *transformed* random variable.

<a id='Bijectors.logpdf_with_jac-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real}' href='#Bijectors.logpdf_with_jac-Tuple{Bijectors.TransformedDistribution{var"#s108",var"#s107",Univariate} where var"#s107"<:Bijector where var"#s108"<:Distribution,Real}'>#</a>
**`Bijectors.logpdf_with_jac`** &mdash; *Method*.



```julia
logpdf_with_jac(td::UnivariateTransformed, y::Real)
logpdf_with_jac(td::MvTransformed, y::AbstractVector{<:Real})
logpdf_with_jac(td::MatrixTransformed, y::AbstractMatrix{<:Real})
```

Makes use of the `forward` method to potentially re-use computation and returns a tuple `(logpdf, logabsdetjac)`.

<a id='Bijectors.transformed-Tuple{Distribution,Bijector}' href='#Bijectors.transformed-Tuple{Distribution,Bijector}'>#</a>
**`Bijectors.transformed`** &mdash; *Method*.



```julia
transformed(d::Distribution)
transformed(d::Distribution, b::Bijector)
```

Couples distribution `d` with the bijector `b` by returning a `TransformedDistribution`.

If no bijector is provided, i.e. `transformed(d)` is called, then  `transformed(d, bijector(d))` is returned.


<a id='Types'></a>

<a id='Types-1'></a>

## Types

<a id='Bijectors.ADBijector' href='#Bijectors.ADBijector'>#</a>
**`Bijectors.ADBijector`** &mdash; *Type*.



Abstract type for a `Bijector{N}` making use of auto-differentation (AD) to implement `jacobian` and, by impliciation, `logabsdetjac`.

<a id='Bijectors.AbstractBijector' href='#Bijectors.AbstractBijector'>#</a>
**`Bijectors.AbstractBijector`** &mdash; *Type*.



Abstract type for a bijector.

<a id='Bijectors.Bijector' href='#Bijectors.Bijector'>#</a>
**`Bijectors.Bijector`** &mdash; *Type*.



Abstract type of bijectors with fixed dimensionality.

<a id='Bijectors.Composed' href='#Bijectors.Composed'>#</a>
**`Bijectors.Composed`** &mdash; *Type*.



```julia
Composed(ts::A)

∘(b1::Bijector{N}, b2::Bijector{N})::Composed{<:Tuple}
composel(ts::Bijector{N}...)::Composed{<:Tuple}
composer(ts::Bijector{N}...)::Composed{<:Tuple}
```

where `A` refers to either

  * `Tuple{Vararg{<:Bijector{N}}}`: a tuple of bijectors of dimensionality `N`
  * `AbstractArray{<:Bijector{N}}`: an array of bijectors of dimensionality `N`

A `Bijector` representing composition of bijectors. `composel` and `composer` results in a `Composed` for which application occurs from left-to-right and right-to-left, respectively.

Note that all the alternative ways of constructing a `Composed` returns a `Tuple` of bijectors. This ensures type-stability of implementations of all relating methdos, e.g. `inv`.

If you want to use an `Array` as the container instead you can do

```
Composed([b1, b2, ...])
```

In general this is not advised since you lose type-stability, but there might be cases where this is desired, e.g. if you have a insanely large number of bijectors to compose.

**Examples**

**Simple example**

Let's consider a simple example of `Exp`:

```julia-repl
julia> using Bijectors: Exp

julia> b = Exp()
Exp{0}()

julia> b ∘ b
Composed{Tuple{Exp{0},Exp{0}},0}((Exp{0}(), Exp{0}()))

julia> (b ∘ b)(1.0) == exp(exp(1.0))    # evaluation
true

julia> inv(b ∘ b)(exp(exp(1.0))) == 1.0 # inversion
true

julia> logabsdetjac(b ∘ b, 1.0)         # determinant of jacobian
3.718281828459045
```

**Notes**

**Order**

It's important to note that `∘` does what is expected mathematically, which means that the bijectors are applied to the input right-to-left, e.g. first applying `b2` and then `b1`:

```julia
(b1 ∘ b2)(x) == b1(b2(x))     # => true
```

But in the `Composed` struct itself, we store the bijectors left-to-right, so that

```julia
cb1 = b1 ∘ b2                  # => Composed.ts == (b2, b1)
cb2 = composel(b2, b1)         # => Composed.ts == (b2, b1)
cb1(x) == cb2(x) == b1(b2(x))  # => true
```

**Structure**

`∘` will result in "flatten" the composition structure while `composel` and `composer` preserve the compositional structure. This is most easily seen by an example:

```julia-repl
julia> b = Exp()
Exp{0}()

julia> cb1 = b ∘ b; cb2 = b ∘ b;

julia> (cb1 ∘ cb2).ts # <= different
(Exp{0}(), Exp{0}(), Exp{0}(), Exp{0}())

julia> (cb1 ∘ cb2).ts isa NTuple{4, Exp{0}}
true

julia> Bijectors.composer(cb1, cb2).ts
(Composed{Tuple{Exp{0},Exp{0}},0}((Exp{0}(), Exp{0}())), Composed{Tuple{Exp{0},Exp{0}},0}((Exp{0}(), Exp{0}())))

julia> Bijectors.composer(cb1, cb2).ts isa Tuple{Composed, Composed}
true
```

<a id='Bijectors.CorrBijector' href='#Bijectors.CorrBijector'>#</a>
**`Bijectors.CorrBijector`** &mdash; *Type*.



```julia
CorrBijector <: Bijector{2}
```

A bijector implementation of Stan's parametrization method for Correlation matrix: https://mc-stan.org/docs/2_23/reference-manual/correlation-matrix-transform-section.html

Basically, a unconstrained strictly upper triangular matrix `y` is transformed to  a correlation matrix by following readable but not that efficient form:

```
K = size(y, 1)
z = tanh.(y)

for j=1:K, i=1:K
    if i>j
        w[i,j] = 0
    elseif 1==i==j
        w[i,j] = 1
    elseif 1<i==j
        w[i,j] = prod(sqrt(1 .- z[1:i-1, j].^2))
    elseif 1==i<j
        w[i,j] = z[i,j]
    elseif 1<i<j
        w[i,j] = z[i,j] * prod(sqrt(1 .- z[1:i-1, j].^2))
    end
end
```

It is easy to see that every column is a unit vector, for example:

```
w3' w3 ==
w[1,3]^2 + w[2,3]^2 + w[3,3]^2 ==
z[1,3]^2 + (z[2,3] * sqrt(1 - z[1,3]^2))^2 + (sqrt(1-z[1,3]^2) * sqrt(1-z[2,3]^2))^2 ==
z[1,3]^2 + z[2,3]^2 * (1-z[1,3]^2) + (1-z[1,3]^2) * (1-z[2,3]^2) ==
z[1,3]^2 + z[2,3]^2 - z[2,3]^2 * z[1,3]^2 + 1 -z[1,3]^2 - z[2,3]^2 + z[1,3]^2 * z[2,3]^2 ==
1
```

And diagonal elements are positive, so `w` is a cholesky factor for a positive matrix.

```
x = w' * w
```

Consider block matrix representation for `x`

```
x = [w1'; w2'; ... wn'] * [w1 w2 ... wn] == 
[w1'w1 w1'w2 ... w1'wn;
 w2'w1 w2'w2 ... w2'wn;
 ...
]
```

The diagonal elements are given by `wk'wk = 1`, thus `x` is a correlation matrix.

Every step is invertible, so this is a bijection(bijector).

Note: The implementation doesn't follow their "manageable expression" directly, because their equation seems wrong (7/30/2020). Insteadly it follows definition  above the "manageable expression" directly, which is also described in above doc.

<a id='Bijectors.Inverse' href='#Bijectors.Inverse'>#</a>
**`Bijectors.Inverse`** &mdash; *Type*.



```julia
inv(b::Bijector)
Inverse(b::Bijector)
```

A `Bijector` representing the inverse transform of `b`.

<a id='Bijectors.Permute' href='#Bijectors.Permute'>#</a>
**`Bijectors.Permute`** &mdash; *Type*.



```julia
Permute{A} <: Bijector{1}
```

A bijector implementation of a permutation. The permutation is performed using a matrix of type `A`. There are a couple of different ways to construct `Permute`:

```
Permute([0 1; 1 0])          # will map [1, 2] => [2, 1]
Permute([2, 1])              # will map [1, 2] => [2, 1]
Permute(2, 2 => 1, 1 => 2)   # will map [1, 2] => [2, 1]
Permute(2, [1, 2] => [2, 1]) # will map [1, 2] => [2, 1]
```

If this is not clear, the examples might be of help.

**Examples**

A simple example is permuting a vector of size 3.

```julia-repl
julia> b1 = Permute([
           0 1 0;
           1 0 0;
           0 0 1
       ])
Permute{Array{Int64,2}}([0 1 0; 1 0 0; 0 0 1])

julia> b2 = Permute([2, 1, 3])           # specify all elements at once
Permute{SparseArrays.SparseMatrixCSC{Float64,Int64}}(

  [2, 1]  =  1.0
  [1, 2]  =  1.0
  [3, 3]  =  1.0)

julia> b3 = Permute(3, 2 => 1, 1 => 2)    # element-wise
Permute{SparseArrays.SparseMatrixCSC{Float64,Int64}}(
  [2, 1]  =  1.0
  [1, 2]  =  1.0
  [3, 3]  =  1.0)

julia> b4 = Permute(3, [1, 2] => [2, 1])  # block-wise
Permute{SparseArrays.SparseMatrixCSC{Float64,Int64}}(
  [2, 1]  =  1.0
  [1, 2]  =  1.0
  [3, 3]  =  1.0)

julia> b1.A == b2.A == b3.A == b4.A
true

julia> b1([1., 2., 3.])
3-element Array{Float64,1}:
 2.0
 1.0
 3.0

julia> b2([1., 2., 3.])
3-element Array{Float64,1}:
 2.0
 1.0
 3.0

julia> b3([1., 2., 3.])
3-element Array{Float64,1}:
 2.0
 1.0
 3.0

julia> b4([1., 2., 3.])
3-element Array{Float64,1}:
 2.0
 1.0
 3.0

julia> inv(b1)
Permute{LinearAlgebra.Transpose{Int64,Array{Int64,2}}}([0 1 0; 1 0 0; 0 0 1])

julia> inv(b1)(b1([1., 2., 3.]))
3-element Array{Float64,1}:
 1.0
 2.0
 3.0
```

<a id='Bijectors.Stacked' href='#Bijectors.Stacked'>#</a>
**`Bijectors.Stacked`** &mdash; *Type*.



```julia
Stacked(bs)
Stacked(bs, ranges)
stack(bs::Bijector{0}...) # where `0` means 0-dim `Bijector`
```

A `Bijector` which stacks bijectors together which can then be applied to a vector where `bs[i]::Bijector` is applied to `x[ranges[i]]::UnitRange{Int}`.

**Arguments**

  * `bs` can be either a `Tuple` or an `AbstractArray` of 0- and/or 1-dimensional bijectors

      * If `bs` is a `Tuple`, implementations are type-stable using generated functions
      * If `bs` is an `AbstractArray`, implementations are *not* type-stable and use iterative methods
  * `ranges` needs to be an iterable consisting of `UnitRange{Int}`

      * `length(bs) == length(ranges)` needs to be true.

**Examples**

```
b1 = Logit(0.0, 1.0)
b2 = Identity{0}()
b = stack(b1, b2)
b([0.0, 1.0]) == [b1(0.0), 1.0]  # => true
```


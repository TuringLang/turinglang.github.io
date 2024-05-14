var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = MCMCDiagnosticTools","category":"page"},{"location":"#MCMCDiagnosticTools","page":"Home","title":"MCMCDiagnosticTools","text":"","category":"section"},{"location":"#Effective-sample-size-and-\\widehat{R}","page":"Home","title":"Effective sample size and widehatR","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"ess\nrhat\ness_rhat","category":"page"},{"location":"#MCMCDiagnosticTools.ess","page":"Home","title":"MCMCDiagnosticTools.ess","text":"ess(\n    samples::AbstractArray{<:Union{Missing,Real},3};\n    kind=:bulk,\n    autocov_method=AutocovMethod(),\n    split_chains::Int=2,\n    maxlag::Int=250,\n    kwargs...\n)\n\nEstimate the effective sample size (ESS) of the samples of shape (draws, chains, parameters) with the autocov_method.\n\nOptionally, the kind of ESS estimate to be computed can be specified (see below). Some kinds accept additional kwargs.\n\nsplit_chains indicates the number of chains each chain is split into. When split_chains > 1, then the diagnostics check for within-chain convergence. When d = mod(draws, split_chains) > 0, i.e. the chains cannot be evenly split, then 1 draw is discarded after each of the first d splits within each chain. There must be at least 3 draws in each chain after splitting.\n\nmaxlag indicates the maximum lag for which autocovariance is computed and must be greater than 0.\n\nFor a given estimand, it is recommended that the ESS is at least 100 * chains and that widehatR  101.[VehtariGelman2021]\n\nSee also: AutocovMethod, FFTAutocovMethod, BDAAutocovMethod, rhat, ess_rhat, mcse\n\nKinds of ESS estimates\n\nIf kind isa a Symbol, it may take one of the following values:\n\n:bulk: basic ESS computed on rank-normalized draws. This kind diagnoses poor convergence   in the bulk of the distribution due to trends or different locations of the chains.\n:tail: minimum of the quantile-ESS for the symmetric quantiles where   tail_prob=0.1 is the probability in the tails. This kind diagnoses poor convergence in   the tails of the distribution. If this kind is chosen, kwargs may contain a   tail_prob keyword.\n:basic: basic ESS, equivalent to specifying kind=Statistics.mean.\n\nnote: Note\nWhile Bulk-ESS is conceptually related to basic ESS, it is well-defined even if the chains do not have finite variance.[VehtariGelman2021] For each parameter, rank-normalization proceeds by first ranking the inputs using \"tied ranking\" and then transforming the ranks to normal quantiles so that the result is standard normally distributed. This transform is monotonic.\n\nOtherwise, kind specifies one of the following estimators, whose ESS is to be estimated:\n\nStatistics.mean\nStatistics.median\nStatistics.std\nStatsBase.mad\nBase.Fix2(Statistics.quantile, p::Real)\n\n[VehtariGelman2021]: Vehtari, A., Gelman, A., Simpson, D., Carpenter, B., & Bürkner, P. C. (2021). Rank-normalization, folding, and localization: An improved widehat R for assessing convergence of MCMC. Bayesian Analysis. doi: 10.1214/20-BA1221 arXiv: 1903.08008\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.rhat","page":"Home","title":"MCMCDiagnosticTools.rhat","text":"rhat(samples::AbstractArray{Union{Real,Missing},3}; kind::Symbol=:rank, split_chains=2)\n\nCompute the widehatR diagnostics for each parameter in samples of shape (chains, draws, parameters).[VehtariGelman2021]\n\nkind indicates the kind of widehatR to compute (see below).\n\nsplit_chains indicates the number of chains each chain is split into. When split_chains > 1, then the diagnostics check for within-chain convergence. When d = mod(draws, split_chains) > 0, i.e. the chains cannot be evenly split, then 1 draw is discarded after each of the first d splits within each chain.\n\nSee also ess, ess_rhat, rstar\n\nKinds of widehatR\n\nThe following kinds are supported:\n\n:rank: maximum of widehatR with kind=:bulk and kind=:tail.\n:bulk: basic widehatR computed on rank-normalized draws. This kind diagnoses   poor convergence in the bulk of the distribution due to trends or different locations of   the chains.\n:tail: widehatR computed on draws folded around the median and then   rank-normalized. This kind diagnoses poor convergence in the tails of the distribution   due to different scales of the chains.\n:basic: Classic widehatR.\n\n[VehtariGelman2021]: Vehtari, A., Gelman, A., Simpson, D., Carpenter, B., & Bürkner, P. C. (2021). Rank-normalization, folding, and localization: An improved widehat R for assessing convergence of MCMC. Bayesian Analysis. doi: 10.1214/20-BA1221 arXiv: 1903.08008\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.ess_rhat","page":"Home","title":"MCMCDiagnosticTools.ess_rhat","text":"ess_rhat(\n    samples::AbstractArray{<:Union{Missing,Real},3};\n    kind::Symbol=:rank,\n    kwargs...,\n) -> NamedTuple{(:ess, :rhat)}\n\nEstimate the effective sample size and widehatR of the samples of shape (draws, chains, parameters).\n\nWhen both ESS and widehatR are needed, this method is often more efficient than calling ess and rhat separately.\n\nSee rhat for a description of supported kinds and ess for a description of kwargs.\n\n\n\n\n\n","category":"function"},{"location":"","page":"Home","title":"Home","text":"The following autocov_methods are supported:","category":"page"},{"location":"","page":"Home","title":"Home","text":"AutocovMethod\nFFTAutocovMethod\nBDAAutocovMethod","category":"page"},{"location":"#MCMCDiagnosticTools.AutocovMethod","page":"Home","title":"MCMCDiagnosticTools.AutocovMethod","text":"AutocovMethod <: AbstractAutocovMethod\n\nThe AutocovMethod uses a standard algorithm for estimating the mean autocovariance of MCMC chains.\n\nIt is is based on the discussion by [VehtariGelman2021] and uses the biased estimator of the autocovariance, as discussed by [Geyer1992].\n\n[VehtariGelman2021]: Vehtari, A., Gelman, A., Simpson, D., Carpenter, B., & Bürkner, P. C. (2021). Rank-normalization, folding, and localization: An improved widehat R for assessing convergence of MCMC. Bayesian Analysis. doi: 10.1214/20-BA1221 arXiv: 1903.08008\n\n[Geyer1992]: Geyer, C. J. (1992). Practical Markov Chain Monte Carlo. Statistical Science, 473-483.\n\n\n\n\n\n","category":"type"},{"location":"#MCMCDiagnosticTools.FFTAutocovMethod","page":"Home","title":"MCMCDiagnosticTools.FFTAutocovMethod","text":"FFTAutocovMethod <: AbstractAutocovMethod\n\nThe FFTAutocovMethod uses a standard algorithm for estimating the mean autocovariance of MCMC chains.\n\nThe algorithm is the same as the one of AutocovMethod but this method uses fast Fourier transforms (FFTs) for estimating the autocorrelation.\n\ninfo: Info\nTo be able to use this method, you have to load a package that implements the AbstractFFTs.jl interface such as FFTW.jl or FastTransforms.jl.\n\n\n\n\n\n","category":"type"},{"location":"#MCMCDiagnosticTools.BDAAutocovMethod","page":"Home","title":"MCMCDiagnosticTools.BDAAutocovMethod","text":"BDAAutocovMethod <: AbstractAutocovMethod\n\nThe BDAAutocovMethod uses a standard algorithm for estimating the mean autocovariance of MCMC chains.\n\nIt is is based on the discussion by [VehtariGelman2021]. and uses the variogram estimator of the autocorrelation function discussed by [BDA3].\n\n[VehtariGelman2021]: Vehtari, A., Gelman, A., Simpson, D., Carpenter, B., & Bürkner, P. C. (2021). Rank-normalization, folding, and localization: An improved widehat R for assessing convergence of MCMC. Bayesian Analysis. doi: 10.1214/20-BA1221 arXiv: 1903.08008\n\n[BDA3]: Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013). Bayesian data analysis. CRC press.\n\n\n\n\n\n","category":"type"},{"location":"#Monte-Carlo-standard-error","page":"Home","title":"Monte Carlo standard error","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"mcse","category":"page"},{"location":"#MCMCDiagnosticTools.mcse","page":"Home","title":"MCMCDiagnosticTools.mcse","text":"mcse(samples::AbstractArray{<:Union{Missing,Real}}; kind=Statistics.mean, kwargs...)\n\nEstimate the Monte Carlo standard errors (MCSE) of the estimator kind applied to samples of shape (draws, chains, parameters).\n\nSee also: ess\n\nKinds of MCSE estimates\n\nThe estimator whose MCSE should be estimated is specified with kind. kind must accept a vector of the same eltype as samples and return a real estimate.\n\nFor the following estimators, the effective sample size ess and an estimate of the asymptotic variance are used to compute the MCSE, and kwargs are forwarded to ess:\n\nStatistics.mean\nStatistics.median\nStatistics.std\nBase.Fix2(Statistics.quantile, p::Real)\n\nFor other estimators, the subsampling bootstrap method (SBM)[FlegalJones2011][Flegal2012] is used as a fallback, and the only accepted kwargs are batch_size, which indicates the size of the overlapping batches used to estimate the MCSE, defaulting to floor(Int, sqrt(draws * chains)). Note that SBM tends to underestimate the MCSE, especially for highly autocorrelated chains. One should verify that autocorrelation is low by checking the bulk- and tail-ESS values.\n\n[FlegalJones2011]: Flegal JM, Jones GL. (2011) Implementing MCMC: estimating with confidence.                 Handbook of Markov Chain Monte Carlo. pp. 175-97.                 pdf\n\n[Flegal2012]: Flegal JM. (2012) Applicability of subsampling bootstrap methods in Markov chain Monte Carlo.            Monte Carlo and Quasi-Monte Carlo Methods 2010. pp. 363-72.            doi: 10.1007/978-3-642-27440-4_18\n\n\n\n\n\n","category":"function"},{"location":"#R-diagnostic","page":"Home","title":"R⋆ diagnostic","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"rstar","category":"page"},{"location":"#MCMCDiagnosticTools.rstar","page":"Home","title":"MCMCDiagnosticTools.rstar","text":"rstar(\n    rng::Random.AbstractRNG=Random.default_rng(),\n    classifier,\n    samples,\n    chain_indices::AbstractVector{Int};\n    subset::Real=0.7,\n    split_chains::Int=2,\n    verbosity::Int=0,\n)\n\nCompute the R^* convergence statistic of the table samples with the classifier.\n\nsamples must be either an AbstractMatrix, an AbstractVector, or a table (i.e. implements the Tables.jl interface) whose rows are draws and whose columns are parameters.\n\nchain_indices indicates the chain ids of each row of samples.\n\nThis method supports ragged chains, i.e. chains of nonequal lengths.\n\n\n\n\n\nrstar(\n    rng::Random.AbstractRNG=Random.default_rng(),\n    classifier,\n    samples::AbstractArray{<:Real,3};\n    subset::Real=0.7,\n    split_chains::Int=2,\n    verbosity::Int=0,\n)\n\nCompute the R^* convergence statistic of the samples with the classifier.\n\nsamples is an array of draws with the shape (draws, chains, parameters).`\n\nThis implementation is an adaption of algorithms 1 and 2 described by Lambert and Vehtari.\n\nThe classifier has to be a supervised classifier of the MLJ framework (see the MLJ documentation for a list of supported models). It is trained with a subset of the samples from each chain. Each chain is split into split_chains separate chains to additionally check for within-chain convergence. The training of the classifier can be inspected by adjusting the verbosity level.\n\nIf the classifier is deterministic, i.e., if it predicts a class, the value of the R^* statistic is returned (algorithm 1). If the classifier is probabilistic, i.e., if it outputs probabilities of classes, the scaled Poisson-binomial distribution of the R^* statistic is returned (algorithm 2).\n\nnote: Note\nThe correctness of the statistic depends on the convergence of the classifier used internally in the statistic.\n\nExamples\n\njulia> using MLJBase, MLJIteration, EvoTrees, Statistics\n\njulia> samples = fill(4.0, 100, 3, 2);\n\nOne can compute the distribution of the R^* statistic (algorithm 2) with a probabilistic classifier. For instance, we can use a gradient-boosted trees model with nrounds = 100 sequentially stacked trees and learning rate eta = 0.05:\n\njulia> model = EvoTreeClassifier(; nrounds=100, eta=0.05);\n\njulia> distribution = rstar(model, samples);\n\njulia> round(mean(distribution); digits=2)\n1.0f0\n\nNote, however, that it is recommended to determine nrounds based on early-stopping. With the MLJ framework, this can be achieved in the following way (see the MLJ documentation for additional explanations):\n\njulia> model = IteratedModel(;\n           model=EvoTreeClassifier(; eta=0.05),\n           iteration_parameter=:nrounds,\n           resampling=Holdout(),\n           measures=log_loss,\n           controls=[Step(5), Patience(2), NumberLimit(100)],\n           retrain=true,\n       );\n\njulia> distribution = rstar(model, samples);\n\njulia> round(mean(distribution); digits=2)\n1.0f0\n\nFor deterministic classifiers, a single R^* statistic (algorithm 1) is returned. Deterministic classifiers can also be derived from probabilistic classifiers by e.g. predicting the mode. In MLJ this corresponds to a pipeline of models.\n\njulia> evotree_deterministic = Pipeline(model; operation=predict_mode);\n\njulia> value = rstar(evotree_deterministic, samples);\n\njulia> round(value; digits=2)\n1.0\n\nReferences\n\nLambert, B., & Vehtari, A. (2020). R^*: A robust MCMC convergence diagnostic with uncertainty using decision tree classifiers.\n\n\n\n\n\n","category":"function"},{"location":"#Bayesian-fraction-of-missing-information","page":"Home","title":"Bayesian fraction of missing information","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"bfmi","category":"page"},{"location":"#MCMCDiagnosticTools.bfmi","page":"Home","title":"MCMCDiagnosticTools.bfmi","text":"bfmi(energy::AbstractVector{<:Real}) -> Real\nbfmi(energy::AbstractMatrix{<:Real}; dims::Int=1) -> AbstractVector{<:Real}\n\nCalculate the estimated Bayesian fraction of missing information (BFMI).\n\nWhen sampling with Hamiltonian Monte Carlo (HMC), BFMI quantifies how well momentum resampling matches the marginal energy distribution.\n\nThe current advice is that values smaller than 0.3 indicate poor sampling. However, this threshold is provisional and may change. A BFMI value below the threshold often indicates poor adaptation of sampling parameters or that the target distribution has heavy tails that were not well explored by the Markov chain.\n\nFor more information, see Section 6.1 of [Betancourt2018] or [Betancourt2016] for a complete account.\n\nenergy is either a vector of Hamiltonian energies of draws or a matrix of energies of draws for multiple chains. dims indicates the dimension in energy that contains the draws. The default dims=1 assumes energy has the shape draws or (draws, chains). If a different shape is provided, dims must be set accordingly.\n\nIf energy is a vector, a single BFMI value is returned. Otherwise, a vector of BFMI values for each chain is returned.\n\n[Betancourt2018]: Betancourt M. (2018). A Conceptual Introduction to Hamiltonian Monte Carlo. arXiv:1701.02434v2 [stat.ME]\n\n[Betancourt2016]: Betancourt M. (2016). Diagnosing Suboptimal Cotangent Disintegrations in Hamiltonian Monte Carlo. arXiv:1604.00695v1 [stat.ME]\n\n\n\n\n\n","category":"function"},{"location":"#Other-diagnostics","page":"Home","title":"Other diagnostics","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"discretediag\ngelmandiag\ngelmandiag_multivariate\ngewekediag\nheideldiag\nrafterydiag","category":"page"},{"location":"#MCMCDiagnosticTools.discretediag","page":"Home","title":"MCMCDiagnosticTools.discretediag","text":"discretediag(samples::AbstractArray{<:Real,3}; frac=0.3, method=:weiss, nsim=1_000)\n\nCompute discrete diagnostic on samples with shape (draws, chains, parameters).\n\nmethod can be one of :weiss, :hangartner, :DARBOOT, :MCBOOT, :billinsgley, and :billingsleyBOOT.\n\nReferences\n\nBenjamin E. Deonovic, & Brian J. Smith. (2017). Convergence diagnostics for MCMC draws of a categorical variable.\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.gelmandiag","page":"Home","title":"MCMCDiagnosticTools.gelmandiag","text":"gelmandiag(samples::AbstractArray{<:Real,3}; alpha::Real=0.95)\n\nCompute the Gelman, Rubin and Brooks diagnostics [Gelman1992] [Brooks1998] on samples with shape (draws, chains, parameters).  Values of the diagnostic’s potential scale reduction factor (PSRF) that are close to one suggest convergence.  As a rule-of-thumb, convergence is rejected if the 97.5 percentile of a PSRF is greater than 1.2.\n\n[Gelman1992]: Gelman, A., & Rubin, D. B. (1992). Inference from iterative simulation using multiple sequences. Statistical science, 7(4), 457-472.\n\n[Brooks1998]: Brooks, S. P., & Gelman, A. (1998). General methods for monitoring convergence of iterative simulations. Journal of computational and graphical statistics, 7(4), 434-455.\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.gelmandiag_multivariate","page":"Home","title":"MCMCDiagnosticTools.gelmandiag_multivariate","text":"gelmandiag_multivariate(samples::AbstractArray{<:Real,3}; alpha::Real=0.05)\n\nCompute the multivariate Gelman, Rubin and Brooks diagnostics on samples with shape (draws, chains, parameters).\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.gewekediag","page":"Home","title":"MCMCDiagnosticTools.gewekediag","text":"gewekediag(x::AbstractVector{<:Real}; first::Real=0.1, last::Real=0.5, kwargs...)\n\nCompute the Geweke diagnostic [Geweke1991] from the first and last proportion of samples x.\n\nThe diagnostic is designed to asses convergence of posterior means estimated with autocorrelated samples.  It computes a normal-based test statistic comparing the sample means in two windows containing proportions of the first and last iterations.  Users should ensure that there is sufficient separation between the two windows to assume that their samples are independent.  A non-significant test p-value indicates convergence.  Significant p-values indicate non-convergence and the possible need to discard initial samples as a burn-in sequence or to simulate additional samples.\n\nkwargs are forwarded to mcse.\n\n[Geweke1991]: Geweke, J. F. (1991). Evaluating the accuracy of sampling-based approaches to the calculation of posterior moments (No. 148). Federal Reserve Bank of Minneapolis.\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.heideldiag","page":"Home","title":"MCMCDiagnosticTools.heideldiag","text":"heideldiag(\n    x::AbstractVector{<:Real}; alpha::Real=0.05, eps::Real=0.1, start::Int=1, kwargs...\n)\n\nCompute the Heidelberger and Welch diagnostic [Heidelberger1983]. This diagnostic tests for non-convergence (non-stationarity) and whether ratios of estimation interval halfwidths to means are within a target ratio. Stationarity is rejected (0) for significant test p-values. Halfwidth tests are rejected (0) if observed ratios are greater than the target, as is the case for s2 and beta[1].\n\nkwargs are forwarded to mcse.\n\n[Heidelberger1983]: Heidelberger, P., & Welch, P. D. (1983). Simulation run length control in the presence of an initial transient. Operations Research, 31(6), 1109-1144.\n\n\n\n\n\n","category":"function"},{"location":"#MCMCDiagnosticTools.rafterydiag","page":"Home","title":"MCMCDiagnosticTools.rafterydiag","text":"rafterydiag(\n    x::AbstractVector{<:Real}; q=0.025, r=0.005, s=0.95, eps=0.001, range=1:length(x)\n)\n\nCompute the Raftery and Lewis diagnostic [Raftery1992]. This diagnostic is used to determine the number of iterations required to estimate a specified quantile q within a desired degree of accuracy.  The diagnostic is designed to determine the number of autocorrelated samples required to estimate a specified quantile theta_q, such that Pr(theta le theta_q) = q, within a desired degree of accuracy. In particular, if hattheta_q is the estimand and Pr(theta le hattheta_q) = hatP_q the estimated cumulative probability, then accuracy is specified in terms of r and s, where Pr(q - r  hatP_q  q + r) = s. Thinning may be employed in the calculation of the diagnostic to satisfy its underlying assumptions. However, users may not want to apply the same (or any) thinning when estimating posterior summary statistics because doing so results in a loss of information. Accordingly, sample sizes estimated by the diagnostic tend to be conservative (too large).\n\nFurthermore, the argument r specifies the margin of error for estimated cumulative probabilities and s the probability for the margin of error. eps specifies the tolerance within which the probabilities of transitioning from initial to retained iterations are within the equilibrium probabilities for the chain. This argument determines the number of samples to discard as a burn-in sequence and is typically left at its default value.\n\n[Raftery1992]: A L Raftery and S Lewis. Bayesian Statistics, chapter How Many Iterations in the Gibbs Sampler? Volume 4. Oxford University Press, New York, 1992.\n\n\n\n\n\n","category":"function"}]
}

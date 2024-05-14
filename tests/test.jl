using Turing
using StatsPlots

@model function gdemo(x, y)
    s² ~ InverseGamma(2, 3)
    m ~ Normal(0, sqrt(s²))
    x ~ Normal(m, sqrt(s²))
    return y ~ Normal(m, sqrt(s²))
end

chn = sample(gdemo(1.5, 2), NUTS(), 1000)

plot(chn)
using CausalInference
using DataFrames
using NamedTupleTools
using GLMakie
using GraphMakie
using Graphs

# Generate some sample data to use with the PC algorithm

N = 1000 # number of data points

# define simple linear model with added noise
x = randn(N)
v = x + randn(N)*0.25
w = x + randn(N)*0.25
z = v + w + randn(N)*0.25
s = z + randn(N)*0.25

nt = (x=x, v=v, w=w, z=z, s=s)
df = DataFrame(;nt...)

est_g = pcalg(nt, 0.01, gausscitest)
graphplot(est_g)

tp = plot_pc_graph(est_g, [String(k) for k in keys(nt)])

# ?graphplot
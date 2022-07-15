using Plots
using DelimitedFiles

times = readdlm("graph_data", ',')'
display(times)
times = log.(2,times)
display(times)

num_samples = 1:7
#labels = ["serial quadrature","reduction quadrature","atomic quadrature","serial monte-carlo","reduction monte-carlo","atomic monte-carlo"]

plot(legend=:topleft, title = "Increasing Runtime with Sample Size in Calculating Pi", xlabel="Log₁₀ # of grid points (quadrature), or # of samples (monte-carlo)", ylabel="Log₁₀ runtime (seconds)")

for i = 1:size(times)[1]

    plot!(num_samples, times[i, :], label=labels[i])
   
end

png("hw1_plot")


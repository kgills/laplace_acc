library(Hmisc)

k80_2048 = read.csv("../data/k80_2048_4.txt")
k80_4096 = read.csv("../data/k80_4096_4.txt")
k80_8192 = read.csv("../data/k80_8192_4.txt")
k80_16384 = read.csv("../data/k80_16384_4.txt")

# Convert FLOPS to GFLOPS
k80_2048$flops = k80_2048$flops /1000000000
k80_4096$flops = k80_4096$flops /1000000000
k80_8192$flops = k80_8192$flops /1000000000
k80_16384$flops = k80_16384$flops /1000000000

# TODO: Add the serial dataframes

# Aggregate the cores and mean flops
core_flops_ag = aggregate(flops~cores, core_all, mean)

# Add the speedup
core_flops_ag$speedup = core_flops_ag$flops/core_flops_ag$flops[1]

# Add the serial portion
core_flops_ag$serial = (core_flops_ag$speedup - core_flops_ag$cores)/(1 - core_flops_ag$cores)

# Add the efficiency 
# core_flops_ag$efficiency = (((1/core_flops_ag$speedup)-(core_flops_ag$cores))\(1 - (1/core_flops_ag$cores)))
core_flops_ag$karp = (((1/core_flops_ag$speedup)-(1/core_flops_ag$cores))/(1 - (1/core_flops_ag$cores)))

core_flops_format = format.df(core_flops_ag, digits=3)
core_flops_format = core_flops_format[,-1]


# Create box plots for the core_all flops
# png("core_all.png", width=600, height=500)
# boxplot(flops~cores, core_all, main="Cores vs FLOPS (10 iterations)", xlab="Cores", 
# 	ylab="Giga FLOPS", col="light blue")
# dev.off()

# Save the summary of the perf_28 flops data
# latex(summary(perf_28$flops), title="28 Cores, 100 iterations")

# latex(core_flops_format)

# Create plot for the karp-flatt metic
# png("karp_flatt_graph.png")
# plot(karp~cores, core_flops_ag)
# dev.off()



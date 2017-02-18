library(gridExtra)

k80_all = read.csv("../data/k80_all.txt")
p100_all = read.csv("../data/p100_all.txt")

# Convert FLOPS to GFLOPS
k80_all$flops = k80_all$flops /1000000000
p100_all$flops = p100_all$flops /1000000000

# Aggregate the cores and mean flops
k80_all_ag = aggregate(flops~matrix_dim, k80_all, mean)
p100_all_ag = aggregate(flops~matrix_dim, p100_all, mean)

# png("k80_all_ag.png") 
# grid.table(k80_all_ag, rows=NULL)
# dev.off()

# png("p100_all_ag.png") 
# grid.table(p100_all_ag, rows=NULL)
# dev.off()


# Add the serial execution data
serial_16384 = read.csv("../data/serial_16384.txt")
k80_16384 = read.csv("../data/k80_16384_4.txt")
p100_16384 = read.csv("../data/p100_16384.txt")

k80_16384=rbind(k80_16384, serial_16384)
p100_16384=rbind(p100_16384, serial_16384)

k80_16384<-k80_16384[order(k80_16384$cores),]
p100_16384<-p100_16384[order(p100_16384$cores),]

k80_16384_ag=aggregate(flops~cores,k80_16384, mean)
p100_16384_ag=aggregate(flops~cores,p100_16384, mean)

# Add the speedup
k80_16384_ag$speedup = k80_16384_ag$flops/k80_16384_ag$flops[1]
p100_16384_ag$speedup = p100_16384_ag$flops/p100_16384_ag$flops[1]

# Add the serial
k80_16384_ag$serial = (k80_16384_ag$speedup - k80_16384_ag$cores)/(1 - k80_16384_ag$cores)
p100_16384_ag$serial = (p100_16384_ag$speedup - p100_16384_ag$cores)/(1 - p100_16384_ag$cores)

# Add the karp
k80_16384_ag$karp = (((1/k80_16384_ag$speedup)-(1/k80_16384_ag$cores))/(1 - (1/k80_16384_ag$cores)))
p100_16384_ag$karp = (((1/p100_16384_ag$speedup)-(1/p100_16384_ag$cores))/(1 - (1/p100_16384_ag$cores)))

png("k80_16384_ag.png", width=600, height=200) 
grid.table(k80_16384_ag, rows=NULL)
dev.off()

png("p100_16384_ag.png", width=600, height=200) 
grid.table(p100_16384_ag, rows=NULL)
dev.off()

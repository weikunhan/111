# EE 219 Homework 3 Problem 2
# Name: Weikun Han, Duzhi Chen
# Date: 4/27/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path <- "~/Documents/hw3/sorted_directed_net.txt"

# Load graph from path
graph <- read.graph(file = file_path, format = "ncol", directed = TRUE)

# Find the giant connected component (GCC)
cluster <- components(graph, mode = "strong")
gcc_index <- which.max(cluster$csize)
non_gcc_nodes <- (1:vcount(graph))[cluster$membership != gcc_index]
gcc <- delete.vertices(graph, non_gcc_nodes)

# Use degree fucntion to find a numeric vector of the same length as argument v
degree1 <- degree(gcc, mode = "in")
degree2 <- degree(gcc, mode = "out")

# Plot the degree distributions
h1 <- hist(degree1,
           breaks = seq(0, by = 1 , length.out = max(degree1) + 2),
           freq = FALSE,
           main = "In degree distribution for giant connected component (stongly connected)",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(data.frame(x = h1$mids, y = h1$density),
     type = "o",
     main = "In degree distribution for giant connected component (stongly connected)",
     ylab = "Fraction of nodes",
     xlab = "Degree")
h2 <- hist(degree2,
           breaks = seq(0, by = 1 , length.out = max(degree2) + 2),
           freq = FALSE,
           main = "Out degree distribution for giant connected component (stongly connected)",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(data.frame(x = h2$mids, y = h2$density),
     type = "o",
     main = "Out degree distribution for giant connected component (stongly connected)",
     ylab = "Fraction of nodes",
     xlab = "Degree")

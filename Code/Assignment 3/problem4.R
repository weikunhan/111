# EE 219 Homework 3 Problem 4
# Name: Weikun Han, Duzhi Chen
# Date: 4/28/2017
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

# Convert GCC into an undirected network
gcc_undirected <- as.undirected(gcc, mode="collapse", edge.attr.comb = list(weight = "prod"))
E(gcc_undirected)$weight <- sqrt(E(gcc_undirected)$weight)

# Use fast greedy method to find the community structure
fc <- fastgreedy.community(gcc_undirected)

# Find the largest community (LC) computed from fastgreedy.community
lc_index <- which.max(sizes(fc))
non_lc_nodes <- (1:vcount(gcc_undirected))[membership(fc) != lc_index]
lc <- delete.vertices(gcc_undirected, non_lc_nodes)

# Use fast greedy method to find the sub community structure
fc_sub <- fastgreedy.community(lc)

# Plot the sub community structure
plot(fc_sub, lc)

# Print information
print(fc_sub)
print(sizes(fc_sub))
cat("-------------------------Processing Finshed 1-----------------------------------\n",
    "Fast greedy method find sub-community structure of the largest community done.\n",
    "The length of the community structure is: ", length(fc_sub), "\n",
    "The modularity of the community structure is: ", modularity(fc_sub), "\n",
    "--------------------------------------------------------------------------------\n")

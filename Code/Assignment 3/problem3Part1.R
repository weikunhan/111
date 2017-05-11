# EE232E Homework 3 Problem 3 Part 1
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

# Convert GCC into an undirected network
gcc_undirected <- as.undirected(gcc, mode = "each")

# Base on propagating labels to find the community structure
lpc <- label.propagation.community(gcc_undirected)

# Plot information
plot(lpc, gcc_undirected)

# Print information
print(lpc)
print(sizes(lpc))
cat("-------------------------Processing Finshed 1-----------------------------------\n",
    "Base on propagating labels to find the community structure done.\n",
    "The length of the community structure is: ", length(lpc), "\n",
    "The modularity of the community structure is: ", modularity(lpc), "\n",
    "--------------------------------------------------------------------------------\n")

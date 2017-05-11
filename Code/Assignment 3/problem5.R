# EE232E Homework 3 Problem 5
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

# Find the community sizes are larger than 100 computed from fastgreedy.community
c_index <- which(sizes(fc) > 100)

for (i in 1:length(c_index)) {
    non_c_nodes = (1:vcount(gcc_undirected))[membership(fc) != c_index[i]]
    c = delete.vertices(gcc_undirected, non_c_nodes)

    # Use fast greedy method to find the sub community structure
    fc_sub = fastgreedy.community(c)

    # Plot information
    plot(fc_sub, c)

    # Print information
    print(fc_sub)
    print(sizes(fc_sub))
    cat("-------------------------Processing Finshed ", i, "-----------------------------------\n",
        "Fast greedy method find sub-community structure of the largest community done.\n",
        "The length of the community structure is: ", length(fc_sub), "\n",
        "The modularity of the community structure is: ", modularity(fc_sub), "\n",
        "--------------------------------------------------------------------------------\n")
}

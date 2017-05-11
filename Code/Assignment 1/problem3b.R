# EE232E Homework 1 Problem 3 b
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000

# Create the undirected random network,
# whose a new vertex is added it creates a number of links to old vertices
# and the probability that an old vertex is cited depends on its in-degree and age
graph <- aging.prefatt.game(node, pa.exp = 1, aging.exp = -1, aging.bin = 1000, directed = FALSE)

# Find the giant connected component (GCC)
cluster <- clusters(graph)
gcc_index <- which.max(cluster$csize)
non_gcc_nodes <- (1:vcount(graph))[cluster$membership != gcc_index]
gcc <- delete.vertices(graph, non_gcc_nodes)

# Plot information
plot(gcc)

# Use fast greedy method to find the community structure
fc <- fastgreedy.community(gcc)

# Plot information
plot(fc, graph)

# Print information
cat("-------------------------Processing Finshed 1----------------------------------\n",
    "Fast greedy method to find the community structure done.\n",
    "The modularity is: ", modularity(fc), "\n",
    "-------------------------------------------------------------------------------\n")

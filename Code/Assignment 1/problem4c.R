# EE 219 Homework 1 Problem 4 b
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000

# Create the directed random network,
# that is a growing network model,
# which resembles how the forest fire spreads by igniting trees close by
graph <- forest.fire.game(node, fw.prob = 0.37, bw.factor = 0.32/0.37, directed = TRUE)

# Find the giant connected component (GCC)
cluster <- clusters(graph)
gcc_index <- which.max(cluster$csize)
non_gcc_nodes <- (1:vcount(graph))[cluster$membership != gcc_index]
gcc <- delete.vertices(graph, non_gcc_nodes)

# Plot the GCC
plot(gcc)

# Use spinglass method to find the community structure
sc <- spinglass.community(gcc)

# Plot the community structure
plot(sc, graph)

# Print information
cat("-------------------------Processing Finshed 1----------------------------------\n",
    "Spinglass method to find the community structure done.\n",
    "The length of the community structure is: ", length(sc), "\n",
    "The modularity is: ", modularity(sc), "\n",
    "-------------------------------------------------------------------------------\n")

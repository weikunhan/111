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

# Check the determeter for the directed random network
diameter <- diameter(graph)
path <- get.diameter(graph)

# Print information
cat("-------------------------Processing Finshed 4----------------------------------\n",
    "Graph have the diameters: ", diameter, "\n",
    "And a path with this diameter is: ", path, "\n",
    "-------------------------------------------------------------------------------\n")

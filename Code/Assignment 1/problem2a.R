# EE 219 Homework 1 Problem 2 a
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000

# Create the undirected random network,
# whose degree distribution is proportional to x^(-3)
graph <- barabasi.game(node, directed = FALSE)

# Use degree fucntion to find a numeric vector of the same length as argument v
degree <- degree(graph)

# Plot information
h <- hist(degree,
          breaks = seq(-0.5, by = 1 , length.out = max(degree) + 2),
          freq = FALSE,
          main = "Degree distribution for graph is proportional to x^(-3)",
          ylab = "Fraction of nodes",
          xlab = "Degree")
plot(degree.distribution(graph),
     main = "Degree distribution for graph is proportional to x^(-3)",
     ylab = "Fraction of nodes",
     xlab = "Degree")

# Check the determeter for the undirected random network
diameter <- diameter(graph, directed = FALSE, unconnected = FALSE, weights = NULL)
path <- get.diameter(graph, directed = FALSE, unconnected = FALSE, weights = NULL)

# Print information
cat("-------------------------Processing Finshed 1----------------------------------\n",
    "Graph have the diameters: ", diameter, "\n",
    "And a path with this diameter is: ", path, "\n",
    "-------------------------------------------------------------------------------\n")

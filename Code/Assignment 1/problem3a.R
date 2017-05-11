# EE232E Homework 1 Problem 3 a
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

# Use degree fucntion to find a numeric vector of the same length as argument v
degree <- degree(graph)

# Plot information
h <- hist(degree,
           breaks = seq(0, by = 1 , length.out = max(degree) + 2),
           freq = FALSE,
           main = "Degree distribution for graph with probability aging.exp = -1",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(degree.distribution(graph),
     main = "Degree distribution for graph with probability aging.exp = -1",
     ylab = "Fraction of nodes",
     xlab = "Degree")

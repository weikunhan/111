# EE 219 Homework 1 Problem 4 a
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

# Use degree fucntion to find a numeric vector of the same length as argument v
degree1 <- degree(graph, mode = "in")
degree2 <- degree(graph, mode = "out")

# Plot information
h1 <- hist(degree1,
           breaks = seq(0, by = 1 , length.out = max(degree1) + 2),
           freq = FALSE,
           main = "In degree distribution for graph with probability fw.prob = 0.37",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(data.frame(x = h1$mids, y = h1$density),
     type = "o",
     main = "In degree distribution for graph with probability fw.prob = 0.37",
     ylab = "Fraction of nodes",
     xlab = "Degree")
h2 <- hist(degree2,
           breaks = seq(0, by = 1 , length.out = max(degree2) + 2),
           freq = FALSE,
           main = "Out degree distribution for graph with probability fw.prob = 0.37",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(data.frame(x = h2$mids, y = h2$density),
     type = "o",
     main = "Out degree distribution for graph with probability fw.prob = 0.37",
     ylab = "Fraction of nodes",
     xlab = "Degree")

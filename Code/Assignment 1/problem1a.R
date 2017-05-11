# EE232E Homework 1 Problem 1 a
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000
p <- c(0.01, 0.05, 0.1)

# Create three undirected random networks, and the probability p is
# for drawing an edge between two arbitrary vertices
graph1 <- random.graph.game(node, p[1], directed = FALSE)
graph2 <- random.graph.game(node, p[2], directed = FALSE)
graph3 <- random.graph.game(node, p[3], directed = FALSE)

# Use degree fucntion to find a numeric vector of the same length as argument v
degree1 <- degree(graph1)
degree2 <- degree(graph2)
degree3 <- degree(graph3)

# Plot information
h1 <- hist(degree1,
           breaks = seq(-0.5, by = 1 , length.out = max(degree1) + 2),
           freq = FALSE,
           main = "Degree distribution for graph 1 with probability is 0.01",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(degree.distribution(graph1),
     main = "Degree distribution for graph 1 with probability is 0.01",
     ylab = "Fraction of nodes",
     xlab = "Degree")
h2 <- hist(degree2,
           breaks = seq(-0.5, by = 1 , length.out = max(degree2) + 2),
           freq = FALSE,
           main = "Degree distribution for graph 2 with probability is 0.05",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(degree.distribution(graph2),
     main = "Degree distribution for graph 1 with probability is 0.05",
     ylab = "Fraction of nodes",
     xlab = "Degree")
h3 <- hist(degree3,
           breaks = seq(-0.5, by = 1 , length.out = max(degree3) + 2),
           freq = FALSE,
           main = "Degree distribution for graph 3 with probability is 0.1",
           ylab = "Fraction of nodes",
           xlab = "Degree")
plot(degree.distribution(graph3),
     main = "Degree distribution for graph 1 with probability is 0.1",
     ylab = "Fraction of nodes",
     xlab = "Degree")

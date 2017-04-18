# EE 219 Homework 1 Problem 2 d
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000
iteration <- 100
degree <- numeric()

# Create number of ieration undirected random networks
for (it in 1:iteration) {

    # Create the undirected random network,
    # whose degree distribution is proportional to x^(-3)
    graph = barabasi.game(node, directed = FALSE)

    # Randomly pick a node i, and then randomly pick a neighbor j of that node
	i = sample(1:num, 1)
	x = neighborhood(graph, 1, i)
	y = c(x[[1]][-1])
	j = sample(y, 1)
	degree = c(degree, degree(graph, j))
}

# Plot the degree distributions
h <- hist(degree,
          breaks = seq(from = 0, to = max(deg) + 1, by = 1),
          freq = FALSE,
          main = "Degree distribution of nodes j with 1000 nodes",
          ylab = "Fraction of nodes",
          xlab = "Degree")
plot(data.frame(x = h$mids, y = h$density),
     type = "o",
     main = "Degree distribution of nodes j with 1000 nodes",
     ylab = "Fraction of nodes",
     xlab = "Degree")

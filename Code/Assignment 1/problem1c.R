# EE232E Homework 1 Problem 1 c
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 1000
p <- 0.001

# Check the threshold probability for the undirected random network
repeat {

    # Create three undirected random networks, and the probability p is 0.001
    # for drawing an edge between two arbitrary vertices
    graph <- random.graph.game(node, p, directed = FALSE)

    # Cheak the threshold probability
    if (is.connected(graph)) {

        # Print information
        cat("-------------------------Processing Finshed 1-----------------------------\n",
            "Graph start the edge between two arbitrary vertices with probability is 0.001\n",
            "Graph each time increase the 0.001 probability \n",
            "Graph have the threshold probability is: ", p, "\n",
            "--------------------------------------------------------------------------\n")
        break()
    } else {
        p <- p + 0.001
    }
}

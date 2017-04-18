# EE 219 Homework 1 Problem 1 b
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

# Check the graph 1 connectivity
if(is.connected(graph1)) {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Graph 1 draw the edge between two arbitrary vertices with probability is 0.01\n",
        "Connectiveity: Conneected\n",
        "-------------------------------------------------------------------------------\n")
} else {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Graph 1 draw the edge between two arbitrary vertices with probability is 0.01\n",
        "Connectiveity: Not conneected\n",
        "-------------------------------------------------------------------------------\n")
}

# Check the graph 2 connectivity
if(is.connected(graph2)) {

    # Print information
    cat("-------------------------Processing Finshed 2----------------------------------\n",
        "Graph 2 draw the edge between two arbitrary vertices with probability is 0.05\n",
        "Connectiveity: Conneected\n",
        "-------------------------------------------------------------------------------\n")
} else {

    # Print information
    cat("-------------------------Processing Finshed 2----------------------------------\n",
        "Graph 2 draw the edge between two arbitrary vertices with probability is 0.05\n",
        "Connectiveity: Not conneected\n",
        "-------------------------------------------------------------------------------\n")
}

# Check the graph 3 connectivity
if(is.connected(graph3)) {

    # Print information
    cat("-------------------------Processing Finshed 3----------------------------------\n",
        "Graph 3 draw the edge between two arbitrary vertices with probability is 0.1\n",
        "Connectiveity: Conneected\n",
        "-------------------------------------------------------------------------------\n")
} else {

    # Print information
    cat("-------------------------Processing Finshed 3----------------------------------\n",
        "Graph 3 draw the edge between two arbitrary vertices with probability is 0.1\n",
        "Connectiveity: Not conneected\n",
        "-------------------------------------------------------------------------------\n")
}

# Check the determeters for three undirected random networks
diameter1 <- diameter(graph1, directed = FALSE, unconnected = FALSE, weights = NULL)
path1 <- get.diameter(graph1, directed = FALSE, unconnected = FALSE, weights = NULL)
diameter2 <- diameter(graph2, directed = FALSE, unconnected = FALSE, weights = NULL)
path2 <- get.diameter(graph2, directed = FALSE, unconnected = FALSE, weights = NULL)
diameter3 <- diameter(graph3, directed = FALSE, unconnected = FALSE, weights = NULL)
path3 <- get.diameter(graph3, directed = FALSE, unconnected = FALSE, weights = NULL)

# Print information
cat("-------------------------Processing Finshed 4----------------------------------\n",
    "Graph 1 have the diameters: ", diameter1, "\n",
    "And a path with this diameter is: ", path1, "\n",
    "Graph 2 have the diameters: ", diameter2, "\n",
    "And a path with this diameter is: ",path2, "\n",
    "Graph 3 have the diameters: ", diameter3, "\n",
    "And a path with this diameter is: ",path3, "\n",
    "-------------------------------------------------------------------------------\n")

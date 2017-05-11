# EE 219 Homework 3 Problem 1
# Name: Weikun Han, Duzhi Chen
# Date: 4/27/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path <- "~/Documents/hw3/sorted_directed_net.txt"

# Load the graph from the path
graph <- read.graph(file = file_path, format = "ncol", directed = TRUE)

# Check the graph connectivity
if(is.connected(graph)) {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Sucessfully load the graph from path.\n",
        "Connectiveity: Conneected\n",
        "-------------------------------------------------------------------------------\n")
} else {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Sucessfully load the graph from path.\n",
        "Connectiveity: Not conneected\n",
        "-------------------------------------------------------------------------------\n")
}

# Find the giant connected component (GCC)
cluster <- components(graph, mode = "strong")
gcc_index <- which.max(cluster$csize)
non_gcc_nodes <- (1:vcount(graph))[cluster$membership != gcc_index]
gcc <- delete.vertices(graph, non_gcc_nodes)

# Plot information
plot(gcc)

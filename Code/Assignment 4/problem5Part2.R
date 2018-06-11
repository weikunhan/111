# EE232E Homework 4 Problem 5 Part 2
# Name: Weikun Han, Duzhi Chen
# Date: 6/1/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")
library("PairViz")
library("graph")

# Setup the file path to load data
file_path <- "/home/weikun/Downloads/finance_data/graph_mst.txt"

# Read .txt file
file <- read.table(file_path, header = FALSE)

# Initial veriables
tsp <- numeric(0)
node_from2 <- numeric(0)
node_to2 <- numeric(0)

# Get node from and node to  and weight
node_from1 <- file[1:nrow(file), "V1"]
node_to1 <- file[1:nrow(file), "V2"]
weight <- file[1:nrow(file), "V3"]
ft <- cbind(node_from1, node_to1)

# Create graph use 'graph' package
graph <- ftM2graphNEL(ft, edgemode = "undirected", W = weight)

# Print information
cat("--------------------------Processing Finshed 1 --------------------------------\n",
    "Successful convert the graph in 'igraph' package into graphNEL 'graph' package.\n",
    "Dose it create a multigraph G by using two copies of each edge of MST: ", is_even_graph(graph), "\n",
    "-------------------------------------------------------------------------------\n")

# Create a multigraph G by using two copies of each edge of MST
graph_even <- mk_even_graph(graph)

# Print information
cat("--------------------------Processing Finshed 2 --------------------------------\n",
    "Successful create a multigraph G by using two copies of each edge of MST.\n",
    "Dose it create a multigraph G by using two copies of each edge of MST: ", is_even_graph(graph_even), "\n",
    "-------------------------------------------------------------------------------\n")

# Get the Eulerian circuit for the graph
eulerian_cycle <- etour(graph_even, weighted=TRUE)

# Print information
eulerian_cycle
cat("--------------------------Processing Finshed 3 --------------------------------\n",
    "Successful get the Eulerian circuit for double edges of MST.\n",
    "The number of tour nodes in Eulerian circuit: ", length(eulerian_cycle), "\n",
    "-------------------------------------------------------------------------------\n")

# Apporximate the traveling salesman problem (TSP)
tsp_tour <- unique(eulerian_cycle)
tsp_tour <- as.numeric(tsp_tour)
tsp_tour <- c(tsp_tour, tsp_tour[1])

# Print information
tsp_tour
cat("--------------------------Processing Finshed 4 --------------------------------\n",
    "Successful find an approximation tour for the traveling salesman problem (TSP) on G.\n",
    "The number of nodes in an apporximate the traveling salesman problem (TSP): ", length(unique(tsp_tour)),"\n",
    "-------------------------------------------------------------------------------\n")

# Convert the tour into edge list
for (i in 2:length(tsp_tour)) {
    tsp <- c(tsp, tsp_tour[i - 1])
    tsp <- c(tsp, tsp_tour[i])
}

# Get node from and node to
for (i in 1:length(tsp)) {
    if ((i %% 2) == 0) {
        node_to2 <- c(node_to2, tsp[i])
    } else {
        node_from2 <- c(node_from2, tsp[i])
    }
}
relation <- data.frame(from = node_from2, to = node_to2)

# Get the graph for apporximate the traveling salesman problem (TSP)
graph_tsp <- graph.data.frame(relation, directed = FALSE)

# Plot information
plot(graph_tsp,
     vertex.size = 5, 
     vertex.color = "blue",
     vertex.label.color = "red",
     vertex.label.dist = 1,
     layout = layout.kamada.kawai)
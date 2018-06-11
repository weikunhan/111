# EE232E Homework 4 Problem 5 Part 1
# Name: Weikun Han, Duzhi Chen
# Date: 6/1/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path <- "/home/weikun/Downloads/finance_data/graph.txt"

# Load the graph from the path
graph <- read.graph(file = file_path, format = "ncol", directed = FALSE)

# Run Minimum Spanning Trees
graph_mst <- mst(graph)

# Store graph into .txt file
write.graph(graph_mst, file = "/home/weikun/Downloads/finance_data/graph_mst.txt", format = "ncol")

# Print information
cat("--------------------------Processing Finshed 1 --------------------------------\n",
    "Successful store graph_mst into .txt file.\n",
    "The file store at /home/weikun/Downloads/finance_data/graph_mst.txt\n",
    "-------------------------------------------------------------------------------\n")


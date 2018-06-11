# EE232E Homework 4 Problem 7 Part 4
# Name: Weikun Han, Duzhi Chen
# Date: 6/5/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path1 <- "/home/weikun/Downloads/finance_data/graph3.txt"
file_path2 <- "/home/weikun/Downloads/finance_data/Name_sector.csv"

# Load the graph from the path
graph <- read.graph(file = file_path1, format = "ncol", directed = FALSE)

# Get files name and sectors name
file <- read.csv(file_path2, header = TRUE)

# Initial veriables
sector_id <- numeric(0)
probability_total <- numeric(0)

# Get all sectors information
sector <- file[1:nrow(file), "Sector"]

# Read all sectors information and give new sector ID to it
for (i in 1:nrow(file)) {
    if (sector[i] == "Health Care") {
        sector_id <- c(sector_id, 1)
    } else if (sector[i] == "Industrials") {
        sector_id <- c(sector_id, 2)
    } else if (sector[i] == "Consumer Discretionary") {
        sector_id <- c(sector_id, 3)
    } else if (sector[i] == "Information Technology") {
        sector_id <- c(sector_id, 4)
    } else if (sector[i] == "Consumer Staples") {
        sector_id <- c(sector_id, 5)
    } else if (sector[i] == "Utilities") {
        sector_id <- c(sector_id, 6)
    } else if (sector[i] == "Financials") {
        sector_id <- c(sector_id, 7)
    } else if (sector[i] == "Real Estate") {
        sector_id <- c(sector_id, 8)
    } else if (sector[i] == "Materials") {
        sector_id <- c(sector_id, 9)
    } else if (sector[i] == "Energy") {
        sector_id <- c(sector_id, 10)
    } else if (sector[i] == "Telecommunication Services") {
        sector_id <- c(sector_id, 11)
    } else {
        sector_id <- c(sector_id, 0)
    }
}

# Change all names in graph with new sector ID
V(graph)$name <- sector_id

# Run Minimum Spanning Trees
graph_mst <- mst(graph)

# Calculate totol probability
for (i in 1:vcount(graph_mst)) {
    neighbor_i = neighbors(graph_mst, i)
    count <- 0
    probability <- 0

    # Calculate each probability
    for (j in 1:length(neighbor_i)) {
        if (neighbor_i[j]$name == V(graph_mst)[i]$name) {
            count <- count + 1
        }
    }
    probability <- count / length(neighbor_i)
    probability_total <- c(probability_total, probability)
}

# Evaluate the performance of such a method of requirement
performance <- 1 / vcount(graph_mst) * sum(probability_total)

# Print information
cat("--------------------------Processing Finshed 1 --------------------------------\n",
    "Successful evaluating sector clustering in Minimum Spanning Trees (MSTs)\n",
    "The proformace is calculated as: ", performance, "\n",
    "-------------------------------------------------------------------------------\n")

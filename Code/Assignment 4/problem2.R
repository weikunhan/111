# EE232E Homework 1 Problem 2
# Name: Weikun Han, Duzhi Chen
# Date: 5/28/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path <- "/home/weikun/Downloads/finance_data/data/"

# Set working directory
#setwd(file_path)

# Get the files names
files <- list.files(path = file_path, pattern = "*.csv")

# Initial veriables
file_list <- list()
file_id <- 1

# Read every file and calculate the log return of the closing price
for (i in 1:length(files)) {
    
    # Initial veriables
    log_return <- numeric(0)

    # Read each file
    file_i <- read.csv(files[i], header = TRUE, stringsAsFactors = FALSE)
        
    # Find indices associated with the dates
    rows <- nrow(file_i)
        
    # Find all close prices
    close_price <- file_i[1:rows, "Close"]
        
    # Calculate total time period log return and store it
    for (j in 2:length(close_price)) {
        log_return <- c(log_return, log(close_price[j]) - log(close_price[j - 1]))
    }
    file_list[[file_id]] <- log_return
    file_id <- file_id + 1
}

# Print information
cat("--------------------------Processing Finshed 1 --------------------------------\n",
    "Successful calculated all log return values in each file.\n",
    "The total number of files we processed: ", length(files), "\n",
    "The total number of log return values in single file: ", length(log_return), "\n",
    "-------------------------------------------------------------------------------\n")

# Calcaulte the cross correlation coefficient of two different stock-return time series
coefficient_matrix <- matrix(nrow = length(files), ncol = length(files))
for (i in 1:length(files)) {
    for(j in 1:length(files)) {
        numerator1 <- mean(file_list[[i]] * file_list[[j]])
        numerator2 <- mean(file_list[[i]]) * mean(file_list[[j]])
        numerator <- numerator1 - numerator2
        denominator1 <- mean(file_list[[i]] ^ 2) - mean(file_list[[i]]) ^ 2
        denominator2 <- mean(file_list[[j]] ^ 2) - mean(file_list[[j]]) ^ 2
        denominator <- sqrt(denominator1 * denominator2)
        coefficient_matrix[i, j] <- numerator / denominator
    }
}

# Print information
cat("--------------------------Processing Finshed 2 --------------------------------\n",
    "Successful calculated the cross correlation coefficient of two different stock-return time series.\n",
    "The total number of p value we processed: ", (length(files) * length(files)), "\n",
    "-------------------------------------------------------------------------------\n")

# Calcaulate the length of the link connecting two different stock return time series i, j
adjacency_matrix <- matrix(nrow = length(files), ncol = length(files))
for (i in 1:length(files)) {
    for(j in 1:length(files)) {
        adjacency_matrix[i, j] <- sqrt(2 * (1 -  coefficient_matrix[i, j]))
    }
}

# Print information
cat("--------------------------Processing Finshed 3 --------------------------------\n",
    "Successful calculated the length of the link connecting two different stock return time series i, j.\n",
    "The total number of d value we processed: ", (length(files) * length(files)), "\n",
    "-------------------------------------------------------------------------------\n")

# Plot information
hist(adjacency_matrix, 
     main = "Histogram for D (the length of the link connecting two different stock return time series i, j)", 
     xlab = "D value")

# Load the graph from matrix
graph <- graph.adjacency(adjacency_matrix, mode = "directed", weighted = TRUE)

# Plot information
plot(graph,
     vertex.size = 5,
     vertex.color = "blue",
     vertex.label = NA)

# Store graph into .txt file
write.graph(graph, file = "/home/weikun/Downloads/finance_data/graph.txt", format = "ncol")

# Print information
cat("--------------------------Processing Finshed 4 --------------------------------\n",
    "Successful store graph into .txt file.\n",
    "The file store at /home/weikun/Downloads/finance_data/graph.txt\n",
    "-------------------------------------------------------------------------------\n")

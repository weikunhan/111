# EE232E Homework 1 Problem 6 Part 1
# Name: Weikun Han, Duzhi Chen
# Date: 5/28/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library("igraph")

# Setup the file path to load data
file_path1 <- "/home/weikun/Downloads/finance_data/data"
file_path2 <- "/home/weikun/Downloads/finance_data/Name_sector.csv"

# Set working directory
setwd(file_path1)

# Get files name and sectors name
file <- read.csv(file_path2, header = TRUE)

# Initial veriables
file_list <- list()
file_id <- 1
first_day <- as.Date("2014-05-05")

# Get files name
name <- file[1:nrow(file), "Symbol"]

# Create Mondays dataset
monday <- first_day
for (i in 1:nrow(file)) {
    first_day <- first_day + 7
    monday <- c(monday, first_day)
}
monday <- as.character(monday) 

# Read every file and calculate the log return of the closing price
for (i in 1:nrow(file)) {
  
    # Initial veriables
    log_return <- numeric(0)
    monday_price <- numeric(0)
  
    # Read each file
    name_i <- paste(name[i], ".csv", sep = "")
    file_i <- read.csv(name_i, header = TRUE, stringsAsFactors = FALSE)
    
    # Find all days
    day <- file_i[1:nrow(file_i), "Date"]
  
    # Find all close prices
    close_price <- file_i[1:nrow(file_i), "Close"]
    
    # FInd close prices on Mondays
    for (j in 1:length(day)) {
        for (k in 1:length(monday)) {
            if (monday[k] == day[j]) {
                monday_price <- c(monday_price, close_price[j])
            }
        }
    }
  
    # Calculate total time period log return and store it
    for (j in 2:length(monday_price)) {
      log_return <- c(log_return, log(monday_price[j]) - log(monday_price[j - 1]))
    }
    file_list[[file_id]] <- log_return
    file_id <- file_id + 1
}

# Print information
cat("--------------------------Processing Finshed 1 --------------------------------\n",
    "Successful calculated all log return values in each file.\n",
    "The total number of files we processed: ", nrow(file), "\n",
    "The total number of log return values in single file: ", length(log_return), "\n",
    "-------------------------------------------------------------------------------\n")

# Calcaulte the cross correlation coefficient of two different stock-return time series
matrix_coefficient <- matrix(nrow = nrow(file), ncol = nrow(file))
for (i in 1:nrow(file)) {
  for(j in 1:nrow(file)) {
    numerator1 <- mean(file_list[[i]] * file_list[[j]])
    numerator2 <- mean(file_list[[i]]) * mean(file_list[[j]])
    numerator <- numerator1 - numerator2
    denominator1 <- mean(file_list[[i]] ^ 2) - mean(file_list[[i]]) ^ 2
    denominator2 <- mean(file_list[[j]] ^ 2) - mean(file_list[[j]]) ^ 2
    denominator <- sqrt(denominator1 * denominator2)
    matrix_coefficient[i, j] <- numerator / denominator
  }
}

# Print information
cat("--------------------------Processing Finshed 2 --------------------------------\n",
    "Successful calculated the cross correlation coefficient of two different stock-return time series.\n",
    "The total number of p value we processed: ", (nrow(file) * nrow(file)), "\n",
    "-------------------------------------------------------------------------------\n")

# Calcaulate the length of the link connecting two different stock return time series i, j
matrix_adjacency <- matrix(nrow = nrow(file), ncol = nrow(file))
for (i in 1:nrow(file)) {
  for(j in 1:nrow(file)) {
    matrix_adjacency[i, j] <- sqrt(2 * (1 -  matrix_coefficient[i, j]))
  }
}

# Print information
cat("--------------------------Processing Finshed 3 --------------------------------\n",
    "Successful calculated the length of the link connecting two different stock return time series i, j.\n",
    "The total number of d value we processed: ", (nrow(file) * nrow(file)), "\n",
    "-------------------------------------------------------------------------------\n")

# Plot information
hist(matrix_adjacency,
     breaks = 40,
     main = "Histogram for D (the length of the link connecting two different stock return time series i, j)", 
     xlab = "D value")

# Load the graph from matrix
graph <- graph.adjacency(matrix_adjacency, mode = "undirected", weighted = TRUE)

# Plot information
plot(graph,
     vertex.size = 5,
     vertex.color = "blue",
     vertex.label = NA)

# Store graph into .txt file
write.graph(graph, file = "/home/weikun/Downloads/finance_data/graph2.txt", format = "ncol")

# Print information
cat("--------------------------Processing Finshed 4 --------------------------------\n",
    "Successful store graph into .txt file.\n",
    "The file store at /home/weikun/Downloads/finance_data/graph2.txt\n",
    "-------------------------------------------------------------------------------\n")
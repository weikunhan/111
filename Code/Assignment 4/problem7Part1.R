# EE232E Homework 1 Problem 7 Part 1
# Name: Weikun Han, Duzhi Chen
# Date: 6/5/2017
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

# Get files name
name <- file[1:nrow(file), "Symbol"]

# Read every file and calculate the log return of the closing price
for (i in 1:nrow(file)) {

    # Initial veriables
    log_return <- numeric(0)

    # Read each file
    name_i <- paste(name[i], ".csv", sep = "")
    file_i <- read.csv(name_i, header = TRUE, stringsAsFactors = FALSE)

    # Find all close prices
    close_price <- file_i[1:nrow(file_i), "Close"]

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

# Plot information
hist(matrix_coefficient,
     breaks = 40,
     main = "Histogram for P (the cross correlation coefficient of two different stock-return time series)",
     xlab = "P value")

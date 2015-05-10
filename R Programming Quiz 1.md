# R Programming Week 1 Quiz 1

## set directory to "/Users/Mengmeng/R Programming"
getwd()
setwd("/Users/Mengmeng/R Programming")
hw1_data <- read.csv("hw1_data.csv")

## Question 11. In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(hw1_data)

## Question 12. Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
hw1_data[1:2, ]
head(hw1_data, 2)

## Question 13. How many observations (i.e. rows) are in this data frame?
nrow(hw1_data)

## Question 14. Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(hw1_data, 2)

## Question 15. What is the value of Ozone in the 47th row?
hw1_data[47, ]$Ozone

## Question 16. How many missing values are in the Ozone column of this data frame?
sum(is.na(hw1_data$Ozone))

## Question 17. What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(hw1_data[complete.cases(hw1_data$Ozone), ]$Ozone)

## Question 18. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
hw1_data_rmna_logical <- complete.cases(hw1_data$Ozone, hw1_data$Temp, hw1_data$Solar.R)
hw1_data_Ozone_31_logical <- hw1_data$Ozone > 31
hw1_data_Temp_90_logical <- hw1_data$Temp > 90
mean(hw1_data[hw1_data_rmna_logical & hw1_data_Ozone_31_logical& hw1_data_Temp_90_logical, ]$Solar.R)

## Question 19. What is the mean of "Temp" when "Month" is equal to 6?
hw1_data_temp_rmna_logical <- complete.cases(hw1_data$Temp)
hw1_data_month_6_logical <- hw1_data$Month == 6
mean(hw1_data[hw1_data_temp_rmna_logical & hw1_data_month_6_logical, ]$Temp)

## Question 20. What was the maximum ozone value in the month of May (i.e. Month = 5)?
hw1_data_ozone_rmna_logical <- complete.cases(hw1_data$Ozone)
hw1_data_month_5_logical <- hw1_data$Month == 5
max(hw1_data[hw1_data_ozone_rmna_logical & hw1_data_month_5_logical, ]$Ozone)

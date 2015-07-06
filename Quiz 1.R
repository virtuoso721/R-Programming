##R-Programming_Quiz-1
##by Shu Wang
hw1 <- read.csv("hw1_data.csv")

#Question 11 In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(hw1)

#Question 12 Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
hw1[1:2, ]

#Question 13 How many observations (i.e. rows) are in this data frame?
nrow(hw1)

#Question 14 Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(hw1, 2)

#Question 15 What is the value of Ozone in the 47th row?
hw1$Ozone[47]

#Question 16 How many missing values are in the Ozone column of this data frame?
#method 1
sum(is.na(hw1$Ozone))
#method 2(using subset)
nrow(subset(hw1, is.na(Ozone)))

#Question 17 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
#method 1
mean(hw1$Ozone, na.rm = TRUE)
#method 2(using subset)
sub <- subset(hw1, !is.na(Ozone), select = Ozone)
mean(sub[ ,1])

#Question 18 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
#method 1
ozone_above_31_logical <- hw1$Ozone > 31
temp_above_90_logical <- hw1$Temp > 90
mean(hw1$Solar.R[ozone_above_31_logical & temp_above_90_logical])
#method 2(using subset)
sub <- subset(hw1, Ozone > 31 & Temp > 90 & !is.na(Solar.R), select = Solar.R)
apply(sub, 2, mean)

#Question 19 What is the mean of "Temp" when "Month" is equal to 6?
#method 1
month_6_logical <- hw1$Month == 6
temp <- hw1$Temp[month_6_logical]
mean(temp)
#method 2(using subset)
sub <- subset(hw1, Month == 6, select = Temp)
apply(sub, 2, mean)

#Question 20 What was the maximum ozone value in the month of May (i.e. Month = 5)?
#method 1
month_5_logical <- hw1$Month == 5
ozone_narm_logical <- complete.cases(hw1$Ozone)
max(hw1$Ozone[month_5_logical & ozone_narm_logical])

#method 2(using subset)
sub <- subset(hw1, Month == 5 & !is.na(Ozone), select = Ozone)
apply(sub, 2, max)

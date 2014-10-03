#Working Directory by default "/home/kartik"
#Change Working Directory
setwd("/home/kartik/Desktop/R-Statistical-Computing/Cars Analysis")

#Reading CSV Data
my_data = read.csv("cars.csv", header = TRUE,sep=",", as.is=TRUE)

#Reading Rows and Columns
#First Row
my_data[1,]

#First 10 Rows
my_data[1:10,]

#Reading Columns
my_data$MPG
my_data$Weight

#Prior to working with Data in an Excel Sheet

#> install.packages("gdata")
#> library(gdata)
#> help(read.xls)

#Working Directory by default "/home/kartik"
#Change Working Directory
setwd("/home/kartik/Desktop/R-Statistical-Computing/Cars Analysis")

#Reading xls Data
my_data = read.xls("cars_excel.xls", header = TRUE)


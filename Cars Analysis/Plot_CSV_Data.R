#Working Directory by default "/home/kartik"
#Change Working Directory
setwd("/home/kartik/Desktop/R-Statistical-Computing/Cars Analysis")

#Reading CSV Data
my_data = read.csv("cars.csv", header = TRUE,sep=",", as.is=TRUE)

#Plotting
#Plot of Weight vs MPG
plot(my_data$Weight,my_data$MPG,xlab = "Weight",ylab = "Miles Per Gallon",main = "Car Analysis")

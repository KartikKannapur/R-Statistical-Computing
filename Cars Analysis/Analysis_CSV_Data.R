#Working Directory by default "/home/kartik"
#Change Working Directory
setwd("/home/kartik/Desktop/R-Statistical-Computing/Cars Analysis")

#Reading CSV Data
my_data = read.csv("cars.csv", header = TRUE,sep=",", as.is=TRUE)

#Plots and Analysis

#Weight vs MPG
#Analysis : As the Weight of the car increases, the MPG decreases
plot(my_data$Weight,my_data$MPG,xlab = "Weight",ylab = "Miles Per Gallon",main = "Car Analysis")

#No. of Cylinders vs MPG
#Analysi : 4 and 6 Cylinder vehicles give more Miles per Gallon as compared to 8 Cylinder vehicles
plot(my_data$Cylinders,my_data$MPG,xlab = "No. of Cylinders",ylab = "Miles Per Gallon",main = "Car Analysis")

#Horsepower vs MPG
#Analysi : Lesser the HP more the Mileage
plot(my_data$Horsepower,my_data$MPG,xlab = "Horsepower",ylab = "Miles Per Gallon",main = "Car Analysis")

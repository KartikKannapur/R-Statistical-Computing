#Action : Assign variable names on the fly

#Get Working Directory
getwd()

#Set Working Directory
setwd("/home/kartik/Desktop/R-Statistical-Computing/Auto Generate Variable Names")

#paste can be used to generate a series of variables
paste("A",1:12)

#Different seperators
paste("A",1:12,sep = "")
paste("A",1:12,sep = "   ")
paste("A",1:12,sep = ",")
paste("A",1:12,sep = "!")
paste("A",1:12,sep = "B2B")

#Assign values in a loop
for(i in 1:10)
{
  assign(paste("Hello",i, sep = ""), i)
}

for(i in 1:6)
{
  assign(paste("Kar",i, sep = "bb2"), i)
}



########################
# # --- Chapter 01 --- #
########################

"
About R:
* Data Analysis and Statistics
* GNU Project - Free and Open Source Software

* Created in the early 1990s
* Based on the S Language

* Intrepreted Language/Scripting
* Although its a scripting language, it also supports Object Oriented Programming & Functional Programming.
(Functions are first-class objects;They behave like any other variable and you can call them recursively.)

* CRAN
"

# #Introduction
"Hello World!"

# #Variable Assignment
a <- "Hello"
a

# #Creating a sequence of numbers
1:10
# #'b' is a vector with the sequence of numbers assigned to it
b <- 1:10
b

mean(1:5)


# #Getting Help
?mean
help(mean)

# #Searches topics that contain the relevant word
??mean
help.search("mean")

# #Examples of the Functions
example(plot)
example(mean)

# #Installing Packages
# install.packages("installr")
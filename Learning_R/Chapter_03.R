########################
# # --- Chapter 03 --- #
########################

# #Inspecting Variables and Your Workspace


"
All variables in R belong to a certain class: 
numeric, integer
logical
character
R has no scalar types. The base data type in R is a vector.
"
# #Integer
a <- c(1,2,3,4,5)
class(a)

# #Logical
b <- c(TRUE, FALSE)
class(b)

# #Numeric
class(c(sqrt(1:10)))

# #Complex
class(3 + 5i)

"
NOTE : All floating points numbers are 32-bit numbers, even when installed on a 64-bit operating system.

The largest floating point number that R can represent at full precision is 1.8e308 & the smallest is 2.2e-308.
"
.Machine


# #Factors - Encode a vector as a factor. The terms in the vector are represented as the levels.
# #Internally the factor values are stored as Integers rather than as characters; this is basically for efficiency
# #and performance. Less storage required i.e memory.
factor(c("male", "female", "female", "male", "female"))



"
Arrays contain multi-dimensional data.
Matrices are a special class of Arrays that are two-dimensional.

Vectors and Arrays must contain the same data type.
Lists are flexible and can contain multiple/different data types.
"

"
Lists all the variables in the environment.
"
ls()


# #SUMMARY Function
d <- 1:100
summary(d)

# #Data Frame
var_df <- data.frame(1:100)

# #For visualizing two-dimensional variables such as matrices and data frames
View(var_df)

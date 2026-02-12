# Representation of Data

# Creating file from the console
file.create("name_of_file")
print("hello, world")

#readline() => use for getting input from the console
name <- readline("What is your name ")

#String concatenation function
#paste() or paste0() => use to combine or (concatenate) strings
greeting <- paste("Hello,", name)
print(greeting)

#Function Composition -> passing a function as an input into another
print(paste("Hello, ",name))

# Basic Arithmetic + - * /

# Data type or Storage Mode => chr, dbl, int

# Coercion => conversion of data from one type to another using functions below

# as.character()
# as.integer()
# as.double()

# Tables 
?demo

# Vectors => list of values in the same data type

?data.frame

#load data set of voters and nonvoters
voters <- read.csv('./data/nonvoters_data.csv')

View(voters)

unique(voters$Q21)

# convert numerical category to text

voters$Q21 <- factor (
  voters$Q21,
  labels = c("Yes", "No", "Unsure/Undecided"),
  exclude = c(-1)
)

unique(voters$Q21)

# Transforming Data
#  Outliers

# Logical Expression
# == (equal to) != (not equal) > (greater than) >= (greater than/equal)  < (less than) <= (less than/equal) 

# Logical Operators 
# & AND => This '&' works for only vectors of logical values
# | OR => This '|' works for only vectors of logical values

# && AND => This '&&' works for single values of (TRUE or FALSE) logical value
# || OR => This '||' works for single values of logicals

?which()
?any()
?all()
which( voters$Q21 == "Yes")

# Logical Function
is.infinite()
is.na()
is.nan()
is.null()

# subset(dataFrame, logical function)
subset()

# demo of TO Dos

# create a dataframe of values of 3 rows and 3 cols
voteNew <- data.frame(
  candidate = c("Victor","Deligent", "Serwaa"),
  poll = c("100", 240, 320),
  mail = c(421, 230, 402),
  row.names = NULL
)
voteNew$total <- as.integer(voteNew$poll) + voteNew$mail
View(voteNew)
write.csv( voteNew,"./data/votes.csv", row.names = FALSE)

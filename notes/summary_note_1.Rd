# data.frame() create a table (rows and columns) of data set or 
  a matrix-like structure whose columns may be of differing types 
  (numeric, logical, factor and character and so on).

?data.frame

name_of_data <- data.frame(..., row.names = NULL, check.rows = FALSE,
           check.names = TRUE, fix.empty.names = TRUE,
           stringsAsFactors = FALSE)

# Arguments
"""
... these are arguments to the data frame.

row.names = NULL - is use to set or reset the row names of a 
data frame into automatic numbering sequence starting at one. e.g: 1, 2, 3 ...

check.rows = FALSE - if TRUE then the rows are checked for consistency of 
                     length and names.
check.names = TRUE - logical. If TRUE then the names of the variables in the data 
frame are checked to ensure that they are duplicated.

fix.empty.names = TRUE - it automatically give ""to unnamed columns

stringsAsFactors = FALSE - should not convert character vectors to factors ()
"""
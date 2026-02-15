
?janitor
required_packages <- c(
  "janitor",
  "tidyverse",
  "lubridate",
  "skimr",
  "naniar",
  "ggplot2",
  "ggpubr",
  "car"
)

for( pck in required_packages){
  if(!pck %in% rownames(installed.packages()) ){
    install.packages(pck)
  }
}

library(tidyverse)
library(dplyr)
library(janitor)
library(lubridate)
library(skimr)
library(ggplot2)
library(ggpubr)
library(car)
library(stringr)

# str() =>this function shows the structure of your dataset/object.
# it shows column names, data types (num, chr, factor) and sample values
str(voteNew)

# mutate() => this function is used to create new columns or modify existing ones
# its mostly used when you want to add calculated columns.
voteNew <-voteNew |>
  mutate(grand_total = as.integer(poll) * as.integer(mail) )

# factor() => turns a column into a category variable (like gender, region, clas)
voteNew$gender <- factor(voteNew$gender,levels = c("Male","Female"))
is.factor(voteNew$gender)
?factor()

# case_when() => this works like multiple if statements(if-else ladder)
# it is often used to classify values of a particular  variable into groups 
voteNew <- voteNew |>
  mutate(
    status = case_when(
      total >= 400 & total < 500 ~ "Good",
      total >= 500 & total < 700 ~ "Very Good",
      total >= 700 ~ "Excellent",
      TRUE ~ 'Fail'
    )
  )

View(voteNew)

# str_detect() this function checks if a string contains a certain word/pattern.
# it is often use when filtering text or searching keywords
?str_detect
# usage
str_detect(string, pattern, negate = FALSE)
# where; string: is  the input vector or character vector ( I love programming with R)
# pattern: the word/pattern to look for
# negate: If TRUE, inverts the resulting boolean vector

# table() => this function counts how many times each value appears
# its often use for frequency counts (especially categorical variables)
table(voteNew$candidate)

#  filter() => this function is use to select rows that meet a particular condition
#  it is used when you want to select some/ a specific record
 voteNew |> filter(total > 500 )
?filter
 
 # count() => use for counting occurrences of a variable (like table() 
 # but tidyverse style). 
 # it is helpful for group count
 voteNew |> count(candidate)

 # Visualization Tips
 
 # ggplot() => useful for plotting and graphing (creating visualization)

  # geom_col() => Creates a bar chart using values you already calculated thus
 #            When your data already contains counts or totals.
 
 # coord_flip() => Flips the plot (horizontal instead of vertical), this is very
 #                useful when labels are long and horizontal bars look better.
 
 # labs() => Adds labels (title, x-axis, y-axis) this makes plots readable.
 
 # theme_minimal() => Makes your plot look clean and modern and always for nicer visuals.
 ggplot(voteNew, aes(x=gender, y= mail)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Total Count of Mail vote by Gender",
    y = "Mail Vote",
    x = "Gender"
  ) +
 theme_minimal()

 
 # String operations
 # str_squish() => removes extra spaces in text
 str_squish("I    am getting better at R   programming  😂.")
 #RESULT: "I am getting better at R programming 😂."
 
 # paste() => useful for combining multiple or seperate text (Joins text together)
 # When combining words/columns into one string.
 paste("Hello,","This is the R data analyst 🤗 ")
 #RESULT: "Hello, This is the R data analyst 🤗 "
 
 # sapply() => Applies a function to every element in a list/vector 
 #            and returns results.
 # Mostly useful when you want to apply something quickly across multiple items.
 nums <- list(c(1,2), c(5,10), c(3,7))
 sapply(nums, mean)
 
 # Conditional Statements
 # ifelse() => A quick if statement for vectors.
 # mostly for creating a new column based on a condition.
voteNew$Win <- ifelse(voteNew$total >=700, "Yes", "No")


# summarise() => Produces summary statistics like mean, sum, max, etc
# When you want to calculate summary results.
voteNew |> summarise(
  avg_total = mean(total),
  avg_grand = mean(grand_total)
  )

# colSums() => Adds up values column by column.
# When working with numeric datasets/matrices.
str_detect(string,pattern)~"assign"

library("tidyverse")

# Statistical Transformation

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = carat), color = 'green')

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = carat), color = 'brown', stat = 'identity')

View(diamonds)

desc(diamonds)

?diamonds

?geom_bar

# Position Adjustments
# First:

#position = "dodge" places overlapping objects directly beside
#one another. 
#This makes it easier to compare individual values:

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), 
           alpha = 0.9, position = "dodge")

# Secondly:
# position = "identity" will place each object exactly where it
#falls in the context of the graph. This is not very useful for bars,
#because it overlaps them.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity),
           position = 'identity')

#Thirdly
#position = "fill" works like stacking, but makes each set of
#stacked bars the same height. This makes it easier to compare
#proportions across groups:

ggplot(data = diamonds) +
geom_bar(
  mapping = aes(x = cut, fill = clarity), 
  position = "fill"
)

# Fourth: 
#There’s one other type of adjustment that’s not useful for bar charts,
#but it can be very useful for scatterplots.
#The values of 'hwy and displ'in mpg dataset, are rounded so the points appear on a
#grid and many points overlap each other. This problem is known as
#overplotting. This arrangement makes it hard to see where the mass
#of the data is
#position = "jitter" adds a small amount of random noise
#to each point. This spreads the points out because no two points are
#likely to receive the same amount of random noise:

ggplot(data = mpg) +
geom_point(
  mapping = aes(x = displ, y = hwy),
  position = "jitter"
)

# Adding randomness seems like a strange way to improve your plot,
# but while it makes your graph less accurate at small scales, it makes
# your graph more revealing at large scales.
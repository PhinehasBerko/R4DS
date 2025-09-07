#install.packages("tidyverse")
#install.packages(c("nycflights13", "gapminder", "Lahman"))

library("tidyverse")

View(mpg)
?mpg

#do cars with big engines use more fuel than cars with small engines? 

ggplot(data = mpg) +
  geom_point(mapping = aes( y = hwy, x= displ, color = class )) 

#do car transmission type affects it fuel consumption?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = trans), color = trans)

# Make a scatterplot of hwy versus cyl.
ggplot(data = mpg) +
  geom_point(mapping = aes(y = hwy, x = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~ cty)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))
?geom_point

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2) +
  theme(strip.background = element_blank(), strip.placement = "outside")
?facet_wrap()

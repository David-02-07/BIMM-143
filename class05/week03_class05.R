# Week 3 Data Visualization Lab 5

# Any time I want to use this package I need to load it
library("ggplot2")

# Install the package ggplot2
# install.packages("ggplot2")

View(cars)

# A quick base R plot - not ggplot
plot(cars)

# First ggplot
# Need data + aes + geoms
ggplot(data =cars) + aes(x=speed, y=dist) + geom_point()

p <- ggplot(data =cars) + aes(x=speed, y=dist) + geom_point()

# Add a line geom with geom_line()
p + geom_line()

# Add a trend line close to the data
p + geom_smooth()

p + geom_smooth(method="lm")

# -----------#

# Read in our drug expression data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q. How many genes are in this dataset
nrow(genes)

# Q. How many columns are in this dataset
ncol(genes)

# Q. How many 'up' regulated genes
table(genes$State)

# Q. What fraction of total genes is up-regulated
round( (table(genes$State) / nrow(genes)) * 100, 2 )



library(ggplot2)

# First plot attempt
g <-  ggplot(data=genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()

g
# Adding color

g + scale_color_manual( values = c("blue", "gray", "red")) + 
  labs(title= "Gene expression Changes Upon Drug Treatment", x="Control (no drug)", y="Drug Treatment") +
  theme_bw()

#' ---
#' title: "Week 3 Class Lab 5 Data Visualization Lab"
#' author: "David Alvarez"
#' date: "October 22, 2023"
#' ---
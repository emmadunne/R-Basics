# *********************************************************
#
#   R Basics: Getting started in R & RStudio
#
#   - E. Dunne 2021
#
# _________________________________________________________
#
#   1. Importing and manipulating datasets with Pokemon!
#
# *********************************************************


## Before getting started, be sure to follow Part 1 for downloading R/Rstudio and installing packages:
## https://github.com/emmadunne/R-Basics

## In this tutorial, we'll use the tidyverse, a collection of R packages designed for data science (https://www.tidyverse.org/)
library(tidyverse)



# Importing the data file -------------------------------------------------

## Import the Pokemon dataset (Source: https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6)
pokemon <- read_csv("./datasets/pokemon.csv")

## Take a peak at the top few lines of the dataset:
head(pokemon)
## Get a glimpse of your dataset, especially the column names:
glimpse(pokemon)
## Open the full dataset in a new tab in RStudio:
View(pokemon)



# Exploring the dataset ---------------------------------------------------

## How many different pokemon types are there?
distinct(pokemon, Type_1) # tidyverse syntax
unique(pokemon$Type_1) # base-R syntax - note the $

## How many pokemon are there?
length(unique(pokemon$Name))

## What's the average...?
summarise(pokemon, avg = mean(Total))
summarise(pokemon, avg = mean(Speed))
# etc.

## How many pokemon of each type are there?
count(pokemon, Type_1, sort = TRUE)
## You can also capture the output from this function and store it as its own 'object' for later:
n_types <- count(pokemon, Type_1, sort = TRUE)
n_types # calls up the object content





# Filtering the dataset ---------------------------------------------------

## Sometimes our dataset might contain more information than we need for analyses,
## so it can be useful to pear it down a little...


## Filter the dataset to only Generation 1 Pokemon, by creating a new object
pokemon_gen1 <- filter(pokemon, Generation == "1") 

### Let's take a look at how Generation 1 and Generation 2 differ in terms of speed...

# We've already made an object for Gen. 1, now let's do that for Gen. 2:
pokemon_gen2 <- filter(pokemon, Generation == "2") 
# Get the average score for each generation:
t_avg_gen1 <- summarise(pokemon_gen1, avg = mean(Speed))
t_avg_gen2 <- summarise(pokemon_gen2, avg = mean(Speed))
# At the end of the day, R is just a big fancy calculator:
t_avg_gen1 - t_avg_gen2


## Filter the dataset to only water, fire, and grass Pokemon (from all generations):
pokemon_WFG <- filter(pokemon, str_detect("( Water | Fire | Grass )", Type_1))

## For the stats tests and the plotting, we're going to focus on a Pokemon's primary type,
## so let's rename the column " Type_1" to make it less confusing
pokemon_WFG <- rename(pokemon_WFG, "Type" = "Type_1")
head(pokemon_WFG) # check


## You might want to save a copy of this new, truncated dataset for later use:
write_csv(pokemon_WFG, "./datasets/pokemon_WFG.csv")





# Common stats ------------------------------------------------------------------

## You're most likely to use R for its statistical power, so let's have a look at some common stats tests


### T-TEST

## In the last part, we looked at the average speed between Gen. 1 and Gen. 2 Pokemon
## - is the difference between these groups actually statistically significant?

## Let's do a t-test (= testing means between 2 groups) using the objects we created in the last script:
t.test(pokemon_gen1$Speed, pokemon_gen2$Speed)
# You'll see the output in the console - the number we're looking for is the p-value...


### ANOVA

## Let's say we were interested in more than 2 groups, for example, the difference between the average speed of 
## water, fire, and grass Pokemon...
## For this, we'll need an one-way ANOVA (ANalysis Of VAriance) (= testing means between more than 2 groups)
## and the filtered dataset we created in the last script

# First, compute the ANOVA:
poke_anova <- aov(Speed ~ Type, data = pokemon_WFG)
# Then, pull up the analysis summary:
summary(poke_anova)

## In one-way ANOVA test, a significant p-value indicates that at least of the group means is different to another,
## (as shown by the asterisk next to the value under Pr(>F) and a score of less than 0.05)
## but doesn't tell us which ones, so we need another test

## As our ANOVA test was significant, we can compute a Tukey HSD (Tukey Honest Significant Differences)
## for performing multiple pairwise-comparison between the means of groups:
TukeyHSD(poke_anova)
# in the output, look for the "p adj" value...





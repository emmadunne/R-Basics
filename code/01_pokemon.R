# ******************************************************
#
#   R Basics: Getting started in R
#
#   - E. Dunne 2021
#
# ______________________________________________________
#
#   1. Importing and manipulating datasets with Pokemon!!
#
# ******************************************************


## Hopefully, you'll already have installed the required packages (see Part 1.3 here: https://github.com/emmadunne/R-Basics)
## Installing a package is like buying a book to place on your shelf. In order to read the book, we need to take it from the shelf, so in terms of a R package, we need to `load` it:
library(tidyverse)  # for manipulating and organising data - ggplot lies within this collection


## Before we begin anything new, it can be useful to clear your environment i.e. delete all of the things that R 'knows'
## Its also an excellent way to start over if things go really wrong and nothing is running correctly :)
rm(list = ls())



# Importing the data file -------------------------------------------------

## Import the Pokemon dataset (Source: https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6)
pokemon <- read.csv("./datasets/pokemon.csv", header = TRUE, stringsAsFactors = FALSE)

## Take a peak at the dataset:
head(pokemon)



# Exploring the dataset ---------------------------------------------------


## View the structure of the dataset in the console:
str(pokemon)

## Open the full dataset in a new tab in RStudio:
View(pokemon)


## How many pokemon are there?
length(unique(pokemon$Name))


## How many different pokemon types are there?
## can use either a base-R function or a tidyverse function:
distinct(pokemon, Type_1) # tidyverse
unique(pokemon$Type_1) # base-R


## What's the average...?
summarise(pokemon, avg = mean(Total))
summarise(pokemon, avg = mean(Speed)) # etc.


## How many pokemon of each type are there?
count(pokemon, Type_1, sort = TRUE)
## You can also capture the output from this function and store it as its own 'object' for later:
n_types <- count(pokemon, Type_1, sort = TRUE)
n_types # calls up the object content




# Filtering the dataset ---------------------------------------------------

## Sometimes our dataset might contain more information than we need for analyses,
## so it can be useful to pear it down a little...


## Filter the dataset to only Generation 1 Pokemon:
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


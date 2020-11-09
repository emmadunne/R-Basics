# ******************************************************
#
#   Plotting with ggplot
#
#   E. Dunne - 29th May 2020
#
# ______________________________________________________
#
#   Exploring and organising the data
#
# ******************************************************


## Load package(s):
library(tidyverse)  # for manipulating and organising data - ggplot lies within this collection


## This line will clear your environment i.e. deletes ALL the objects you've created
## Its also an excellent way to start over if shit hits the fan and nothing is running correctly :)
rm(list = ls())


## Import the dataset (Source: https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6)
pokemon <- as_tibble(read.csv("./datasets/pokemon.csv", header = TRUE, stringsAsFactors = FALSE))
pokemon



# Exploring the dataset ---------------------------------------------------


## Open the full dataset in a new tab in RStudio:
View(pokemon)

## View the structure of the dataset in the console:
str(pokemon)

## How many pokemon are there?
length(unique(pokemon$Name))

## How many different pokemon types are there?
distinct(pokemon, Type_1) # tidyverse
unique(pokemon$Type_1) # base R

## How many pokemon of each type are there?
count(pokemon, Type_1, sort = TRUE)
## This can also be written using the 'pipe' function:
pokemon %>% count(Type_1, sort = TRUE)
## You can also grab the output from this line and store it as its own object for later
n_types <- count(pokemon, Type_1, sort = TRUE)


## What's the average...?
summarise(pokemon, avg = mean(Total))
summarise(pokemon, avg = mean(Speed)) # etc.

## What's the average ... of each type?
pokemon %>%
  group_by(Type_1) %>%
  summarise(avg = mean(Speed), n = n()) %>% 
  arrange(avg)





# Filtering the dataset ---------------------------------------------------


## Filter the dataset to only Generation 1:
pokemon_gen1 <- filter(pokemon, Generation == "1") 
pokemon_normal_water <- filter(pokemon, Type_1 == "Normal" | Type_2 == "Water") 
pokemon_not_normal <- filter(pokemon, Type_1 != "Normal") 


## Filter the dataset to only grass, water, and fire pokemon:
pokemon_WNG <- filter(pokemon, str_detect("( Water | Normal | Grass )", Type_1))

## Are these pokemon from each generation?
unique(pokemon_WNG$Generation)















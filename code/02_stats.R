# ******************************************************
#
#   R Basics: Getting started in R
#
#   - E. Dunne 2020
#
# ______________________________________________________
#
#   2. Simple stats
#
# ******************************************************




## The boxplots we just created give us a good idea whether the 3 pokemon groups differ in their speeds
## But we can test that for sure using some stats!


## So, we want to know if there is any significant difference between the average speeds of these 3 types of pokemon
## For this, we'll need an one-way ANOVA (ANalysis Of VAriance) - tetsing means between more than 2 groups (2 groups = t-test)


# First, compute the ANOVA:
poke_anova <- aov(Speed ~ Type_1, data = pokemon_WNG)

# Then, pull up the analysis summary:
summary(poke_anova)


## In one-way ANOVA test, a significant p-value indicates that some of the group means are different, 
## but we don’t know which pairs of groups are different...

## As our ANOVA test was significant, we can compute Tukey HSD (Tukey Honest Significant Differences)
## for performing multiple pairwise-comparison between the means of groups:
TukeyHSD(poke_anova)
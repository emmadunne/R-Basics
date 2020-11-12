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


## You're mosty likely to need R for its statistical power, so let's have a look at some common stats tests



# t-test ------------------------------------------------------------------

## In the last part, we looked at the average speed between Gen. 1 and Gen. 2 Pokemon
## - is the difference between these groups actually statistically significant?

## Let's do a t-test (= testing means between 2 groups)
## using the objects we created in the last script:

t.test(pokemon_gen1$Speed, pokemon_gen2$Speed)

## You'll see the output in the console - the number we're looking for is the p-value...




# ANOVA -------------------------------------------------------------------

## Let's say we were interested in more than 2 groups, 
## for example, the difference between the average speed of water, fire, and grass Pokemon...

## For this, we'll need an one-way ANOVA (ANalysis Of VAriance) (= testing means between more than 2 groups)
## And the filtered dataset we created in the last script

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


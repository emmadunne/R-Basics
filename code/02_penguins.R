# ******************************************************
#
#   R Basics: Getting started in R & RStudio
#
#   - E. Dunne 2021
#
# ______________________________________________________
#
#   2. Plotting the Palmer Penguins!
#
# ******************************************************

## For this plotting tutorial, we'll be using data from a R package, palmerpenguins: 
## https://allisonhorst.github.io/palmerpenguins/
install.packages("palmerpenguins")
library(palmerpenguins)

## To cite this pacakeg (or any R package) in a publication, we would use:
citation("palmerpenguins")

## Load additional packages:
library(tidyverse)      # data manipulation etc.
library(ggpubr)         # for arranging plot grids


# Prepping the data -------------------------------------------------------

## We'll use the built-in dataset 'penguins', which is a simplified version of the raw data; see ?penguins for more info.
View(penguins)

## Looking at this dataset, what can you tell about the data?
##    How many penguins species were studied? And how many penguins in total?
##    What variables were measured?
##    Where was the data collected from?



# Plotting in R -----------------------------------------------------------

## Plotting in base R is really simple - Here's a simple regression plot showing penguin body mass vs. flipper length:
plot(penguins$flipper_length_mm ~ penguins$bill_length_mm) 
## But this isn't quite publication-worthy just yet
## Many people prefer using the package ggplot2 (part of the tidyverse), as it has greater customisation 
## (Even the BBC use it: https://bbc.github.io/rcookbook/)


## The essential elements of a ggplot graphic are:
#   1. Data element i.e. your dataset
#   2. Aesthetics element (mapping = aes) i.e. x and y axes, etc.
#   3. Geometries element (geom_)



# Scatterplot -------------------------------------------------------------

## First, let's set up the base of the plot - note the data, aesthetics, and geom_ elements:
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point()

## Note that we receive a warning. about missing values - why might this be?


## Cool, now let's add a bit of colour and shapes:
ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8)

## Let's pick our own colours (Be sure that your colours are friendly for those with colour blindness or other visual impairments!)
## Names of R colours can be found here: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf
## Or you can use hex codes (see: https://htmlcolorcodes.com/)
ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Species"))

## Now let's change the theme to make it look more publication-ready - ggplot has plenty of built-in themes:
ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  theme_minimal()


## But you can also create your own custom themes - ideal for keeping all your plots looking similar:
mytheme <- theme_minimal() + theme(panel.background = element_blank(),
                                   panel.border = element_rect(colour = "black", fill = NA),
                                   axis.text.x = element_text(size=10),
                                   axis.text.y = element_text(size=10),
                                   axis.title = element_text(size=12),
                                   legend.position = "top")

ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  mytheme


## We can even layer some stats over plots, such as a regression line:
ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  geom_smooth(aes(colour = species, fill = species), method = "lm", alpha = 0.3) + 
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "species")) +
  scale_fill_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "species")) +
  mytheme


## Now let's get this plot in shape for a publication
## We'll rename our axes, give it a title, and refine our theme
penguin_scatter <- ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  theme_minimal() +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF")) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)",
       color = "Species", shape = "Species") +
  theme(legend.position = c(0.85, 0.15),
        legend.background = element_rect(fill = "white", color = NA))
penguin_scatter # this will make the plot object appear in the Plots window


## Save the plot to your plots folder:
ggsave("./plots/scatter_plot.pdf", plot = penguin_scatter, width = 18, height = 15, units = "cm")




# Boxplots ----------------------------------------------------------------

## Another kind of plot that is useful for displaying continuous data is a boxplot

## Which species of penguin is the chonkiest?

## A basic boxplot can be constructed using ggplot like this:
ggplot(penguins, aes(x = species, y = body_mass_g)) + 
  geom_boxplot() # adds a boxplot element

## Now let's get fancy!
## Remove or add the commented lines to add different elements to the plot
penguin_box <- ggplot(data = penguins, aes(x = species, y = body_mass_g, colour = species)) +
  #coord_flip() + # flip the plot to be horizontal
  geom_boxplot(color = "gray60", fill = c("#DC267F", "#FFB000", "#648FFF"), alpha = 0.3, lwd = 0.3) +
  #geom_jitter(aes(color = species), alpha = 0.5, size = 3, position = position_jitter(width = 0.2, seed = 0)) +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF")) +
  theme_minimal() + theme(legend.position = "none") +
  labs(x = "", y = "Body mass (g)")
penguin_box



# Plots panel -------------------------------------------------------------


## Combine both plots using the gpubr package
penguin_plots <- ggarrange(penguin_scatter, penguin_box, 
                           common.legend = TRUE, legend = "bottom",
                           labels = c("(a)", "(b)"),
                           ncol = 2, nrow = 1)
penguin_plots <- annotate_figure(penguin_plots, top = text_grob("Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER", 
                                                          face = "bold", size = 14))
penguin_plots # take a look

ggsave(plot = penguin_plots,
       width = 21, height = 29, dpi = 500, units = "cm", 
       filename = "./plots/penguin_plots.pdf", 
       useDingbats=FALSE)



# Exploring correlations --------------------------------------------------


## R has some really powerful tools for exploring your data, for example:
require("GGally")

penguins %>%
  select(species, body_mass_g, ends_with("_mm")) %>%
  GGally::ggpairs(aes(color = species)) +
  scale_colour_manual(values = c("darkorange","purple","cyan4")) +
  scale_fill_manual(values = c("darkorange","purple","cyan4"))

## Or even more simple boxplots that can be applied to any dataset:
penguins %>%
  count(species) %>%
  ggplot() + geom_col(aes(x = species, y = n, fill = species)) +
  geom_label(aes(x = species, y = n, label = n)) +
  scale_fill_manual(values = c("darkorange","purple","cyan4")) +
  theme_minimal() +
  labs(title = 'Penguins Species & Count')



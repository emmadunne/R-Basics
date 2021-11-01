# ******************************************************
#
#   R Basics: Getting started in R & RStudio
#
#   - E. Dunne 2021
#
# ______________________________________________________
#
#   3. Plotting the Pokemon data
#
# ******************************************************


## Load additional packages:
library(colourpicker)   # for custom palettes
library(RColorBrewer)   # preset colour palettes
library(viridis)        # continuous colour palettes
library(cowplot)        # for arranging plot grids



## Plotting in base R is really simple - Here's a simple regression plot showing Pokemon attack vs. speed:
plot(pokemon$Attack ~ pokemon$Speed) 
## But this isn't quite publication-worthy just yet
## Many people prefer using the package ggplot2 (part of the tidyverse), as it has greater customisation 
## Even the BBC use it: https://bbc.github.io/rcookbook/


## The essential elements of a ggplot graphic are:
#   1. Data element
#   2. Aesthetics element (mapping = aes)
#   3. Geometries element (geom_)




# Scatterplot -------------------------------------------------------------


## Let's start with something simple, a scatterplot
## We'll work with a filtered dataset to make things simlper - the same one we created in the first script

## First, let's set up the base of the plot - note the data, aesthetics, and geom_ elements:
ggplot(data = pokemon_WFG, mapping = aes(x = Attack, y = Defense)) +
  geom_point()


## Cool, now let's add a bit of colour:
ggplot(data = pokemon_WFG, mapping = aes(x = Attack, y = Defense, colour = Type)) +
  geom_point()


## There are lot's of packages that contain preset colour palettes, such as R Color Brewer:
## See more here: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf
ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) + #(Note how this line has been condensed since line 49 above)
  geom_point() +
  scale_color_brewer(palette = "Dark2")


## You can also pick your own colours!
## Names of R colours can be found here: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf
## Or you can use hex codes (see: https://htmlcolorcodes.com/)
## Be sure that your colours are friendly for those with colour blindness or other visual impairments!
ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) +
  geom_point() +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type"))


## Now let's tinker with the theme to make it look all professional
## ggplot has plenty of built-in themes:
ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) +
  geom_point() +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  theme_minimal()


## But you can also create your own custom themes - ideal for keeping all your plots looking similar:
mytheme <- theme_minimal() + theme(panel.background = element_blank(),
                 #panel.grid.minor.y = element_blank(),
                 #panel.grid.minor.x = element_blank(),
                 panel.border = element_rect(colour = "black", fill = NA),
                 axis.text.x = element_text(size=10),
                 axis.text.y = element_text(size=10),
                 axis.title = element_text(size=12),
                 legend.position = "top")

ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) +
  geom_point() +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  mytheme


## We can even layer some stats over plots, such as a regression line:
ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) +
  geom_point() +
  geom_smooth(aes(colour = Type, fill = Type), method = "lm") + 
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  scale_fill_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  mytheme


## And now the important bit - saving your plots!
## First, we'll need to name our plot:
poke_scatter <- ggplot(pokemon_WFG, aes(Attack, Defense, colour = Type)) +
  geom_point() +
  geom_smooth(aes(colour = Type, fill = Type), method = "lm") + 
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  scale_fill_manual(values = c("#DC267F", "#FFB000", "#648FFF"), guide = guide_legend(title = "Type")) +
  mytheme
poke_scatter # this will make the plot object appear in the Plots window

## Save the plot to your plots folder:
ggsave("./plots/scatter_plot.pdf", plot = poke_scatter, width = 25, height = 20, units = "cm")






# Boxplots ----------------------------------------------------------------


## Another kind of plot that is useful for displaying continuous data is a boxplot

## To begin, we need to make sure that the variable we're interested in (i.e. Type)
## is being read by R as a categorical (factorial) variable, and not a continuous variable:
class(pokemon_WFG$Type) # currently being read as nothing in particular ("NULL")
pokemon_WFG$Type <- as.factor(pokemon_WFG$Type) 
class(pokemon_WFG$Type) # check that its a "factor"


## A basic boxplot can be constructed like this:
ggplot(pokemon_WFG, aes(x=Type, y=Speed)) + 
  geom_boxplot() # adds a boxplot element

## Now let's get fancy!

# First, set the theme. Here's another way you can do it:
theme_set(theme_light(base_size = 12))

# Now, let's construct our plot, layer by layer:
poke_boxplot <- ggplot(pokemon_WFG, aes(x = Type, y = Speed, color = Type)) +
  #coord_flip() +
  scale_color_manual(values = c("#DC267F", "#FFB000", "#648FFF")) +
  scale_x_discrete(labels = c("Fire", "Grass", "Water")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 130), breaks = seq(0, 130, 20)) +
  labs(x = NULL, y = "Speed") + ggtitle("Poke Speeds") +
  theme(legend.position = "none",
        axis.title = element_text(size = 12),
        axis.text.x = element_text(size = 10),
        panel.grid = element_blank()) + 
  geom_boxplot(color = "gray40", fill = c("#DC267F", "#FFB000", "#648FFF"), 
               alpha = 0.5, lwd = 0.5) +
  geom_jitter(size = 2, alpha = 0.5, width = 0.2) +
  stat_summary(fun = mean, geom = "point", size = 5)
poke_boxplot


## Finally, let's save the plot to your plots folder:
ggsave("./plots/boxplot.pdf", plot = poke_boxplot, width = 20, height = 20, units = "cm")


## We can also join both of our plots together using the 
poke_plots <- plot_grid(poke_scatter, poke_boxplot,
                        nrow = 1, ncol = 2, 
                        labels = c("(a)", "(b)"))
poke_plots

## And save:
ggsave("./plots/Figure_combo.pdf", plot = poke_plots, width = 45, height = 20, units = "cm")




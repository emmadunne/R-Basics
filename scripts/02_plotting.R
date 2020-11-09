# ******************************************************
#
#   Plotting with ggplot
#
#   E. Dunne - 29th May 2020
#
# ______________________________________________________
#
#   Plotting the data
#
# ******************************************************


## Load additional packages:
library(cowplot)        # for arranging plot grids
library(viridis)        # colour palette
library(RColorBrewer)   # another colour palette
library(ggsci)          # and another colour palette



## Plotting in base R is really simple:
plot(pokemon$Attack ~ pokemon$Speed)

## But many people prefer using ggplot, as it has greater customisation 
## Even the BBC use it: https://bbc.github.io/rcookbook/


## The essential elements of a ggplot2 graphic are:
#   1. Data element
#   2. Aesthetics element (mapping = aes)
#   3. Geometries element (geom_)




# Scatterplot -------------------------------------------------------------


## Let's start with something simple, a scatterplot
## We'll work with a suubset of the dataset to make things easier

## First, let's set up the base of the plot - note the data, aesthetics, and geom_:
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense)) +
  geom_point()


## Cool, now let's add a bit of colour:
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point()


## Cool colours, but they're not very useful - let's try a few different palettes
## There are SO many colour options in ggplot, some of them can be found in this PDF: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf

# R Color Brewer:
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")

# Viridis
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_viridis(discrete = TRUE, option = "D")

# Scienitfic colour palette
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_npg() # scale_color_tron()


## But none of them really suit our dataset, so let's select our own colours...
## Another really helpful tool is R Colour Picker:
install.packages("colourpicker")
library(colourpicker)

ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type"))


## Now let's tinker with the theme
## ggplot has plenty of bult-in themes:
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
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

ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  mytheme


## ggplot is pretty clever at knowing how to plot the important information,
## but everything can be over written is you need it to be:
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  mytheme +
  labs(x = "Attack!", y = "Defense") + ggtitle("Pokemon stats") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 200), breaks = seq(0, 200, 25)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 200), breaks = c(0, 40, 70, 105, 139, 180))



## Let's level up and add a second geom, with a statistical twist
ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  geom_smooth(aes(colour = Type_1, fill = Type_1), method = "lm") + 
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  scale_fill_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  mytheme +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 165), breaks = seq(0, 165, 30)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 190), breaks = seq(0, 190, 20))


## And now the important bit - saving your plots!
## First, we'll need to name our plot:
poke_plot_scatter <- ggplot(data = pokemon_WNG, mapping = aes(x = Attack, y = Defense, colour = Type_1)) +
  geom_point() +
  geom_smooth(aes(colour = Type_1, fill = Type_1), method = "lm") + 
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  scale_fill_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2"), guide = guide_legend(title = "Type")) +
  mytheme +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 165), breaks = seq(0, 165, 30)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 190), breaks = seq(0, 190, 20))
poke_plot_scatter

## Save the plot to your plots folder:
ggsave("./plots/Figure_1.pdf", plot = poke_plot_scatter, width = 25, height = 20, units = "cm")






# Boxplots ----------------------------------------------------------------


## Another kind of plot that is useful for displaying continuous data is a boxplot

## To begin, we need to make sure that the variable we're interested in plotting is being read by R as a categorical or factoral variable:
pokemon_WNG$Type_1 <-  as.factor(pokemon_WNG$Type_1)
head(pokemon_WNG) # check


## A basic boxplot can be constructed like this:
ggplot(pokemon_WNG, aes(x=Type_1, y=Speed)) + 
  geom_boxplot() + coord_flip()

## Now let's get fancy!

# First, set the theme. Here's another way you can do it:
theme_set(theme_light(base_size = 12))

# Now, let's construct our plot, layer by layer:
poke_plot_box <- ggplot(pokemon_WNG, aes(x = Type_1, y = Speed, color = Type_1)) +
  #coord_flip() +
  scale_color_manual(values = c("chartreuse3", "darkorchid2", "dodgerblue2")) +
  scale_x_discrete(labels = c("Grass", "Normal", "Water")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 130), breaks = seq(0, 130, 20)) +
  labs(x = NULL, y = "Speed") + ggtitle("Poke Speeds") +
  theme(legend.position = "none",
        axis.title = element_text(size = 12),
        axis.text.x = element_text(size = 10),
        panel.grid = element_blank()) + 
  geom_boxplot(color = "gray40", fill = c("chartreuse3", "darkorchid2", "dodgerblue2"), 
               alpha = 0.5, lwd = 0.5) +
  geom_jitter(size = 2, alpha = 0.5, width = 0.2) +
  stat_summary(fun = mean, geom = "point", size = 5)
poke_plot_box


## Finally, let's save the plot to your plots folder:
ggsave("./plots/Figure_2.pdf", plot = poke_plot_box, width = 20, height = 20, units = "cm")



## We can also join both of our plots together:
poke_plots <- plot_grid(poke_plot_scatter, poke_plot_box,
                        nrow = 1, ncol = 2, 
                        labels = c("(a)", "(b)"))
poke_plots

## And save:
ggsave("./plots/Figure_combo.pdf", plot = poke_plots, width = 45, height = 20, units = "cm")





# Sneaky stats! -----------------------------------------------------------


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



library(dispRity)

version



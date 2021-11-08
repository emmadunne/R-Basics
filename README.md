# R Basics


This tutorial will provide a step-by-step guide to help you become familiar with using R and RStudio. The instructions and code are set up so that you can work through this in your own time, but if you are tuning in to a live session of this tutorial, make sure you have completed **Part 1** below before we begin.

The possibilities with R are endless, as is the time we could spend exploring the programme. But here, we're going to work through an example that will hopefully help you hit the ground running, and everything else will start making sense as you go along.


**Objectives of this tutorial:**

* Install and set up R and RStudio (Part 1)
* Import and explore some data
* Perform some simple statistical analyses
* Create some cool publication-worthy plots


*** 

## Part 1: Installation and setup


### 1.1 Install R and RStudio


To get started you will need the following software installed on your computer:

* [Download and install R](https://cloud.r-project.org)

* [Download and install RStudio Desktop](https://www.rstudio.com/products/RStudio/#Desktop) 


There is so much info out there online and in books for using R, but if you're just getting started, I would recommend these simple guides:

* [YaRrr! The Pirates's Guide to R](https://bookdown.org/ndphillips/YaRrr/where-did-this-book-come-from.html)
* [An Introduction to R and RStudio cheatsheet](http://sirselim.github.io/Introduction-to-R-and-RStudio/cheatsheet/index.html)
* [R for cats](https://rforcats.net/)


Once you have RStudio installed and opened, take a look around! 

![](./images/RStudio.png)


You can change the arrangement of these panes, as well as pick a colourful theme:

1. Select _Tools > Global Options.._
2. Navigate to the _Appearance_ tab
3. Choose an editor theme from the dropdown menu
4. Click _Apply_ then _OK_


### 1.2. Set up a new R Project

In RStudio, you can [create 'projects'](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) to help keep everything for a single coding project neat and tidy. This is especially useful if you are working on more than one research project at a time (and perhaps want to use version control), but is still generally good practice for keeping your files, code, etc. organised.

To set up a new R project (.Rproj):

1. In RStudio, select _File > New Project..._
2. Create a project from a _New Directory_ (following this, select _New Project_ if promoted)
3. Give the directory a name and place it in a convenient place on your machine 
4. Click _Create project_  - this creates a new project file (.Rproj) within a project directory (i.e. a new folder)


To keep everything organised, we'll create some sub-folders within the project directory (folder) you've just created above: one for datasets, one for script files (code) and another for the plots we create.

At the top of this page, you'll see a green button that says _Code_. Click on this and then choose _Download ZIP_, which will download a ZIP folder of all the files:

![](./images/download.png)

Once downloaded, navigate to this ZIP folder and copy both the _datasets_ folder (containing a .csv file) and the _code_ folder (containing four scipt files), and paste these directly into the project directly you created above. 
Finally, you'll need to create your own empty _plots_ folder. Your project directly should now look similar to this:


![](./images/subfolders.png)




### 1.3. Installing packages

R packages are a collection of functions, typically used for a specific purpose, such as phylogenetic analysis, ecological modelling, etc. In this tutorial we're going to mostly use functions from a collection of packages called the _tidyverse_, which contains the fantastic graphics package _ggplot2_. We'll also use some other packages that contain useful functions for making great plots.


To install a R package, you can either use the options in the menu bar in RStudio or code the functions directly into the console.

To **install** a package using the menu bar in RStudio:

1. Select _Tools > Install packages.._
2. Search for the package by name (e.g. _tidyverse_) and select it from the drop-down menu that appears
3. Click _Install_ (at which point some text might scroll through in the console pane)


To **install** a package using the R console, type the following directly at the *>* :
```{r}
install.packages("tidyverse")
```

The other packages you'll need to install to run the code in these scripts are:

* `RColorBrewer`
* `gpubr`



*** 

## Part 2: Let's get coding!

#### Top tips:

**1.** To run a line of code in R, place your cursor on the line and hit Command + Enter (Mac) or Ctrl + Enter (Windows)

**2.** R ignores any text preceded by a hash symbol (an octothorp), so you can use this to comment liberally on your code so you can keep track of what you are doing

**3.** If things get a bit squiffy or you'd just like to start from scratch, you can run this line to clear your environment (i.e. everything that is stored in R):
```{r}
rm(list = ls())
```

**4.** R is case-sensitive, so be sure to watch your capital and lower-case letters!

**5.** For more data manipulation functions in dplyr (part of the tidyverse), check out the cheetsheet by following: Help > Cheatsheets > Data transformation with dplyr

**6.** Use the search function in the Help tab (usually in the bottom right pane in RStudio) to look up any functions you're not sure about. These help files can be difficult to decipher, so Google might be more efficient...


### 2.1 Importing and exploring datasets

For this part, we'll be using the script file _01_pokemon.R_ in RStudio. 
There, we'll follow the super simple steps to: 

* Import our data file
* Explore and filter the data
* Perform some simple statistical analyses


### 2.2 Plotting data

Next, we can either use the _02_plotting.R_ script (for plotting the Pokemon dataset) or _02_penguins.R_ script (for plotting the Palmer penguins dataset) to practice some plotting in R, using packages, such as `ggplot2` and `gpubr` to get our plots publication-ready. 

In the live tutorial, we'll use _02_penguins.R_ to plot a scatterplot and boxplots, as well as take a brief look at some other ways to explore your data.


### 2.3 Try it out for yourself

Now it's over to you! Using functions from previous scripts, check out the dataset in _03_starwars.R_ and have a go at exploring these data, doing some simple stats tests and creating plots!



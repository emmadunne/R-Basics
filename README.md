# R Basics


This tutorial will provide a step-by-step guide to get you familiar with using R and RStudio for running analyses and creating plots. The possibilities with R are endless, so hopefully this will 

The instructions and code are set up so that you can work through this in your own time, but if you are tuning in to the live session, make sure you have completed **Part 1** below before we begin.


**Objectives of this tutorial:**

* Install and set up R and RStudio
* Create a new R project and load packages
* Import data files
* Perform some simple statistical analyses
* Create some plots


*** 

## Part 1: Installation and setup



#### 1.1 Installation


To get started you will need the following software installed on your computer: [R](https://www.r-project.org) and [RStudio](https://www.rstudio.com), a helpful editor and tool that keeps everything neat:

* [Download and install R](https://cloud.r-project.org)

* [Download and install RStudio Desktop](https://www.rstudio.com/products/RStudio/#Desktop)

Once you have RStudio installed and opened, take a look around! At first you'll see three panes: the console on the right and two panes on the left with various tabs you can click on to move across the different features. Don't worry too much about what each of them does for now - we'll find out in due course! 

You can change the arrangement of these panes as well as choose a colourful theme for RStudio:

1. Select _Tools > Global Options.._
2. Navigate to the _Appearance_ tab
3. Choose an editor theme from the dropdown menu
4. Click _Apply_ then _OK_

**TIP:** Choose a theme where you can see commented lines of code clearly i.e. those that begin with a hash symbol (e.g. Cobalt, Merbivore)



#### 1.2. Set up a new RStudio project

In RStudio, you can [create 'projects'](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) to help keep everything neat and tidy. This is especially useful if you are working on more than one research project at a time (and perhaps want to use version control), but is still generally good practice for keeping your files, code, etc. organised.

To set up a new RStudio project (.Rproj):

1. Select _File > New Project..._
2. Create a project from a _New Directory_ (following this, select _New Project_ if promopted)
3. Give the directory a name and place it in a convenient place (Desktop is fine for now!)
4. Click _Create project_ 
5. This creates a new project file (.Rproj) within a project directory (i.e. a folder)


To keep everything organised, we'll set up some sub-folders within the project directory (folder) you've just created above. Leave RStudio and navigate to where you have just saved your project file to. Open the folder - you'll see a _.Rproj_ file - and within this folder, create 3 new sub-folders as shown below: datasets, scripts, and plots.

![](./images/subfolders.png)



#### 1.3. Installing and loading packages

R packages are a collection of functions, typically used for a specific purpose, such as phylogenetic analysis, advanced modelling, etc. In this tutorial we're going to use functions from _base R_ (i.e. R without any additional packages), but sometimes we will use coding syntax from a package called _tidyverse_ and will use the graphics package _ggplot2_ to create our plots. Conveniently, _ggplot2_ is included in the _tidyverse_ package, so we just need to install and load a single package. You can does this either by using the menu bar or by typing into the console.


To **install** a package using the RStudio menu bar:

1. Select _Tools > Install packages.._
2. Search for the package by name (e.g. _tidyverse_) and select it from the drop-down menu that appears
3. Click _Install_ (at which point some text might scroll through in the console pane)

To **install** a package using the R console, type the following directly at the *>* :
```{r}
install.packages("tidyverse")
```

Installing a package is like buying a book to place on your shelf. In order to read the book, we need to take it from the shelf, so in terms of a R package, we need to `load()` it.

Directly into the console pane, type:
```{r}
library(tidyverse)
```


*** 

## Part 2: Import data files





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

$~$

#### 1.1 Installation


To get started you will need the following software installed on your computer: [R](https://www.r-project.org) and [RStudio](https://www.rstudio.com):

* [Download and install R](https://cloud.r-project.org)

* [Download and install RStudio Desktop](https://www.rstudio.com/products/RStudio/#Desktop)

Once installed and opened, you can choose a theme for RStudio:

1. Select _Tools > Global Options.._
2. Navigate to the _Appearance_ tab
3. Choose an editor theme from the dropdown menu
4. Click _Apply_ then _OK_


$~$

#### 1.2. Set up a new RStudio project

In RStudio, you can [create 'projects'](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) to help keep everything neat and tidy. This is especially useful if you are working on more than one research project at a time (and want to use version control), but is still generally good practice for keeping your files, codes, etc. organised.

To set up a new RStudio project:

1. Select _File > New Project..._
2. Create a project from a _New Directory_ (following this, select _New Project_ if promopted)
3. Give the directory a name and place it in a convenient place (Desktop is fine for now!)
4. Click _Create project_ 
5. This creates a new project file (.Rproj) within a project directory (i.e. a folder)


To keep everything organised, we'll set up some sub-folders within the folder you created when you set up a new Rproj. above. Leave RStudio and navigate to where you have just saved your project file. Open the folder - you'll see a _.Rproj_ file. Within this folder, create 3 new sub-folders: (i) datasets, (ii) scripts, and (iii) plots.


$~$

#### 1.3. Installing and loading packages

Packages contain additional functions that are useful for specific purposes, for example creating graphs in the package ggplot2. There are two steps we need to take before using a package: installing it and loading it.

To **install** a package using the RStudio menu options:
<br />a) Select _Tools > Install packages.._
<br />b) Search for the package by name and select it from the drop-down menu that appears
<br />c) Click _Install_
<br />d) In the Console window you might see some text scrolling up as the package installs


To **load** a package, you will need to use the following code in the Console window:
```{r}
library(packagename)
```

$~$

*** 

## Part 2: Import data files





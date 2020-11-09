# R Basics


This tutorial will provide a step-by-step guide to get you familiar with using R and RStudio for running analyses and creating plots. The possibilities with R are endless, so hopefully this will 

The instructions and code are set up so that you can work through this in your own time, but if you are tuning in to the live session, make sure you have completed Part 1 below before we begin.


**Objectives of this tutorial:**

* Install and set up R and RStudio
* Create a new R project and load packages
* Import data files
* Perform some simple statistical analyses
* Create some plots


*** 

## Part 1: Installation and setup


#### 1.1 Installation

To get started you will need the following software installed on your computer: [R](https://www.r-project.org) and [RStudio](https://www.rstudio.com):

[Download and install R](https://cloud.r-project.org)

[Download and install RStudio Desktop](https://www.rstudio.com/products/RStudio/#Desktop)


**Choose a theme for RStudio**
<br />a) Select _Tools > Global Options.._
<br />b) Navigate to the _Appearance_ tab
<br />c) Click _Install_
<br />d) In the Console window you might see some text scrolling up as the package installs




*** 

#### 1.2. Set up

To keep all of your data, analyses, and output from a single project in one place, I recommend setting up a new project. 
<br />a) In RStudio, select _File > New Project.._
<br />b) Create a project from a _New Directory_ (following this, select _New Project_ if promopted)
<br />c) Give the directory a name and place it in a convenient folder of your choosing


A new RStudio window should appear...

*** 

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

*** 

## Part 2: Import data files





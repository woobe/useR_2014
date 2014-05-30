## =============================================================================
## R Script for useR! Poster
## =============================================================================

rm(list=ls())
if (Sys.info()[1] == "Linux") {
  setwd("/media/SUPPORT/Cloud/Copy/Repo/useR_2014/poster")
} else {
  setwd("D:/Cloud/Copy/Repo/useR_2014/poster")
}


## =============================================================================
## Load Packages
## =============================================================================

library(grid)
library(gridExtra)
library(EBImage)
library(ggplot2)
library(rPlotter)
library(extrafont) ## Note: Run font_import() if it has not been done yet
library(wesanderson)


## =============================================================================
## Global Settings
## =============================================================================

## wesanderson colours
wes_colour <- wes.palette(5, "Darjeeling")

## Set Colours
col_header <- "black"
col_header_line <- "grey85"

col_text <- "black"

col_shade_cm <- wes_colour[5]
col_shade_rcm <- wes_colour[4]

col_link_cm <- "black"
col_link_rcm <- "black"


## =============================================================================
## Global Functions
## =============================================================================

## function for loading image
img2grob <- function(filename = NULL) {
  img <- readImage(filename)
  return(rasterGrob(img, interpolate=TRUE))
}

## blank ggplot2 theme
theme_blank <- create_ggtheme("blank")  ## use rPlotter package


## =============================================================================
## Initiate PDF Creation
## =============================================================================

## Load Extra Fonts
suppressMessages(loadfonts())

## Create blank pdf
if (Sys.info()[1] == "Linux") {
  pdf(file = "output.pdf", height = 33.0709, width = 46.77165, family = "Ubuntu", title = "Jo-fai Chow useR! 2014 Poster. Find out more: jofaichow.co.uk") 
} else {
  pdf(file = "output.pdf", height = 33.0709, width = 46.77165) ## use Window's default
}


## =============================================================================
## Initiate Grid Layout
## =============================================================================

## Set grid (A0 = 1:1.414, use 2000 x 2828 to approximate)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2000, 2828)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)


## =============================================================================
## Run each mini scripts
## =============================================================================

source('make_poster_step01_grid.R')
#source('make_poster_step02_background.R')    # Image - slow
source('make_poster_step03_shade.R')
source('make_poster_step04_header.R')
source('make_poster_step05_sub_header.R')
source('make_poster_step06_t_main.R')
# source('make_poster_step07_c_main.R')       # Image - slow
source('make_poster_step08_t_sub1.R')
#source('make_poster_step09_p_sub1.R')        # Image - slow
source('make_poster_step10_c_sub1.R')
source('make_poster_step11_t_sub2.R')
#source('make_poster_step12_p_sub2.R')        # Image - slow
source('make_poster_step13_c_sub2.R')
source('make_poster_step14_footer.R')


## =============================================================================
## Print to PDF - Save
## =============================================================================

## Save
dev.off()


## =============================================================================
## Embed Font
## =============================================================================

## Embed fonts to make sure it gets printed correctly
#if (Sys.info()[1] == "Linux") embed_fonts("output.pdf", outfile = "output_embedded.pdf") 
if (Sys.info()[1] == "Linux") embed_fonts("output.pdf")

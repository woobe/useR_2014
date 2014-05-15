## =============================================================================
## R Script for useR! Poster
## =============================================================================

rm(list=ls())
setwd("D:/Cloud/Copy/Repo/useR_2014/poster")


## =============================================================================
## Load Packages
## =============================================================================

library(grid)
library(gridExtra)
library(EBImage)
library(ggplot2)
library(rPlotter)
library(extrafont) ## Note: Run font_import() if it has not been done yet


## =============================================================================
## Define Text Colours Here
## =============================================================================

colour_header <- "grey95"
colour_text <- "grey95"
colour_line <- "steelblue"
colour_link <- "grey95"
colour_intro <- "chartreuse3"
colour_data <- "yellow1"
colour_crimemap <- "darkorange"
colour_rcrimemap <- "dodgerblue"


## =============================================================================
## Create set_pixel
## =============================================================================

row_pixel <- c("sep0", "header",
               "sep1", "intro",
               "sep2", "main_title",
               "sep3", "main_logo",
               "sep4", "url",
               "sep5", "sub_logo",
               "sep6", "sub_text",
               "sep7", "footer",
               "sep8")

set_pixel <- data.frame(define = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        start = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        end = matrix(NA, nrow = length(row_pixel), ncol = 1))
rownames(set_pixel) <- row_pixel

## Change these
set_pixel["sep0", 1] <- 20
set_pixel["sep1", 1] <- 20
set_pixel["sep2", 1] <- 20
set_pixel["sep3", 1] <- 0 
set_pixel["sep4", 1] <- 0 
set_pixel["sep5", 1] <- 0 
set_pixel["sep6", 1] <- 0 
set_pixel["sep7", 1] <- 20
set_pixel["sep8", 1] <- 20

set_pixel["header", 1] <- 280
set_pixel["intro", 1] <- 320 
set_pixel["main_title", 1] <- 120
set_pixel["main_logo", 1] <- 320 
set_pixel["url", 1] <- 70 
set_pixel["sub_logo", 1] <- 320
set_pixel["sub_text", 1] <- 320
set_pixel["footer", 1] <- 150


## Update set_pixel
set_pixel["sep0", 2] <- 1
set_pixel["sep0", 3] <- set_pixel["sep0", 1]
for (n_row in 2:nrow(set_pixel)) {
  set_pixel[n_row, 2] <- set_pixel[(n_row-1), 3] + 1
  set_pixel[n_row, 3] <- set_pixel[n_row, 2] + set_pixel[n_row, 1] - 1
}

## Print it out (too see if it matches 2000 pixel)
print(set_pixel)



## =============================================================================
## Custom function for converting images into grob object
## =============================================================================

img2grob <- function(filename = NULL) {
  img <- readImage(filename)
  return(rasterGrob(img, interpolate=TRUE))
}


## =============================================================================
## Initiate PDF 
## =============================================================================

## Load Extra Fonts
suppressMessages(loadfonts())

## Create blank pdf
## pdf(file = "test.pdf", height = 33.1, width = 46.8, compress = TRUE, family = "Ubuntu") ## use this if avaialble
pdf(file = "output.pdf", height = 33.1, width = 46.8, compress = TRUE)


## =============================================================================
## Create PDF 
## =============================================================================

## Set grid (A0 = 1:1.414, use 2000 x 2828 to approximate)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2000, 2828)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)


## =============================================================================
## Create Custom ggplot2 theme
## =============================================================================

theme_blank <- create_ggtheme("blank")  ## see rPlotter package


## =============================================================================
## Print to PDF - Background
## =============================================================================


bg_img <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_background.jpg"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

print(bg_img, vp = vplayout(1:2000, 1:2828))


## =============================================================================
## Print to PDF - Header
## =============================================================================

bg_shade <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "steelblue", fill = "black", alpha = 0.5, size = 5) +
  theme_blank

## Header
print(bg_shade, vp = vplayout(set_pixel["header",2:3], 21:2808))  ## i.e. 20 off the edges



## =============================================================================
## Close PDF Device and Save
## =============================================================================

## Save
dev.off()


## =============================================================================
## Embed Font
## =============================================================================

##  If you don't specify 'outfile', it will overwrite the original file
# embed_fonts("output.pdf", outfile = "output_embedded.pdf")


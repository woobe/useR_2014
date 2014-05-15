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
colour_line <- "grey95"
colour_link <- "grey95"
colour_intro <- "grey95"
colour_data <- "grey95"
colour_crimemap <- "grey95"
colour_rcrimemap <- "grey95"


## =============================================================================
## Create set_pixel
## =============================================================================

row_pixel <- c("sep0", "header",
               "sep1", "row1",
               "sep2", "row2",
               "sep3")

set_pixel <- data.frame(define = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        start = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        end = matrix(NA, nrow = length(row_pixel), ncol = 1))
rownames(set_pixel) <- row_pixel

## Change these
set_pixel["sep0", 1] <- 0
set_pixel["sep1", 1] <- 50
set_pixel["sep2", 1] <- 50
set_pixel["sep3", 1] <- 50

set_pixel["header", 1] <- 330
set_pixel["row1", 1] <- 760
set_pixel["row2", 1] <- 760


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
## Print to PDF - Shades
## =============================================================================

bg_shade <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "transparent", fill = "black", alpha = 0.5, size = 0) +
  theme_blank

## Header
print(bg_shade, vp = vplayout(set_pixel["header",2:3], 1:2828))  ## i.e. 20 off the edges

## Row 1
print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 51:560))
print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 611:2218))
print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 2269:2778))

## Row 2
print(bg_shade, vp = vplayout(set_pixel["row2",2:3], 51:560))
print(bg_shade, vp = vplayout(set_pixel["row2",2:3], 611:2218))
print(bg_shade, vp = vplayout(set_pixel["row2",2:3], 2269:2778))

## Row 1 Title Shade
pixel_title <- 100
print(bg_shade, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 51:560))
print(bg_shade, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 611:2218))
print(bg_shade, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 2269:2778))

## Row 2 Title Shade
pixel_title <- 100
print(bg_shade, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 51:560))
print(bg_shade, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 611:2218))
print(bg_shade, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 2269:2778))

## =============================================================================
## Print to PDF - Text
## =============================================================================

title_header <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 7.25, label = "Interactive Spatial Data Visualization", size = 50, colour = colour_header) +
  annotate("text", x = 5, y = 4.75, label = "Exploring Different Options with Case Studies based on UK Crime Data", size = 25, colour = colour_text) +
  annotate("segment", x = 1, xend = 9, y = 3.25, yend = 3.25, size = 2, colour = colour_line) +
  annotate("text", x = 5, y = 2, label = "Jo-fai Chow", size = 25, colour = colour_text) +
  theme_blank

title_intro <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Introduction", size = 28, colour = "grey95") + theme_blank

title_data <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Crime Data", size = 28, colour = "grey95") + theme_blank

title_crimemap <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "CrimeMap: Shiny Web App", size = 28, colour = "grey95") + theme_blank

title_rcrimemap <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "rCrimemap: R Package", size = 28, colour = "grey95") + theme_blank

title_aboutme <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "About Me", size = 28, colour = "grey95") + theme_blank

title_credits <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Credits", size = 28, colour = "grey95") + theme_blank


## Header
print(title_header, vp = vplayout(set_pixel["header",2:3], 1:2828))  ## i.e. 20 off the edges

## Row 1
print(title_intro, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 51:560))
print(title_crimemap, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 611:2218))
print(title_aboutme, vp = vplayout(set_pixel["row1",2]:(set_pixel["row1",2] + pixel_title), 2269:2778))

## Row 2
print(title_data, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 51:560))
print(title_rcrimemap, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 611:2218))
print(title_credits, vp = vplayout(set_pixel["row2",2]:(set_pixel["row2",2] + pixel_title), 2269:2778))


## =============================================================================
## Print to PDF - Borders
## =============================================================================

bdr_grey <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "grey95", fill = "transparent", alpha = 0, size = 2) +
  theme_blank

## Row 1
print(bdr_grey, vp = vplayout(set_pixel["row1",2:3], 51:560))
print(bdr_grey, vp = vplayout(set_pixel["row1",2:3], 611:2218))
print(bdr_grey, vp = vplayout(set_pixel["row1",2:3], 2269:2778))

## Row 2
print(bdr_grey, vp = vplayout(set_pixel["row2",2:3], 51:560))
print(bdr_grey, vp = vplayout(set_pixel["row2",2:3], 611:2218))
print(bdr_grey, vp = vplayout(set_pixel["row2",2:3], 2269:2778))


## =============================================================================
## Print to PDF - Testing - Middle Column x 3
## =============================================================================

print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 611:1146))
print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 1147:1682))
print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 1683:2218))

print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 611:1146))
print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 1147:1682))
print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 1683:2218))


## =============================================================================
## Print to PDF - Testing - Golden Ratio
## =============================================================================

## row = 760 pixel
## title = 100 pixel, remain = 660
## top = 252, bottom = 408, ratio = 1.619

pixel_top <- 252

text_test <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 7, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 6, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 5, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 4, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 3, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  annotate("text", x = 5, y = 2, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
  theme_blank

#print(bdr_grey, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 51:560))
print(text_test, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 51:560))

#print(bdr_grey, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 51:560))
print(text_test, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 51:560))

#print(bdr_grey, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 611:1146))
print(text_test, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 611:1146))

#print(bdr_grey, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 611:1146))
print(text_test, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 611:1146))


## =============================================================================
## Print to PDF - Testing - Pictures with Transparent Background
## =============================================================================

pixel_offset <- 10

bg_logo <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_logo.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

print(bg_logo, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_offset):(set_pixel["row1",2] + pixel_title + pixel_top + pixel_offset), 51:560))
print(bg_logo, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_offset):(set_pixel["row1",2] + pixel_title + pixel_top + pixel_offset), 611:1146))
print(bg_logo, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_offset):(set_pixel["row1",2] + pixel_title + pixel_top + pixel_offset), 1147:1682))
print(bg_logo, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_offset):(set_pixel["row1",2] + pixel_title + pixel_top + pixel_offset), 1683:2218))
print(bg_logo, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_offset):(set_pixel["row1",2] + pixel_title + pixel_top + pixel_offset), 2269:2778))

print(bg_logo, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_offset):(set_pixel["row2",2] + pixel_title + pixel_top + pixel_offset), 51:560))
print(bg_logo, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_offset):(set_pixel["row2",2] + pixel_title + pixel_top + pixel_offset), 611:1146))
print(bg_logo, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_offset):(set_pixel["row2",2] + pixel_title + pixel_top + pixel_offset), 1147:1682))
print(bg_logo, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_offset):(set_pixel["row2",2] + pixel_title + pixel_top + pixel_offset), 1683:2218))
print(bg_logo, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_offset):(set_pixel["row2",2] + pixel_title + pixel_top + pixel_offset), 2268:2778))



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


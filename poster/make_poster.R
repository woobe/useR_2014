## =============================================================================
## R Script for useR! Poster
## =============================================================================

rm(list=ls())
if (Sys.info()[1] == "Linux") setwd("/media/SUPPORT/Cloud/Copy/Repo/useR_2014/poster") else setwd("D:/Cloud/Copy/Repo/useR_2014/poster")


## =============================================================================
## Load Packages
## =============================================================================
#####

library(grid)
library(gridExtra)
library(EBImage)
library(ggplot2)
library(rPlotter)
library(extrafont) ## Note: Run font_import() if it has not been done yet

Darjeeling2 <- c("#ECCBAE", "#046C9A", "#D69C4E", "#ABDDDE", "#000000")


## =============================================================================
## Define Text Colours Here
## =============================================================================
#####

colour_header <- "black"
colour_text <- "black"
colour_title <- "black"
colour_line <- Darjeeling2[2]

colour_link <- "grey95"
colour_intro <- "grey95"
colour_data <- "grey95"
colour_crimemap <- "grey95"
colour_rcrimemap <- "grey95"


## =============================================================================
## Set height of each component
## =============================================================================
#####

row_pixel <- c("sep0",
               "header",
               "sep1",
               "c1",
               "t1",
               "sep2",
               "main",
               "sep3",
               "t2",
               "c2",
               "sep4",
               "footer",
               "sep5")
             

set_pixel <- data.frame(define = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        start = matrix(NA, nrow = length(row_pixel), ncol = 1),
                        end = matrix(NA, nrow = length(row_pixel), ncol = 1))
rownames(set_pixel) <- row_pixel

## Change these
set_pixel["sep0", 1] <- 20
set_pixel["sep1", 1] <- 20
set_pixel["sep2", 1] <- 20
set_pixel["sep3", 1] <- 20
set_pixel["sep4", 1] <- 20
set_pixel["sep5", 1] <- 20

set_pixel["header", 1] <- 200
set_pixel["c1", 1] <- 300
set_pixel["t1", 1] <- 80
set_pixel["main", 1] <- 800
set_pixel["t2", 1] <- 80
set_pixel["c2", 1] <- 300
set_pixel["footer", 1] <- 120


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
#####

img2grob <- function(filename = NULL) {
  img <- readImage(filename)
  return(rasterGrob(img, interpolate=TRUE))
}


## =============================================================================
## Initiate PDF Creation
## =============================================================================
#####

## Load Extra Fonts
suppressMessages(loadfonts())

## Create blank pdf
if (Sys.info()[1] == "Linux") {
  pdf(file = "output.pdf", height = 33.1, width = 46.8, compress = TRUE, family = "Ubuntu") ## use this if I am on Linux
} else {
  pdf(file = "output.pdf", height = 33.1, width = 46.8) ## use Window's default
}


## =============================================================================
## Set grid layout
## =============================================================================
#####

## Set grid (A0 = 1:1.414, use 2000 x 2828 to approximate)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2000, 2828)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)


## =============================================================================
## Create Custom ggplot2 theme
## =============================================================================
#####

theme_blank <- create_ggtheme("blank")  ## use rPlotter package


## =============================================================================
## Print to PDF - Background Images
## =============================================================================
#####

# bg_img <- qplot(1:1, 1:1, geom = "blank") +
#   annotation_custom(img2grob("img_background.jpg"), 
#                     xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
#   theme_blank
# 
# print(bg_img, vp = vplayout(1:2828, 1:2000))


## =============================================================================
## Print to PDF - Shades
## =============================================================================

bg_shade <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "transparent", fill = "grey", alpha = 0.25, size = 1) +
  theme_blank


## =============================================================================
## Print to PDF - Header
## =============================================================================

title_header <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = "Interactive Spatial Data Visualization", size = 32, colour = colour_header) +
  annotate("text", x = 5, y = 5.4, label = "Exploring Two Different Options with Case Studies based on UK Crime Data", size = 14, colour = colour_header) +
  annotate("segment", x = 2, xend = 8, y = 4.25, yend = 4.25, size = 2.5, colour = colour_line) +
  annotate("text", x = 5, y = 3, label = "Jo-fai Chow", size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.5, label = "EngD Candidate in Hydroinformatics, University of Exeter, United Kingdom", size = 10, colour = colour_header) +
  theme_blank

print(bg_shade, vp = vplayout(set_pixel["header",2:3], 21:594))
print(bg_shade, vp = vplayout(set_pixel["header",2:3], 615:2214))
print(bg_shade, vp = vplayout(set_pixel["header",2:3], 2235:2808))

print(title_header, vp = vplayout(set_pixel["header",2:3], 415:2414))

## =============================================================================
## Print to PDF - t1 and c1
## =============================================================================

print(bg_shade, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 21:468))
print(bg_shade, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 489:936))
print(bg_shade, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 957:1872))
print(bg_shade, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 1893:2340))
print(bg_shade, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 2361:2808))

## =============================================================================
## Print to PDF - main
## =============================================================================

print(bg_shade, vp = vplayout(set_pixel["main",2:3], 21:1404))
print(bg_shade, vp = vplayout(set_pixel["main",2:3], 1425:2808))

## =============================================================================
## Print to PDF - t2 and c2
## =============================================================================

print(bg_shade, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 21:468))
print(bg_shade, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 489:936))
print(bg_shade, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 957:1872))
print(bg_shade, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 1893:2340))
print(bg_shade, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 2361:2808))

## =============================================================================
## Print to PDF - titles
## =============================================================================

txt_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Motivation", size = 16, colour = colour_title) +
  theme_blank

txt_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Dependencies", size = 16, colour = colour_title) +
  theme_blank

txt_dat <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Open Crime Data in United Kingdom", size = 16, colour = colour_title) +
  theme_blank

txt_cm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Simple to Use", size = 16, colour = colour_title) +
  theme_blank

txt_cm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Customizable", size = 16, colour = colour_title) +
  theme_blank

txt_mob <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Responsive and Mobile-Friendly", size = 16, colour = colour_title) +
  theme_blank

txt_rcm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Intuitive Controls", size = 16, colour = colour_title) +
  theme_blank

txt_rcm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Reactive Visuals", size = 16, colour = colour_title) +
  theme_blank



print(txt_mot, vp = vplayout(set_pixel["t1", 2:3], 21:468))
print(txt_dep, vp = vplayout(set_pixel["t1", 2:3], 489:936))
print(txt_dat, vp = vplayout(set_pixel["t1", 2:3], 957:1872))
print(txt_mot, vp = vplayout(set_pixel["t1", 2:3], 1893:2340))
print(txt_dep, vp = vplayout(set_pixel["t1", 2:3], 2361:2808))

print(txt_cm1, vp = vplayout(set_pixel["t2", 2:3], 21:468))
print(txt_cm2, vp = vplayout(set_pixel["t2", 2:3], 489:936))
print(txt_mob, vp = vplayout(set_pixel["t2", 2:3], 957:1872))
print(txt_rcm1, vp = vplayout(set_pixel["t2", 2:3], 1893:2340))
print(txt_rcm2, vp = vplayout(set_pixel["t2", 2:3], 2361:2808))


## =============================================================================
## Print to PDF - Content - CrimeMap - Motivation 
## =============================================================================

txt_cm_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1.2, y = 8.00, label = '"If you want to learn sth', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.2, y = 6.75, label = 'new, find an intersting', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.2, y = 5.50, label = 'problem and dive into it!"', size = 14, colour = colour_header, hjust=0) +
  theme_blank

print(txt_cm_mot, vp = vplayout(set_pixel["c1", 2:3], 21:468))

## =============================================================================
## Print to PDF - Content - CrimeMap - Dependencies
## =============================================================================

txt_cm_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = 'ggmap, ggplot2, grid, plyr,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 6.75, label = 'markdown, png, RCurl,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 5.5, label = 'RJSONIO, shiny, shinyapps', size = 14, colour = colour_header) +
  theme_blank

print(txt_cm_dep, vp = vplayout(set_pixel["c1", 2:3], 489:936))

## =============================================================================
## Print to PDF - Content - CrimeMap - Simple
## =============================================================================

txt_cm_sim <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1.4, y = 4.25, label = 'Enter a location, date', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.4, y = 3.00, label = 'and length of analysis.', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.4, y = 1.75, label = 'Even my mom can do it!!', size = 14, colour = colour_header, hjust=0) +
  theme_blank

print(txt_cm_sim, vp = vplayout(set_pixel["c2", 2:3], 21:468))


## =============================================================================
## Print to PDF - Content - CrimeMap - Customisble
## =============================================================================

txt_cm_cus <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1.4, y = 4.25, label = 'Advanced settings are', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.4, y = 3.00, label = 'just a few clicks away. ', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.4, y = 1.75, label = 'What is your favorite?', size = 14, colour = colour_header, hjust=0) +
  theme_blank

print(txt_cm_cus, vp = vplayout(set_pixel["c2", 2:3], 489:936))


## =============================================================================
## Print to PDF - Content - CrimeMap - Responsive and Mobile-Friendly
## =============================================================================

txt_res1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 2.75, y = 3.00, label = 'Shiny automatically adjusts', size = 14, colour = colour_text) +
  annotate("text", x = 2.75, y = 1.75, label = 'layout for mobile devices.', size = 14, colour = colour_text) +
  theme_blank

txt_res2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 7.25, y = 3.00, label = 'Heatmaps can be saved as', size = 14, colour = colour_text) +
  annotate("text", x = 7.25, y = 1.75, label = 'self-contained webpages.', size = 14, colour = colour_text) +
  theme_blank

print(txt_res1, vp = vplayout(set_pixel["c2", 2:3], 957:1872))
print(txt_res2, vp = vplayout(set_pixel["c2", 2:3], 957:1872))


## =============================================================================
## Print to PDF - Content - rCrimemap - Motivation 
## =============================================================================

txt_rcm_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1, y = 8.00, label = '"You can create interactive', size = 14, colour = colour_text, hjust=0) +
  annotate("text", x = 1, y = 6.75, label = 'heatmaps using Leaflet JS', size = 14, colour = colour_text, hjust=0) +
  annotate("text", x = 1, y = 5.50, label = 'with rMaps, interested?"', size = 14, colour = colour_text, hjust=0) +
  theme_blank

print(txt_rcm_mot, vp = vplayout(set_pixel["c1", 2:3], 1893:2340))


## =============================================================================
## Print to PDF - Content - rCrimemap - Dependencies
## =============================================================================

txt_rcm_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = 'ggmap, dplyr, plyr,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 6.75, label = 'rCharts, rjson, rMaps', size = 14, colour = colour_header) +
  theme_blank

print(txt_rcm_dep, vp = vplayout(set_pixel["c1", 2:3], 2361:2808))


## =============================================================================
## Print to PDF - Content - rCrimemap - Intuitive
## =============================================================================

txt_rcm_int <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1.3, y = 3.00, label = 'Navigate and zoom like', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.3, y = 1.75, label = 'using any electronic map.', size = 14, colour = colour_header, hjust=0) +
  theme_blank

print(txt_rcm_int, vp = vplayout(set_pixel["c2", 2:3], 1893:2340))


## =============================================================================
## Print to PDF - Content - rCrimemap - Reactive Visuals
## =============================================================================

txt_rcm_rea <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1.5, y = 3.00, label = 'Heatmaps automatically', size = 14, colour = colour_header, hjust=0) +
  annotate("text", x = 1.5, y = 1.75, label = 'adjusted while zooming.', size = 14, colour = colour_header, hjust=0) +
  theme_blank

print(txt_rcm_rea, vp = vplayout(set_pixel["c2", 2:3], 2361:2808))


## =============================================================================
## Print to PDF - Lines
## =============================================================================

line1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 4.75, xend = 5.25, y = Inf, yend = -Inf, size = 2, colour = colour_line) +
  theme_blank

line2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5.25, xend = 4.75, y = Inf, yend = -Inf, size = 2, colour = colour_line) +
  theme_blank

line3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5, xend = 5, y = Inf, yend = -Inf, size = 2, colour = colour_line) +
  theme_blank

n_offset <- 10

## Left (CrimeMap)
print(line1, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 21:468))
print(line2, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 21:468))

print(line3, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 489:936))
print(line3, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 489:936))

print(line2, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 957:1404))
print(line1, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 957:1404))

## Right (rCrimemap)
print(line1, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 1425:1872))
print(line2, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 1425:1872))

print(line3, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 1893:2340))
print(line3, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 1893:2340))

print(line2, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main",2]+n_offset), 2361:2808))
print(line1, vp = vplayout((set_pixel["main",3]-n_offset):(set_pixel["t2",2]+n_offset), 2361:2808))

## =============================================================================
## Print to PDF - footer
## =============================================================================

print(bg_shade, vp = vplayout(set_pixel["footer",2:3], 21:2808))


## =============================================================================
## Print to PDF - Save
## =============================================================================

## Save
dev.off()

## =============================================================================
## Embed Font
## =============================================================================

## Embed fonts to make sure it gets printed correctly
##  If you don't specify 'outfile', it will overwrite the original file
if (Sys.info()[1] == "Linux") embed_fonts("output.pdf", outfile = "output_embedded.pdf") 


if (FALSE) {
  
  ## Row 1
  print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 51:560))
  #print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 611:2218))
  print(bg_shade, vp = vplayout(set_pixel["row1",2:3], 2269:2778))
  
  ## Row 2
  print(bg_shade, vp = vplayout(set_pixel["row2",2:3], 51:560))
  #print(bg_shade, vp = vplayout(set_pixel["row2",2:3], 611:2218))
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
    annotate("segment", x = 2, xend = 8, y = 3.25, yend = 3.25, size = 2.5, colour = "darkred") +
    annotate("text", x = 5, y = 2, label = "Jo-fai Chow", size = 25, colour = colour_text) +
    theme_blank
  
  title_intro <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "Introduction", size = 25, colour = "grey95") + theme_blank
  
  title_data <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "Crime Data", size = 25, colour = "grey95") + theme_blank
  
  title_crimemap <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "CrimeMap: Web App for Crime Heat Maps Creation", size = 25, colour = "grey95") + theme_blank
  
  title_rcrimemap <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "rCrimemap: Crime Heat Maps with Intutive Controls", size = 25, colour = "grey95") + theme_blank
  
  title_aboutme <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "About Me", size = 25, colour = "grey95") + theme_blank
  
  title_credits <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 5, label = "Credits", size = 25, colour = "grey95") + theme_blank
  
  
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
             colour = "darkred", fill = "transparent", alpha = 0, size = 2.5) +
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
  
  #print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 611:1146))
  #print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 1147:1682))
  #print(bdr_grey, vp = vplayout((set_pixel["row1",2]+ pixel_title):set_pixel["row1",3], 1683:2218))
  
  #print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 611:1146))
  #print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 1147:1682))
  #print(bdr_grey, vp = vplayout((set_pixel["row2",2]+ pixel_title):set_pixel["row2",3], 1683:2218))
  
  
  
  ## =============================================================================
  ## Print to PDF - Testing - Golden Ratio
  ## =============================================================================
  
  ## row = 760 pixel
  ## title = 100 pixel, remain = 660
  ## top = 252, bottom = 408, ratio = 1.619
  
  pixel_top <- 252 ## = half half
  
  text_test <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 8, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 7, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 6, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 5, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 4, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 3, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 2, label = "Blah blah blah blah", size = 18, colour = "grey95") + 
    theme_blank
  
  text_cm1 <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 8, label = "Origin", size = 25, colour = "grey95") + 
    annotate("text", x = 5, y = 6.25, label = "This CrimeMap project", size = 17, colour = "grey95") + 
    annotate("text", x = 5, y = 5.25, label = "is based on ggmap's", size = 17, colour = "grey95") + 
    annotate("text", x = 5, y = 4.25, label = "examples. I modified", size = 17, colour = "grey95") + 
    annotate("text", x = 5, y = 3.25, label = "the plot settings and", size = 17, colour = "grey95") + 
    annotate("text", x = 5, y = 2.25, label = "plugged in UK data.", size = 17, colour = "grey95") + 
    theme_blank
  
  text_cm2 <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 8, label = "Shiny & ShinyApps", size = 25, colour = "grey95") + 
    annotate("text", x = 5, y = 6.25, label = "With Shiny I turned", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 5.25, label = "the code into a web", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 4.25, label = "app quickly. It is", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 3.25, label = "currenly hosted on", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 2.25, label = "ShinyApps.", size = 18, colour = "grey95") + 
    theme_blank
  
  text_cm3 <- qplot(1:9, 1:9, geom = "blank") +
    annotate("text", x = 5, y = 8, label = "Easy & Flexible", size = 25, colour = "grey95") + 
    annotate("text", x = 5, y = 6.25, label = "blah blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 5.25, label = "blah blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 4.25, label = "blah blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 3.25, label = "blah blah blah blah blah", size = 18, colour = "grey95") + 
    annotate("text", x = 5, y = 2.25, label = "blah blah blah blah blah", size = 18, colour = "grey95") + 
    theme_blank
  
  
  
  ## shades
  print(bg_shade, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 51:560))
  print(bg_shade, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 51:560))
  print(bg_shade, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 611:1146))
  print(bg_shade, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 611:1146))
  print(bg_shade, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 1147:1682))
  print(bg_shade, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 1147:1682))
  print(bg_shade, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 1683:2218))
  print(bg_shade, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 1683:2218))
  print(bg_shade, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 2269:2778))
  print(bg_shade, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 2269:2778))
  
  
  print(text_test, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 51:560))
  print(text_test, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 51:560))
  
  print(text_cm1, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 611:1146))
  print(text_cm2, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 1147:1682))
  print(text_cm3, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 1683:2218))
  
  print(text_cm1, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 611:1146))
  print(text_cm2, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 1147:1682))
  print(text_cm3, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 1683:2218))
  
  print(text_test, vp = vplayout((set_pixel["row1",2] + pixel_title + pixel_top):set_pixel["row1",3], 2269:2778))
  print(text_test, vp = vplayout((set_pixel["row2",2] + pixel_title + pixel_top):set_pixel["row2",3], 2269:2778))
  
  
  
  ## =============================================================================
  ## Print to PDF - Testing - Pictures with Transparent Background
  ## =============================================================================
  
  pixel_offset <- 0
  
  bg_logo <- qplot(1:100, 1:100, geom = "blank") +
    annotation_custom(img2grob("img_logo.png"), 
                      xmin=5, xmax=95, ymin=5, ymax=95) +
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
  
  
  
}



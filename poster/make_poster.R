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
#####

library(grid)
library(gridExtra)
library(EBImage)
library(ggplot2)
library(rPlotter)
library(extrafont) ## Note: Run font_import() if it has not been done yet
library(wesanderson)

wes_colour <- wes.palette(5, "Darjeeling")

## =============================================================================
## Define Text Colours Here
## =============================================================================
#####

colour_header <- "black"
colour_text <- "black"
colour_title <- "black"
colour_line <- "grey75"

colour_cm <- wes_colour[5]
colour_rcm <- wes_colour[4]

colour_line_cm <- wes_colour[5]
colour_line_rcm <- wes_colour[4]

colour_border_cm <- "darkblue"
colour_border_rcm <- "darkred"
colour_border_common <- "black"

colour_link <- Darjeeling2[2]
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
               "tm",
               "sep1",
               "c1",
               "t1",
               "sep2",
               "main1",
               "main2",
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
set_pixel["tm", 1] <- 120
set_pixel["c1", 1] <- 300
set_pixel["t1", 1] <- 80
set_pixel["main1", 1] <- 350
set_pixel["main2", 1] <- 350
set_pixel["t2", 1] <- 80
set_pixel["c2", 1] <- 300
set_pixel["footer", 1] <- 100


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
  pdf(file = "output.pdf", height = 33.1, width = 46.8, compress = TRUE, family = "Ubuntu") 
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

bg_img <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_background3.jpg"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

#print(bg_img, vp = vplayout(1:2000, 1:2828))  ## enable it for final print #######################


## =============================================================================
## Print to PDF - Shades
## =============================================================================

bg_shade <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "transparent", fill = "black", alpha = 0.2, size = 1) +
  theme_blank

bg_shade_cm <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "transparent", fill = colour_cm, alpha = 0.2, size = 1) +
  theme_blank

bg_shade_rcm <- qplot(1:1, 1:1, geom = "blank") +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
           colour = "transparent", fill = colour_rcm, alpha = 0.2, size = 1) +
  theme_blank

# print(bg_shade, vp = vplayout(set_pixel["header",2:3], 21:594))
# print(bg_shade, vp = vplayout(set_pixel["header",2:3], 615:2214))
# print(bg_shade, vp = vplayout(set_pixel["header",2:3], 2235:2808))

# print(bg_shade_cm, vp = vplayout(1:2000, 1:1414))
# print(bg_shade_rcm, vp = vplayout(1:2000, 1415:2828))

## Whole Area
# print(bg_shade_cm, vp = vplayout(21:1980, 21:1404))
# print(bg_shade_rcm, vp = vplayout(21:1980, 1425:2808))

## Title
print(bg_shade_cm, vp = vplayout(set_pixel["tm",2:3], 21:1404))
print(bg_shade_rcm, vp = vplayout(set_pixel["tm",2:3], 1425:2808))

## CM top
print(bg_shade_cm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 21:468))
print(bg_shade_cm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 489:936))
print(bg_shade_cm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 957:1404))

## RCM top
print(bg_shade_rcm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 1425:1872))
print(bg_shade_rcm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 1893:2340))
print(bg_shade_rcm, vp = vplayout(set_pixel["c1",2]:set_pixel["t1",3], 2361:2808))

## Main
print(bg_shade_cm, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))
print(bg_shade_rcm, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 1425:2808))
 
## CM bottom
print(bg_shade_cm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 21:468))
print(bg_shade_cm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 489:936))
print(bg_shade_cm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 957:1404))

## RCM bottom
print(bg_shade_rcm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 1425:1872))
print(bg_shade_rcm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 1893:2340))
print(bg_shade_rcm, vp = vplayout(set_pixel["t2",2]:set_pixel["c2",3], 2361:2808))

## =============================================================================
## Print to PDF - Profile Images
## =============================================================================

## Motivation CrimeMap
img_thrun <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_thrun_semi.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 41:176))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 177:312))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 313:448))

## Dependencies CrimeMap
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 509:644))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 645:780))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 781:916))

## Motivation rCrimemap
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 1913:2048))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 2049:2184))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 2185:2320))

## Dependencies rCrimemap
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 2381:2516))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 2517:2652))
print(img_thrun, vp = vplayout((set_pixel["c1",2]+200):set_pixel["t1",2], 2653:2788))


## Content CM1
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 41:176))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 177:312))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 313:448))

## Content CM2
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 509:644))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 645:780))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 781:916))

## Content CM3
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 977:1112))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1113:1248))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1249:1384))

## Content RM1
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1445:1580))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1581:1716))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1717:1852))

## Content RM2
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 1913:2048))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 2049:2184))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 2185:2320))

## Content RM3
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 2381:2516))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 2517:2652))
print(img_thrun, vp = vplayout(set_pixel["t2",3]:(set_pixel["c2",3]-200), 2653:2788))




## =============================================================================
## Print to PDF - Main Frame - CrimeMap
## =============================================================================

main_cm <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_main_crimemap.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

main_rcm <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("img_main_rCrimemap.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

n_offset <- 20

print(main_cm, vp = vplayout((set_pixel["main1", 2]+n_offset):(set_pixel["main2", 3]-n_offset), 
                             (21+n_offset):(1404-n_offset)))

print(main_rcm, vp = vplayout((set_pixel["main1", 2]+n_offset):(set_pixel["main2", 3]-n_offset), 
                             (1425+n_offset):(2808-n_offset)))



## =============================================================================
## Print to PDF - Header
## =============================================================================

title_header <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = "Interactive Spatial Data Visualization", size = 32, colour = colour_header) +
  annotate("text", x = 5, y = 5.4, label = "Exploring Two Different Options with Case Studies based on UK Crime Data", size = 14, colour = colour_header) +
  annotate("segment", x = 2, xend = 8, y = 4.25, yend = 4.25, size = 2.5, colour = colour_line) +
  annotate("text", x = 5, y = 3, label = "Jo-fai Chow", size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.5, label = "Hydroinformatics EngD Candidate, University of Exeter, UK", size = 12, colour = colour_header) +
  theme_blank

print(title_header, vp = vplayout(set_pixel["header",2:3], 415:2414))


## =============================================================================
## Print to PDF - titles
## =============================================================================

title_cm <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6.5, label = "CrimeMap (Shiny Web Application)", size = 22, colour = colour_header) +
  annotate("text", x = 5, y = 2.5, label = "http://bit.ly/bib_crimemap", size = 16, colour = colour_cm) +
  theme_blank

title_rcm <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6.5, label = "rCrimemap (R Package on GitHub)", size = 22, colour = colour_header) +
  annotate("text", x = 5, y = 2.5, label = "http://bit.ly/rCrimemap", size = 16, colour = colour_rcm) +
  theme_blank

title_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Motivation", size = 16, colour = colour_title) +
  theme_blank

title_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Dependencies", size = 16, colour = colour_title) +
  theme_blank

title_dat <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Open Crime Data in United Kingdom", size = 16, colour = colour_title) +
  theme_blank


title_cm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Simple", size = 16, colour = colour_title) +
  theme_blank

title_cm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Customizable", size = 16, colour = colour_title) +
  theme_blank

title_cm3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Mobile-Friendly", size = 16, colour = colour_title) +
  theme_blank

title_rcm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Intuitive", size = 16, colour = colour_title) +
  theme_blank

title_rcm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Reactive", size = 16, colour = colour_title) +
  theme_blank

title_rcm3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "Self-Contained", size = 16, colour = colour_title) +
  theme_blank

print(title_cm, vp = vplayout(set_pixel["tm", 2:3], 21:1404))
print(title_rcm, vp = vplayout(set_pixel["tm", 2:3], 1425:2808))

print(title_mot, vp = vplayout(set_pixel["t1", 2:3], 21:468))
print(title_dep, vp = vplayout(set_pixel["t1", 2:3], 489:936))
print(title_dat, vp = vplayout(set_pixel["t1", 2:3], 957:1872))
print(title_mot, vp = vplayout(set_pixel["t1", 2:3], 1893:2340))
print(title_dep, vp = vplayout(set_pixel["t1", 2:3], 2361:2808))

print(title_cm1, vp = vplayout(set_pixel["t2", 2:3], 21:468))
print(title_cm2, vp = vplayout(set_pixel["t2", 2:3], 489:936))
print(title_cm3, vp = vplayout(set_pixel["t2", 2:3], 957:1404))

print(title_rcm1, vp = vplayout(set_pixel["t2", 2:3], 1425:1872))
print(title_rcm2, vp = vplayout(set_pixel["t2", 2:3], 1893:2340))
print(title_rcm3, vp = vplayout(set_pixel["t2", 2:3], 2361:2808))



## =============================================================================
## Print to PDF - Borders
## =============================================================================

# bg_border_cm <- qplot(1:1, 1:1, geom = "blank") +
#   annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
#            colour = colour_border_cm, alpha = 0, size = 4, , linetype = "F1") +
#   theme_blank
# 
# bg_border_rcm <- qplot(1:1, 1:1, geom = "blank") +
#   annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
#            colour = colour_border_rcm, alpha = 0, size = 4, , linetype = "F1") +
#   theme_blank
# 
# bg_border_common <- qplot(1:1, 1:1, geom = "blank") +
#   annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, 
#            colour = colour_border_common, alpha = 0, size = 4, , linetype = "F1") +
#   theme_blank
# 
# print(bg_border_cm, vp = vplayout(set_pixel["c1", 2]:set_pixel["t1", 3], 21:468))
# print(bg_border_cm, vp = vplayout(set_pixel["c1", 2]:set_pixel["t1", 3], 489:936))
# print(bg_border_cm, vp = vplayout(set_pixel["main1", 2]:set_pixel["main2", 3], 21:1404))
# print(bg_border_cm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 21:468))
# print(bg_border_cm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 489:936))
# print(bg_border_cm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 957:1404))
# 
# print(bg_border_common, vp = vplayout(set_pixel["c1", 2]:set_pixel["t1", 3], 957:1872))
# 
# print(bg_border_rcm, vp = vplayout(set_pixel["c1", 2]:set_pixel["t1", 3], 1893:2340))
# print(bg_border_rcm, vp = vplayout(set_pixel["c1", 2]:set_pixel["t1", 3], 2361:2808))
# print(bg_border_rcm, vp = vplayout(set_pixel["main1", 2]:set_pixel["main2", 3], 1425:2808))
# print(bg_border_rcm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 1425:1872))
# print(bg_border_rcm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 1893:2340))
# print(bg_border_rcm, vp = vplayout(set_pixel["t2", 2]:set_pixel["c2", 3], 2361:2808))


## =============================================================================
## Print to PDF - Content - CrimeMap - Motivation 
## =============================================================================

txt_cm_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8.00, label = '"If you want to learn sth', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 6.75, label = 'new, find an intersting', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 5.50, label = 'problem and dive into it!"', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'Sebastian Thrun & Peter Norvig', size = 9, colour = colour_header) +
  theme_blank

print(txt_cm_mot, vp = vplayout(set_pixel["c1", 2:3], 21:468))

## =============================================================================
## Print to PDF - Content - CrimeMap - Dependencies
## =============================================================================

txt_cm_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = 'ggmap, ggplot2, grid, plyr,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 6.75, label = 'markdown, png, RCurl,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 5.5, label = 'jsonlite, shiny, shinyapps', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'David Kahle, Hadley Wickham, RStudio ...', size = 9, colour = colour_header) +
  theme_blank

print(txt_cm_dep, vp = vplayout(set_pixel["c1", 2:3], 489:936))

## =============================================================================
## Print to PDF - Content - CrimeMap - Simple
## =============================================================================

txt_cm_sim <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Create a map in 3 steps:', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = '(1) location, (2) date &', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = '(3) length of analysis.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'Even my parents can do it!', size = 9, colour = colour_header) +
  theme_blank

print(txt_cm_sim, vp = vplayout(set_pixel["c2", 2:3], 21:468))


## =============================================================================
## Print to PDF - Content - CrimeMap - Customisble
## =============================================================================

txt_cm_cus <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Advanced settings are just', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'a few clicks away. You can', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = 'change base map, colors etc.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'So, what is your favorite?', size = 9, colour = colour_header) +
  theme_blank

print(txt_cm_cus, vp = vplayout(set_pixel["c2", 2:3], 489:936))


## =============================================================================
## Print to PDF - Content - CrimeMap - Responsive and Mobile-Friendly
## =============================================================================

txt_cm_mob <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Shiny automatically adjusts', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'display layout for desktop', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = 'and mobile devices.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'You can focus on R code!', size = 9, colour = colour_header) +  
  theme_blank

print(txt_cm_mob, vp = vplayout(set_pixel["c2", 2:3], 957:1404))


## =============================================================================
## Print to PDF - Content - rCrimemap - Motivation 
## =============================================================================

txt_rcm_mot <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8.00, label = '"You can create interactive', size = 14, colour = colour_text) +
  annotate("text", x = 5, y = 6.75, label = 'heatmaps using Leaflet JS', size = 14, colour = colour_text) +
  annotate("text", x = 5, y = 5.50, label = 'with rMaps, interested?"', size = 14, colour = colour_text) +
  annotate("text", x = 5, y = 4.25, label = 'Ramnath Vaidyanathan', size = 9, colour = colour_header) +
  theme_blank

print(txt_rcm_mot, vp = vplayout(set_pixel["c1", 2:3], 1893:2340))


## =============================================================================
## Print to PDF - Content - rCrimemap - Dependencies
## =============================================================================

txt_rcm_dep <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 8, label = 'ggmap, dplyr, plyr,', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 6.75, label = 'rCharts, rjson, rMaps', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 5.50, label = '...', size = 14, colour = colour_text) +
  annotate("text", x = 5, y = 4.25, label = 'Ramnath, David, Hadley ...', size = 9, colour = colour_header) +
  theme_blank

print(txt_rcm_dep, vp = vplayout(set_pixel["c1", 2:3], 2361:2808))



## =============================================================================
## Print to PDF - Content - rCrimemap - Intuitive
## =============================================================================

txt_rcm_int <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Navigate and zoom in/out', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'like using any digital map', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = 'with mouse or touchscreen.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'Explore large areas with ease.', size = 9, colour = colour_header) +  
  theme_blank

print(txt_rcm_int, vp = vplayout(set_pixel["c2", 2:3], 1425:1872))


## =============================================================================
## Print to PDF - Content - rCrimemap - Reactive Visuals
## =============================================================================

txt_rcm_rea <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Colors are automatically', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'adjusted while zooming.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = 'Reactive density plots.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'Easy to see local crime hotspots!', size = 9, colour = colour_header) +  
  theme_blank

print(txt_rcm_rea, vp = vplayout(set_pixel["c2", 2:3], 1893:2340))

## =============================================================================
## Print to PDF - Content - rCrimemap - Self-Contained
## =============================================================================

txt_rcm_sel <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5.50, label = 'Heatmaps can be saved and', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 4.25, label = 'viewed as a webpage. Only', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 3.00, label = 'a browser is needed.', size = 14, colour = colour_header) +
  annotate("text", x = 5, y = 1.75, label = 'Easy to create and share with others!', size = 9, colour = colour_header) +  
  theme_blank

print(txt_rcm_sel, vp = vplayout(set_pixel["c2", 2:3], 2361:2808))


## =============================================================================
## Print to PDF - Footer
## =============================================================================

txt_footer <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = 'jofaichow.co.uk', size = 25, colour = colour_header) +
  theme_blank

print(txt_footer, vp = vplayout(set_pixel["footer", 2:3], 21:2808))

#print(bg_shade, vp = vplayout(set_pixel["footer",2:3], 21:2808))

## =============================================================================
## Print to PDF - Lines
## =============================================================================

n_offset <- 5

## Left (CrimeMap)

line1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 4.75, xend = 5.25, y = Inf, yend = -Inf, size = 2.5, colour = colour_cm) +
  theme_blank

line2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5.25, xend = 4.75, y = Inf, yend = -Inf, size = 2.5, colour = colour_cm) +
  theme_blank

line3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5, xend = 5, y = Inf, yend = -Inf, size = 2.5, colour = colour_cm) +
  theme_blank

# print(line1, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 21:468))
# print(line2, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 21:468))
# 
# print(line3, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 489:936))
# print(line3, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 489:936))
# 
# print(line2, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 957:1404))
# print(line1, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 957:1404))


## Right (rCrimemap)

line1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 4.75, xend = 5.25, y = Inf, yend = -Inf, size = 2.5, colour = colour_rcm) +
  theme_blank

line2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5.25, xend = 4.75, y = Inf, yend = -Inf, size = 2.5, colour = colour_rcm) +
  theme_blank

line3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("segment", x = 5, xend = 5, y = Inf, yend = -Inf, size = 2.5, colour = colour_rcm) +
  theme_blank

# print(line1, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 1425:1872))
# print(line2, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 1425:1872))
# 
# print(line3, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 1893:2340))
# print(line3, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 1893:2340))
# 
# print(line2, vp = vplayout((set_pixel["t1",3]-n_offset):(set_pixel["main1",2]+n_offset), 2361:2808))
# print(line1, vp = vplayout((set_pixel["main2",3]-n_offset):(set_pixel["t2",2]+n_offset), 2361:2808))


## =============================================================================
## Print to PDF - More Annotations
## =============================================================================

## SOHO
line_cm1 <- qplot(1:100, 1:100, geom = "blank") +
  annotate("segment", x = 35, xend = 15.5, y = 82.5, 
           yend = 69, size = 1, 
           colour = "black", arrow=arrow()) +
  theme_blank

print(line_cm1, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))

print(bg_shade, vp = vplayout((set_pixel["main1",2]+90):(set_pixel["main1",2]+210), 
                                 500:690))

## Big Ben
line_cm2a <- qplot(1:100, 1:100, geom = "blank") +
  annotate("segment", x = 12, xend = 13, y = 22, 
           yend = 33, size = 1, 
           colour = "black", arrow=arrow()) +
  theme_blank

line_cm2b <- qplot(1:100, 1:100, geom = "blank") +
  annotate("segment", x = 12, xend = 20, y = 22, 
           yend = 43.5, size = 1, 
           colour = "black", arrow=arrow()) +
  theme_blank

print(line_cm2a, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))
print(line_cm2b, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))

print(bg_shade, vp = vplayout((set_pixel["main2",2]+160):(set_pixel["main2",2]+280), 
                              100:290))

## Waterloo
line_cm3a <- qplot(1:100, 1:100, geom = "blank") +
  annotate("segment", x = 40, xend = 26, y = 22, 
           yend = 47.5, size = 1, 
           colour = "black", arrow=arrow()) +
  theme_blank

line_cm3b <- qplot(1:100, 1:100, geom = "blank") +
  annotate("segment", x = 40, xend = 31, y = 22, 
           yend = 47, size = 1, 
           colour = "black", arrow=arrow()) +
  theme_blank

print(line_cm3a, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))
print(line_cm3b, vp = vplayout(set_pixel["main1",2]:set_pixel["main2",3], 21:1404))

print(bg_shade, vp = vplayout((set_pixel["main2",2]+160):(set_pixel["main2",2]+280), 
                              500:690))






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


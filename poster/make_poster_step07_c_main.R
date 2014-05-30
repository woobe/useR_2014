## =============================================================================
## Mini script - print all images
## =============================================================================

## Global Offset
n_off <- 20


## =============================================================================
## Left Side: CrimeMap
## =============================================================================

## Content (Main)

## CrimeMap App Settings
## London Eye, 2014-01, 1, none, hybrid, high res, BW, 0.1-1, 15, 0.1, black, yellow, red, no watermark
cm_content_main_01 <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/cm_content_main_01.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) + theme_blank

print(cm_content_main_01, vp = vplayout((set_pixel["c_main",2]+n_off):(set_pixel["c_main",3]-n_off), 21:702))

## CrimeMap App Settings
## London Eye, 2014-01, 1, category, roadmap, high res, BW, 0.1-1, 15, 0.1, black, yellow, red
cm_content_main_02 <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/cm_content_main_02.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) + theme_blank

print(cm_content_main_02, vp = vplayout((set_pixel["c_main",2]+n_off):(set_pixel["c_main",3]-n_off), 723:1404))


## =============================================================================
## Right Side: rCrimemap
## =============================================================================

## Create rCrimemap
if (FALSE) {
  
  library(rCrimemap)
  m <- rcmap_quick(period = "2014-01", map_size = c(1000,1000), 
                   map_center = "London Eye", zoom = 14,
                   provide = "Nokia.normalDay") # OpenStreetMap.BlackAndWhite OpenMapSurfer.Grayscale
  m
  
  #provide = "OpenStreetMap.BlackAndWhite")
  
}

## Content (Main1)

rcm_content_main_01 <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/rcm_content_main_01.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) + theme_blank

print(rcm_content_main_01, vp = vplayout((set_pixel["c_main",2]+n_off):(set_pixel["c_main",3]-n_off), 1425:2106))

## Content (Main2)
rcm_content_main_02 <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/rcm_content_main_02_semi.png"),    ## transparent border
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) + theme_blank

print(rcm_content_main_02, vp = vplayout((set_pixel["c_main",2]+n_off):(set_pixel["c_main",3]-n_off), 2127:2808))



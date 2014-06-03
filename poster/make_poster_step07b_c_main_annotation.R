## =============================================================================
## Mini script 
## =============================================================================

## Global Offset
n_off_top <- 20
n_off <- 35

## =============================================================================
## Left Side: CrimeMap
## =============================================================================

## Content (Main)

## CrimeMap App Settings
## London Eye, 2014-01, 1, none, hybrid, high res, BW, 0.2-1, 10, 1, grey95, yellow, red, no watermark

ln_main_01a <- qplot(1:1000, 1:1000, geom = "blank") +
  annotate("segment", 
           x = 700, xend = 305, 
           y = 850, yend = 750, size = 2, 
           colour = col_line1, 
           arrow=arrow()) +
  theme_blank

ln_main_01b <- qplot(1:1000, 1:1000, geom = "blank") +
  annotate("segment", 
           x = 200, xend = 260, 
           y = 300, yend = 365, size = 2, 
           colour = col_line1, 
           arrow=arrow()) +
  theme_blank

ln_main_01c <- qplot(1:1000, 1:1000, geom = "blank") +
  annotate("segment", 
           x = 500, xend = 400, 
           y = 300, yend = 450, size = 2, 
           colour = col_line1, 
           arrow=arrow()) +
  theme_blank

ln_main_01d <- qplot(1:1000, 1:1000, geom = "blank") +
  annotate("segment", 
           x = 800, xend = 600, 
           y = 300, yend = 510, size = 2, 
           colour = col_line1, 
           arrow=arrow()) +
  theme_blank

print(ln_main_01a, vp = vplayout(set_pixel["c_main", 2:3], 21:702))
print(ln_main_01b, vp = vplayout(set_pixel["c_main", 2:3], 21:702))
print(ln_main_01c, vp = vplayout(set_pixel["c_main", 2:3], 21:702))
print(ln_main_01d, vp = vplayout(set_pixel["c_main", 2:3], 21:702))


## Images
img_soho1 <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_soho1.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

print(img_soho1, vp = vplayout(546:645, 451:550))
print(img_soho1, vp = vplayout(881:980, 126:225))
print(img_soho1, vp = vplayout(881:980, 311:410))
print(img_soho1, vp = vplayout(881:980, 496:595))

## Text
txt_soho <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 73, y = 82, label = "Soho District", size = 12, colour = col_text3) +
  theme_blank

txt_westmin <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 20, y = 10, label = "Victoria Street", size = 12, colour = col_text3) +
  theme_blank

txt_bigben <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 51, y = 10, label = "Big Ben", size = 12, colour = col_text3) +
  theme_blank

txt_waterloo <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 81, y = 10, label = "Waterloo", size = 12, colour = col_text3) +
  theme_blank

print(txt_soho, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_westmin, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_bigben, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_waterloo, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))



## =============================================================================
## Mini script 
## =============================================================================

## Global Offset
n_off_top <- 20
n_off <- 35

## =============================================================================
## lines
## =============================================================================

ln_main_01a <- qplot(1:1000, 1:1000, geom = "blank") +
  annotate("segment", 
           x = 700, xend = 305, 
           y = 840, yend = 750, size = 2, 
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
           x = 490, xend = 400, 
           y = 270, yend = 450, size = 2, 
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


## =============================================================================
## Shades (Background for Text)
## =============================================================================

print(shade, vp = vplayout(510:560, 390:615))

print(shade, vp = vplayout(975:1025, 90:250))

print(shade, vp = vplayout(975:1025, 265:465))

print(shade, vp = vplayout(975:1025, 480:645))


## =============================================================================
## Text
## =============================================================================

txt_soho <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 73, y = 82, label = "Soho District", size = 10, colour = col_text3) +
  annotate("text", x = 73, y = 79, label = "all sorts of entertainment venues", size = 6, colour = col_text3) +
  theme_blank

txt_police <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 20, y = 10, label = "Police HQ", size = 10, colour = col_text3) +
  annotate("text", x = 20, y = 7, label = "crimes recorded at HQ", size = 6, colour = col_text3) +
  theme_blank

txt_bigben <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 51, y = 10, label = "Attractions", size = 10, colour = col_text3) +
  annotate("text", x = 51, y = 7, label = "Big Ben, Westminster Abbey", size = 6, colour = col_text3) +
  theme_blank

txt_waterloo <- qplot(1:100, 1:100, geom = "blank") +
  annotate("text", x = 83, y = 10, label = "Waterloo", size = 10, colour = col_text3) +
  annotate("text", x = 83, y = 7, label = "central railway terminus", size = 6, colour = col_text3) +
  theme_blank

print(txt_soho, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_police, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_bigben, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))
print(txt_waterloo, vp = vplayout(set_pixel["t_main", 2]:set_pixel["c_main", 3], 21:702))



## =============================================================================
## Images
## =============================================================================

img_soho <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_soho1.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

img_police <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_police.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

img_bigben <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_bigben.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

img_waterloo <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_waterloo.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank

print(img_soho, vp = vplayout(566:665, 451:550))
print(img_police, vp = vplayout(871:970, 126:225))
print(img_bigben, vp = vplayout(871:970, 311:410))
print(img_waterloo, vp = vplayout(871:970, 506:605))



## =============================================================================
## Mini script - print Header
## =============================================================================

title_header <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 7.25, label = "Interactive Spatial Data Visualization", size = 32, colour = col_header) +
  annotate("text", x = 5, y = 4.50, label = "Exploring Two Different Options with Case Studies based on UK Crime Data", size = 14, colour = col_header) +
  annotate("segment", x = 3, xend = 7, y = 3.25, yend = 3.25, size = 2, colour = col_header_line) +
  annotate("text", x = 5, y = 2, label = "Jo-fai Chow, Hydroinformatics EngD Candidate, University of Exeter, UK", size = 12, colour = col_header) +
  theme_blank

print(title_header, vp = vplayout(set_pixel["header",2:3], 21:2808))

# n_off <- 20
# 
# ## useR! Logo (Left)
# img_useR <- qplot(1:1, 1:1, geom = "blank") +
#   annotation_custom(img2grob("./image/img_useR.png"), 
#                     xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
#   theme_blank
# 
# #print(shade, vp = vplayout((set_pixel["header",2]+n_off):(set_pixel["header",3]-n_off), 21:380))
# print(img_useR, vp = vplayout((set_pixel["header",2]+n_off):(set_pixel["header",3]-n_off), 21:380))
# 
# 
# ## UCLA logo
# print(shade, vp = vplayout((set_pixel["header",2]+n_off):(set_pixel["header",3]-n_off), 2449:2808))
# print(img_useR, vp = vplayout((set_pixel["header",2]+n_off):(set_pixel["header",3]-n_off), 2449:2808))






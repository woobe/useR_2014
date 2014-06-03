## =============================================================================
## Mini script - print Header
## =============================================================================

## Web site (middle)
txt_web <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 3.5, y = 5, label = "twitter: @matlabulous", size = 16, colour = col_text2) +
  annotate("text", x = 5, y = 5, label = "jofaichow.co.uk", size = 22, colour = col_text) +
  annotate("text", x = 6.5, y = 5, label = "code: github.com/woobe", size = 16, colour = col_text2) +
  theme_blank
print(txt_web, vp = vplayout(set_pixel["footer",2:3], 21:2808))

## left (useR)
img_useR <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_useR.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank
#print(shade, vp = vplayout(set_pixel["footer",2:3], 21:200))
print(img_useR, vp = vplayout(set_pixel["footer",2:3], 21:200))

## left (useR Text)
txt_useR <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 1, y = 8, label = "The R User Conference", size = 9, colour = col_text, hjust=0) +
  annotate("text", x = 1, y = 5, label = "June 30 - July 3, 2014", size = 9, colour = col_text, hjust=0) +
  annotate("text", x = 1, y = 2, label = "UCLA, Los Angeles", size = 9, colour = col_text, hjust=0) +
  theme_blank
print(txt_useR, vp = vplayout(set_pixel["footer",2:3], 201:1000))

## Right (scienceposters)
img_scienceposters <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_scienceposters.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  theme_blank
#print(shade, vp = vplayout(set_pixel["footer",2:3], 2360:2808))
print(img_scienceposters, vp = vplayout(set_pixel["footer",2:3], 2360:2808))


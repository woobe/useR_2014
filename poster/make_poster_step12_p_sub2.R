## =============================================================================
## Mini script
## =============================================================================

## Mini Images
img_thrun <- qplot(1:1, 1:1, geom = "blank") +
  annotation_custom(img2grob("./image/img_thrun_semi.png"), 
                    xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) + theme_blank

## A
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 41:162.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 183.67:305.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 326.33:448))

## B
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 509:630.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 651.67:773.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 794.33:916))

## C
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 977:1098.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1119.67:1241.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1262.33:1384))

## D
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1445:1566.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1587.67:1709.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1730.33:1852))

## E
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 1913:2034.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 2055.67:2177.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 2198.33:2320))

## F
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 2381:2502.67))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 2523.67:2645.33))
print(img_thrun, vp = vplayout(set_pixel['p_sub2', 2:3], 2666.33:2788))

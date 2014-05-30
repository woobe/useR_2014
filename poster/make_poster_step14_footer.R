## =============================================================================
## Mini script - print Header
## =============================================================================

footer1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "@matlabulous", size = 22, colour = col_text) +
  theme_blank

footer2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "jofaichow.co.uk", size = 22, colour = col_text) +
  theme_blank

footer3 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 5, label = "github.com/woobe", size = 22, colour = col_text) +
  theme_blank


print(footer1, vp = vplayout(set_pixel["footer",2:3], 21:936))
print(footer2, vp = vplayout(set_pixel["footer",2:3], 957:1872))
print(footer3, vp = vplayout(set_pixel["footer",2:3], 1893:2808))
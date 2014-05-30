## =============================================================================
## Mini script - print text in title (main)
## =============================================================================

## CrimeMap

txt_t_main_cm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6, label = "Crime Hot Spots in Central London", size = 15, colour = col_text) +
  annotate("text", x = 5, y = 2, label = "Analysis Period: January 2014", size = 12, colour = col_link_cm) +
  theme_blank

txt_t_main_cm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6, label = "Exploring Different Crime Categories", size = 15, colour = col_text) +
  annotate("text", x = 5, y = 2, label = "Using 'facet_grid' in ggplot2", size = 12, colour = col_link_cm) +
  theme_blank

print(txt_t_main_cm1, vp = vplayout(set_pixel["t_main", 2:3], 21:702))
print(txt_t_main_cm2, vp = vplayout(set_pixel["t_main", 2:3], 723:1404))


## rCrimemap

txt_t_main_rcm1 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6, label = "Crimes in England, Wales & N. Ireland", size = 15, colour = col_text) +
  annotate("text", x = 5, y = 2, label = "Analysis Period: January 2014", size = 12, colour = col_link_cm) +
  theme_blank

txt_t_main_rcm2 <- qplot(1:9, 1:9, geom = "blank") +
  annotate("text", x = 5, y = 6, label = "Zooming into Central London", size = 15, colour = col_text) +
  annotate("text", x = 5, y = 2, label = "Using rCharts, rMaps & Leaflet", size = 12, colour = col_link_cm) +
  theme_blank

print(txt_t_main_rcm1, vp = vplayout(set_pixel["t_main", 2:3], 1425:2106))
print(txt_t_main_rcm2, vp = vplayout(set_pixel["t_main", 2:3], 2127:2808))

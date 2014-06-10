The R User Conference 2014
==========

My abstract has been accepted as a poster for the R user conference 2014 (http://user2014.stat.ucla.edu/). This repository contains all my preparation materials.

## Abstract

### Exploring Different Options for Interactive Spatial Data Visualization in R: Case Studies based on Crime Data in UK

###<center>Jo-fai Chow<sup>1,2,3</sup></center>

- <sup>1</sup> University of Exeter, College of Engineering, Mathematics and Physical Sciences, Exeter, United Kingdom.
- <sup>2</sup> XP Solutions, Newbury, United Kingdom.
- <sup>3</sup> STREAM Industrial Doctorate Centre for the Water Sector, Cranfield, United Kingdom
- Contact author: [jofai.chow@gmail.com](mailto:jofai.chow@gmail.com)

**Keywords**: *Spatial visualization, case studies, open crime data, web application, interactive maps*

The maturality and extensive graphical abilities of R and its packages make R an excellent choice for professional data visualisation. This talk focuses on interactive spatial visualization and illustrates two different approaches with case studies based on open crime data in UK (Home Office, 2014).

Previous work has shown that it is possible to combine the functionality in packages **ggmap**, **ggplot2**, **shiny** and **shinyapps** for crime data visualization in the form of a web application named *'CrimeMap'* (Chow, 2013). The web application is user-friendly and highly customizable. It allows users to create and customize spatial visualization in a few clicks without prior knowledge in R (figure 1). Moreover, **shiny** automatcially adjusts the best application layout for desktop computers, tablets and smartphones.

<center>
<img src="http://i.imgur.com/CGX6hqx.jpg" alt="CrimeMap" width="350">
<img src="http://i.imgur.com/SJ1aa7w.jpg" alt="CrimeMap" width="350">
</center>

<center>**Figure 1 (Left)**: *'CrimeMap'* example. **Figure 2 (Right)**: **rCrimemap** example.</center>

Following the release of **rMaps** (Vaidyanathan, 2014), Chow built upon the original *'CrimeMap'* and created a new package **rCrimemap** (Chow, 2014). Leveraging the power of JavaScript mapping libraries such as *'leaflet'* via **rMaps**, **rCrimemap** allows users to create an interactive crime map in R with intuitive map controls using only one line of code. Both zooming and navigation are similar to what ones would expect from using a typical digital map (see figure 2 above).
The availability of these packages means R developers can now easily overlay both graphcial and numerical results from complex statistical analysis with maps to create professional and insightful spatial visualization. This is particularly useful for effective communication and decision making.

### References

- Chow, J. (2013). Blend it like a Bayesian: Introducing CrimeMap - A Web App Powered by ShinyApps, http://bit.ly/bib_crimemap_blog2.
- Chow, J. (2014). Package **rCrimemap** on GitHub, http://bit.ly/rCrimemap.
Home Office (2014).
- Open Data about Crime and Policing in England, Wales and Northern Ireland, http://data.police.uk.
- Vaidyanathan, R. (2014). Package **rMaps** on GitHub, https://github.com/ramnathv/rMaps.

## Poster (Snapshot)

<center>
<img src="http://i.imgur.com/EEfW8rM.jpg" alt="poster">
</center>


## System and Session Info

```
> Sys.info()
                                     sysname                                      release                                      version 
                                     "Linux"                          "3.13.0-24-generic" "#47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014" 
                                    nodename                                      machine                                        login 
                                "woobe-mint"                                     "x86_64"                                    "unknown" 
                                        user                               effective_user 
                                     "woobe"                                      "woobe" 
```
```
> sessionInfo()
R version 3.0.2 (2013-09-25)
Platform: x86_64-pc-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_GB.UTF-8       LC_NUMERIC=C               LC_TIME=en_GB.UTF-8        LC_COLLATE=en_GB.UTF-8     LC_MONETARY=en_GB.UTF-8    LC_MESSAGES=en_GB.UTF-8    LC_PAPER=en_GB.UTF-8      
 [8] LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C             LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
[1] tools_3.0.2
```

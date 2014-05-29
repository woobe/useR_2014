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

## Poster

I am working on it ...

**Requirement**: abstracts accepted for posters will take place during one of two evening poster sessions. Poster sessions are a social event. There are no parallel talks or events happening, so everyone can talk and stop by posters they are interested in. The dimensions of each poster should not exceed 4' x 4' or 120cm x 120cm.

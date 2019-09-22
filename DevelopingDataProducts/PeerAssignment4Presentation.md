Peer Assignment 4, US Arrests
========================================================
author: Carlos Andres Sanchez B.
date: September 21, 2019
autosize: true

US Arrests
========================================================


The data used in this assigment can be found in here:
 
   <http://stats4stem.weebly.com/r-usarrests-data.html>

 
- Represents Violent Crime Rates by US State
- This data is collected in 1975



Create Plot
========================================================


```r
library(ggplot2)
library(tidyr)

data("USArrests")

arrests <- USArrests
arrests$state <- rownames(USArrests)
arrests <- gather(arrests, 'type', 'arrests',-c(UrbanPop, state))

plot <- ggplot(arrests, 
                   aes(x=UrbanPop, y=arrests,color=type)) + 
                geom_point() + 
                ggtitle('US Arrests in 1975') + 
                xlab('Urban Population') +
                ylab('Arrests per 100 000 residents')
```

Final Plot
========================================================

![plot of chunk unnamed-chunk-2](PeerAssignment4Presentation-figure/unnamed-chunk-2-1.png)


Description
========================================================


- With higher Population Urban rate, more arrests has been made
- Assaults represents the most common arrest
- There is more rapes than murder arrests in 1975, per 100 000 residents


Interactive Plot
========================================================

There is an interactive plot available for this data in the following
link:

- <https://casanchezbar.shinyapps.io/peerassignment4/>
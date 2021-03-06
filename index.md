---
title       : Branch Distribution
subtitle    : A dinamic map with Slidify and R
author      : J.Pere Gadea
output      : html_document
runtime     : shiny
framework   : io2012                # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js          # {highlight.js, prettify, highlight}
hitheme     : tomorrow              # 
widgets     : [shiny, interactive, leaflet]
mode        : selfcontained         # {standalone, draft}
knit        : slidify::knit2slides
---

## Do you need to improve the way you present information?

* Avoid static presentations?

* Formats too familiar?

* Insufficient capacity of surprise?

* Enhance the analytical skills

* Improve data visualization...

* ...and understanding of underlying patterns

---

## The idea. Operation and use

> - The <span class = 'blue'>objective</span> is to create an app with shiny, exploiting various options and show in a slidify object.


> - The app generates a <span class = 'blue'>simulation</span> of random observations with 4 features: location defined by latitude and longitude, volume and results. The first 3 features follow a normal distribution with defined parameters, and the last, a binomial distribution.


> - The input under consideration is the number of observations and the ouput, the <span class = 'blue'>map with the features</span> .


> - The ideal app would have the option of uploading a file with actual data, and also assign more features (groups, temporal evolution etc ...), using dynamic graphics etc ...

--- 
## The app




```r
shinyApp(
            ui = pageWithSidebar(
            headerPanel("Distribution branches"),
            sidebarPanel(
                  numericInput("num", label=h3("number of branches"), 20, min=5, max = 100, step = 1), submitButton("Submit")
                  ),
            mainPanel(
                  leafletOutput("plot", height = 500, width = "100%")
            )
      ),
      server = function(input, output) {
            output$plot <- renderLeaflet({
                  points <- data.frame(
                        lon = rnorm(input$num, mean = -4, sd = 1.75),
                        lat = rnorm(input$num, mean = 40, sd = 1.75),
                        results = sample(c("benefits", "losses"), input$num, replace = TRUE, prob=c(0.8,0.2)),
                        volume = rnorm(input$num, 5000, 3000)
                        )
                        m = leaflet() %>% addTiles()
                        m = m %>% setView(-3.5,40 , zoom = 6)
                        m %>% addCircles(data = points, lng = ~ lon, lat = ~lat, radius = points$volume, stroke = F, fill = TRUE, fillColor = c("red", "blue"), fillOpacity = 0.3)
                  }
            )
      },

      options = list(height = 500)
)
```

<!--html_preserve--><iframe src="appba04404fb70cb661ae163a0cdceb87ab/?w=&amp;__subapp__=1" width="100%" height="500" class="shiny-frame"></iframe><!--/html_preserve-->

---
## Follow more info

Complete code:
[Link to GitHub](https://github.com/PereGadea/Developing-Data-Product)   

Functional app in:
[Link to the Shiny app](https://jperegadea.shinyapps.io/App1/)
   
---

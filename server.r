library(leaflet)
library(shiny)

shinyServer(
	function(input, output) {
	      output$plot <- renderLeaflet({
                  points <- data.frame(
                        lon = rnorm(input$num, mean = -4, sd = 1.75), 
                        lat = rnorm(input$num, mean = 40, sd = 1.75), 
                        results = sample(c("benefits", "losses"), input$num, replace = TRUE, prob=c(0.8,0.2)), 
                        volume = rnorm(input$num, 5000, 3000)  
                        )
			m = leaflet() %>% addTiles()
			m = m %>% setView(-3.5,40 , zoom = 6)
			m %>% addCircles(data = points, lng = ~ lon, lat = ~lat, radius = points$volume, 
				stroke = F, fill = TRUE, fillColor = c("red", "blue"), fillOpacity = 0.3)                 
                  }
		)
	}
)
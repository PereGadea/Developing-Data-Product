library(leaflet)
library(shiny)
library(markdown)

shinyUI(
	pageWithSidebar(
	      headerPanel("Distribution branches"),
      	sidebarPanel(
	      	numericInput("num", label=h3("number of branches"), 20, min=5, max = 100, step = 1), submitButton("Submit"),
	      	includeMarkdown("HelpText.md")
            ),
	      mainPanel(
	            leafletOutput("plot", height = 500, width = "100%")
		)
      )
)

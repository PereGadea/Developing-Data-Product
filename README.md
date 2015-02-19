# Developing-Data-Product
The project objective is to create an app with shiny, exploiting various options explained in the course.

In this case, I chose to use leaflet with shiny, after exploring options ggmap (generates a fixed map), GoogleVis (I could not apply different colors to categories) and plotGoogleMaps (the latter was satisfactory, but more complex and not explained in the course).

The app generates a simulation of random observations with 4 features: location defined by latitude and longitude, volume and results. 
The first 3 features follow a normal distribution with defined parameters, and last a binomial distribution.

the input under consideration is the number of observations and the ouput the map with the features.

The ideal app would have the option of uploading a file with actual data, and also assign more features (groups, temporal evolution etc ...), using dynamic graphics etc ...

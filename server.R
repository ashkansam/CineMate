library(shinybusy)
library(tidyverse)


server <- function(input, output) {
  
  observeEvent(input$searchButton, {
    if(nchar(input$query)<2) 
      return()
    
    output$searchResults <- DT::renderDataTable(DT::datatable({
      data <- movies[grep(input$query, movies$originalTitle, ignore.case=TRUE), ]
      data <- rbind(movies[grep(input$query, movies$primaryTitle, ignore.case=TRUE), ], data)
      data <- rbind(movies[grep(input$query, movies$startYear, ignore.case=TRUE), ], data)
      data <- rbind(movies[grep(input$query, movies$genres, ignore.case=TRUE), ], data)
      select(data,
             "Primary Title"=primaryTitle, 
             "Original Title"=originalTitle, 
             "Is Adult Movie"=isAdult,
             "Year"=startYear,
             "Duration Minutes"=runtimeMinutes,
             "Genres"=genres)
    }))
  })
  
  
  
  show_spinner()
  movies <- read.csv(file = 'data/Movie-Titles.csv')
  artists <- read.csv(file = 'data/Artist-Names.csv')
  dirsAndWrts <- read.csv(file = 'data/Movie-Directors-and-Writers.csv')
  ratings <- read.csv(file = 'data/Title-Ratings.csv')
  hide_spinner()
  print(head(movies))
  print(head(artists))
  print(head(dirsAndWrts))
  print(head(ratings))
  print('files read')
}

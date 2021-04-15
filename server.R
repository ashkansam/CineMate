library(shinybusy)
library(tidyverse)
library(sqldf)
library(ggplot2)

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
  
  output$moviesByYearPlot <- renderPlot({
    
    df <- sqldf(paste("SELECT COUNT(tconst) as count, startYear as year FROM movies 
                  WHERE startYear>=",input$yearSlider[1]," AND startYear<=",input$yearSlider[2]," GROUP BY startYear"));
    for (row in 1:nrow(df)) {
      df[row, "count"] <- as.numeric(df[row, "count"])
      df[row, "year"]  <- as.numeric(df[row, "year"])
    }
    ggplot(df, aes(x=count, y=year)) + geom_bar(stat="identity") + 
      labs(y="Year", x="Number of Movies")
    
  })
  
  show_spinner()
  movies <- read.csv(file = 'data/Movie-Titles.csv')
  
  hide_spinner()
  
}

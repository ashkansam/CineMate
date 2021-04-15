library(shinybusy)

server <- function(input, output) {
  
  observeEvent(input$searchButton, {
    output$value <- renderText({ input$query })
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

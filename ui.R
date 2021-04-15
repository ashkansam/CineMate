
library(shinydashboard)
library(shinythemes)
library(shinybusy)
library(DT)

function(request) {
  
  ##------------------------------1-Header------------------------------------
  header<-dashboardHeader(title ='CineMate',
    dropdownMenu(type = 'message',
                 messageItem(from = 'Ashkan Samavatian',
                             message = 'Welcome to CineMate',
                             icon = icon('smile'))
    )
  )
              
              
              ##--------------------------2-SideBar Panel---------------------------------
  sidebar<-dashboardSidebar(sidebarMenu(id = 'Menu',
                                           menuItem(tabName = 'Tab1','Home Page',
                                                    icon = icon('home')),
                                           
                                           menuItem(tabName = 'Tab2','Search Movies',
                                                    icon = icon('film')),
                                           
                                           menuItem(tabName = 'Tab3','Movies By Year',
                                                    icon = icon('chart-bar'))
                                           
              ))
              
              ##-------------------------------3-Body-------------------------------------
  body<-dashboardBody(
    use_busy_spinner(spin = "cube-grid", color = "#FFFFFF",position = c("bottom-left")),
         tabItems(tabItem(tabName = 'Tab1',h1('CineMate is your Cinema-mate!'),
                                          h2('Welcome to CineMate.'),
                                          h3('CineMate is here to make an easy
                                             and enjoyable experience of searching
                                             about movies, directors, writers, actors, etc.'),
                                          h3('Do you want to know important details about
                                             your favorite movies?'),
                                          h3('Do you want to know what others think about
                                             a specific movie?'),
                                          h3('What are you fascinated by in this magical world?'),
                                          h3('CineMate is ready to tell you everything!' ),
                                          img(src='1.jpg'),img(src='2.jpg')
                                      ),
                  tabItem(tabName = 'Tab2',
                     fluidPage(
                       div(style="display:inline-block;vertical-align:top;",
                           fluidRow(
                             column(8,textInput("query", "Search", placeholder = "Search by name, genres, year")),
                             column(4,br(),actionButton("searchButton", "Search"))
                           )
                        ),
                        DT::dataTableOutput("searchResults")
                     )),
             tabItem(tabName = 'Tab3',
                     fluidPage(
                       div(style="display:inline-block;vertical-align:top;",
                           fluidRow(
                             column(8,sliderInput("yearSlider", label = h3("Year Slider"), min = 1900,max = 2021, value = c(1990, 2021))),
                           )
                       ),
                       plotOutput("moviesByYearPlot")  
                     ))
    )
  )


  dashboardPage(
    skin = 'yellow',
    header,
    sidebar,
    body
  )

}
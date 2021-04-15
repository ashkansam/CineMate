
library(shinydashboard)
library(shinythemes)
library(shinybusy)

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
                                           
                                           menuItem(tabName = 'Tab3','Diagrams',
                                                    icon = icon('chart-bar'),
                                                    menuSubItem(tabName = 'Tab31',
                                                                'Rating Resulats',
                                                                icon = icon('poll-h')),
                                                    menuSubItem(tabName = 'Tab32',
                                                                'Number of Voting',
                                                                icon = icon('slack-hash'))),
                                           
                                           menuItem(tabName = 'Tab4','Artist Lovers',
                                                    icon = icon('grin-hearts'))
              ))
              
              ##-------------------------------3-Body-------------------------------------
  body<-dashboardBody(
    use_busy_spinner(spin = "cube-grid", color = "#FFFFFF",position = c("bottom-left")),
    tabItems(tabItem(tabName = 'Tab1', 
                     fluidPage(
                       tags$iframe(src = './home.html', 
                                  width = '100%', height = '800px', 
                                  frameborder = 0, scrolling = 'auto'
                       )
                     )),
             tabItem(tabName = 'Tab2',
                     fluidPage(
                       div(style="display:inline-block;vertical-align:top;",
                           fluidRow(
                             column(8,textInput("query", "Search", placeholder = "Search by name, genres, people, year")),
                             column(4,br(),actionButton("searchButton", "Search"))
                           )
                        ),
                        verbatimTextOutput("value")
                     )),
             tabItem(tabName = 'Tab31'),
             tabItem(tabName = 'Tab32'),
             tabItem(tabName = 'Tab4')
    )
  )


  dashboardPage(
    skin = 'yellow',
    header,
    sidebar,
    body
  )

}
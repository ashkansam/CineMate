#-----------------------------CineMate------------------------------------------
#This is the script of my shinyApp for the exam of R Module
#(Coding for Data Science and Data Management) with Professor Federica Nicolussi. 
#Ashkan Samavatian (Matriculation Number: 965235)
#ashkan.samavatian@studenti.unimi.it

library(shiny)
library(shinydashboard)
library(shinythemes)

ui = dashboardPage(skin = 'yellow',
    ##------------------------------1-Header------------------------------------
    dashboardHeader(title ='CineMate',
                    dropdownMenu(type = 'message',
                                 messageItem(from = 'Ashkan Samavatian',
                                             message = 
                                             'Welcome to CineMate',
                                             icon = icon('smile'))
                                 )
                    ),
    
    
    ##--------------------------2-SideBar Panel---------------------------------
    dashboardSidebar(sidebarMenu(id = 'Menu',
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
                                 )),
    
    ##-------------------------------3-Body-------------------------------------
    dashboardBody(
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
                 
                 tabItem(tabName = 'Tab2'),
                 tabItem(tabName = 'Tab31'),
                 tabItem(tabName = 'Tab32'),
                 tabItem(tabName = 'Tab4')))
    )




server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)

library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("The Birthday Paradox"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    p("If 50 people were in a room, what's the probability that 2 of them would share a birthday?"),
    p("Would you believe that it's 97%?"),
    p("This app will let you play with that probability by adjusting the number of birthdays (buckets) and people (objects) to find your own interesting results."),
    p("How many people would you have to have to have a greater than 50% chance of finding a shared birthday?"),
    p(""),
    p("The math behind this can be found on ",
        a('Wikipedia', href = 'http://en.wikipedia.org/wiki/Birthday_problem')),
    p(""),
    p("Enjoy!"),
    p(""),
    
    sliderInput("buckets", 
                "Number of buckets (such as days in a year):", 
                min = 1,
                max = 400, 
                value = 365),
    sliderInput("objects", 
                "Number of objects to place in those buckets (such as birthdays):", 
                min = 1,
                max = 400,
                value = 50),
    width = 8
  ),
  
  mainPanel(
    p("If there are"),
    h3(textOutput("buckets")),
    p("buckets and"),
    h3(textOutput("objects")),
    p("objects, then the probability of 2 of those objects sharing a bucket is"),
    h1(textOutput("p")),
    width = 4
  )
))

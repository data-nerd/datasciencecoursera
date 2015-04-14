library(shiny)

shinyServer(function(input, output) {
  
  prob <- reactive({
    # Initialize
    p <- 1
    
    # Iteratively calculate the probability rather than using formulas that
    # contain factorials of large numbers. Those factorials will overflow R's
    # default number system and leave us without an answer. Loops aren't great
    # but they're easy to read and write and, best of all, they give us the
    # answer we're looking for.
    for (i in 1 : input$objects - 1) {
      # Temporary factor for this iteration
      x <- 1 - (i / input$buckets)
      
      # Update the probability
      p <- p * x
    }
    
    # We've calculated the probability that no two people share a birthday, so take
    # the compliment to get the probability that two people -do- share a birthday.
    1 - p
  })

  output$buckets <- renderText({input$buckets})
  
  output$objects <- renderText({input$objects})
  
  output$p <- renderText({ sprintf("%.2f", prob()) })

})

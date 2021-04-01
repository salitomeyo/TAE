

library(shiny)

# Cargando el modelo


shinyServer(function(input, output) {
    
    output$Resultado <- renderText({
        print("Hola a todos")
        
        
    })
    
})
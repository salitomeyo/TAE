
library(shiny)


shinyUI(fluidPage(
    
    # Application title
    titlePanel("Número de hijos de los hogares  colombianos"),
    
    # Sidebar with a slider input 
    sidebarLayout(
        sidebarPanel(
            
            numericInput(inputId = "Num_integrantes",
                         label = "Ingrese el número de integrantes de su hogar",
                         value= "1",
                         step = 1,
                         min=1,
                         max =19),
            
            selectInput(inputId = "Estado_civil",
                        label = "¿Cuál es el estado civil del jefe del hogar?",
                        choices = c("No está casado(a) y vive en pareja hace menos de dos años",
                                    "No está casado(a) y vive en pareja hace dos años o más",
                                    "Está viudo(a)",
                                    "Está separado(a) o divorciado(a)",
                                    "Está soltero(a)",
                                    "Está casado(a)Está casado(a)"),
                        selected = c("No está casado(a) y vive en pareja hace menos de dos años")),
            
            radioButtons(inputId = "genero",
                         label = "Ingrese el género del jefe del hogar",
                         choices = c("Masculino", "Femenino"),
                         selected = c("Masculino")),
            
            numericInput(inputId = "Edad",
                         label = "Ingrese la edad del jefe del hogar",
                         value= "48",
                         step = 1,
                         min = 13,
                         max = 106),
            
            selectInput(inputId = "Vive_hogar_madre",
                        label = "¿La madre del jefe del hogar vive en el hogar?",
                        choices = c("Si", "No", "fallecida"),
                        selected = c("Si"))
            
        ),
            
            
            
        
        
        
        # Show a plot of the generated distribution
        mainPanel(
            textOutput("Resultado")
        )
        
    )
))

library(shiny)


shinyUI(fluidPage(
                  
    includeCSS("www/style.css"),

    # Titulo de la aplicación -------------------------------------------------
    
    tags$div(class = "jumbotron", 
             # tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
             
             tags$h1("Hola", style = "color:white")
            
    ),
    
    titlePanel("Número de hijos de los hogares  colombianos"),
    
    
    navlistPanel(widths = c(1, 11), 
    
    tabPanel("Home", icon = icon("child"),  
    # División de la página en dos --------------------------------------------

    sidebarLayout(
        

        # Lado Izquierdo ----------------------------------------------------------
        
        sidebarPanel(
            
            numericInput(inputId = "Num_integrantes",
                         label = "Ingrese el número de integrantes de su hogar",
                         value= 1,
                         step = 1,
                         min=1,
                         max =19),
            
            selectInput(inputId = "Genero",
                         label = "Ingrese el género del jefe del hogar",
                         choices = c("Masculino", "Femenino"),
                         selected = c("Femenino")),
            
            selectInput(inputId = "Vive_hogar_madre",
                        label = "¿La madre del jefe del hogar vive en el hogar?",
                        choices = c("Si", "No", "fallecida"),
                        selected = c("Si")),
            
            numericInput(inputId = "Edad",
                         label = "Ingrese la edad del jefe del hogar",
                         value= 48,
                         step = 1,
                         min = 13,
                         max = 106),
            
            selectInput(inputId = "Estado_civil",
                        label = "¿Cuál es el estado civil del jefe del hogar?",
                        choices = c("No está casado(a) y vive en pareja hace menos de dos años",
                                    "No está casado(a) y vive en pareja hace dos años o más",
                                    "Está viudo(a)",
                                    "Está separado(a) o divorciado(a)",
                                    "Está soltero(a)",
                                    "Está casado(a)"),
                        selected = c("No está casado(a) y vive en pareja hace menos de dos años"))
            
        ),

        # Lado derecho ----------------------------------------------------------
        
        mainPanel(
            tableOutput("df"),
            textOutput("Resultado")
        )
        
    )),
    
    tabPanel("Video", icon = icon("youtube")
    
    )
    
    )
))

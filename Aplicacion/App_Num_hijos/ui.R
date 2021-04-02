library(shiny)


shinyUI(fluidPage(
                  

    # Estilo css
    includeCSS("www/style.css"),
    # tags$head(
    # tags$style(HTML("body{
    # background-image: url( fondo_cyan.jpg );
    #                 }"))),

    # Titulo de la aplicación -------------------------------------------------
    
    tags$div(class = "jumbotron", 
             # tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
             
             tags$h1("Hola", style = "color:white")
            
    ),
    

    # Panel de navegación -----------------------------------------------------
    
    tabsetPanel(
        

        # Panel de inicio ---------------------------------------------------------
        
        tabPanel("Home", icon = icon("child"),
                 
                 
                 

            # División de la página verticalmente -------------------------------------
            
            verticalLayout(
                
                titlePanel("Número de hijos de los hogares  colombianos"),
                
                # Predicción ----------------------------------------------------------
                
            
                tableOutput("df"),
                textOutput("Resultado"),
                
                
                
                
                # Cuestionario ----------------------------------------------------------
                
                fluidRow(
                    
                    column(width = 2,
                        tags$img(src = "Num_integrantes.png",  height=50, width=80),
                          
                        numericInput(inputId = "Num_integrantes",
                                     label = "Ingrese el número de integrantes de su hogar",
                                     value= 1,
                                     step = 1,
                                     min=1,
                                     max =19),
                    ),
                    
                    column(width = 2,
                        selectInput(inputId = "Genero",
                                     label = "Ingrese el género del jefe del hogar",
                                     choices = c("Masculino", "Femenino"),
                                     selected = c("Femenino")),
                    ),
                    
                    column(width = 2,
                        numericInput(inputId = "Edad",
                                     label = "Ingrese la edad del jefe del hogar",
                                     value= 48,
                                     step = 1,
                                     min = 13,
                                     max = 106),
                    ),
                    
                    column(width = 2,
                        selectInput(inputId = "Vive_hogar_madre",
                                    label = "¿La madre del jefe del hogar vive en el hogar?",
                                    choices = c("Si", "No", "fallecida"),
                                    selected = c("Si")),
                    ),
                    
                    column(width = 3,
                        selectInput(inputId = "Estado_civil",
                                    label = "¿Cuál es el estado civil del jefe del hogar?",
                                    choices = c("No está casado(a) y vive en pareja hace menos de dos años",
                                                "No está casado(a) y vive en pareja hace dos años o más",
                                                "Está viudo(a)",
                                                "Está separado(a) o divorciado(a)",
                                                "Está soltero(a)",
                                                "Está casado(a)"),
                                    selected = c("No está casado(a) y vive en pareja hace menos de dos años"))
                    )
                )
                
            )
        ),
        
        tabPanel("Video", icon = icon("youtube")
        
        )
    
    )
))

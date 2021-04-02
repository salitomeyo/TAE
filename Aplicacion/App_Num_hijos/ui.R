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
                
                titlePanel(
                    "Número de hijos de los hogares  colombianos"
                ),
                
                # Predicción ----------------------------------------------------------
                
            
                tableOutput("df"),
                textOutput("Resultado"),
                br(),
                br(),
                hr(),
                
                # Cuestionario ----------------------------------------------------------
                
                fluidRow(
                    
                    column(width = 2,
                        tags$img(src = "Num_integrantes.png",  height=80, width=80, align = "center"),
                        
                        tags$h5("Ingrese el número de integrantes de su hogar"),
                        
                        hr(),
                        
                        numericInput(inputId = "Num_integrantes",
                                     label = "",
                                     value= 1,
                                     step = 1,
                                     min=1,
                                     max =19),
                    ),
                    
                    column(width = 2,
                           
                        tags$img(src = "Cumple.jpg",  height=80, width=80, align = "center"),
                           
                        tags$h5("Ingrese el género del jefe del hogar              "),
                        
                        hr(),

                        selectInput(inputId = "Genero",
                                     label = "",
                                     choices = c("Masculino", "Femenino"),
                                     selected = c("Femenino")),
                    ),
                    
                    column(width = 2,
                           
                        tags$img(src = "Cumple.jpg",  height=80, width=80, align = "center"),
                        
                        tags$h5("Ingrese el género del jefe del hogar"),
                        br(),
                        
                        hr(),
                        
                        numericInput(inputId = "Edad",
                                     label = "",
                                     value= 48,
                                     step = 1,
                                     min = 13,
                                     max = 106),
                    ),
                    
                    column(width = 2,
                        
                       tags$img(src = "Cumple.jpg",  height=80, width=80, align = "center"),
                       
                       tags$h5("¿La madre del jefe del hogar vive en el hogar?"),  
                       
                       hr(),
                        
                        selectInput(inputId = "Vive_hogar_madre",
                                    label = "",
                                    choices = c("Si", "No", "fallecida"),
                                    selected = c("Si")),
                    ),
                    
                    column(width = 3,
                           
                       tags$img(src = "Cumple.jpg",  height=80, width=80, align = "center"),
                       
                       tags$h5("¿Cuál es el estado civil del jefe del hogar?"),
                       
                       hr(),
                           
                        selectInput(inputId = "Estado_civil",
                                    label = "",
                                    choices = c("No está casado(a) y vive en pareja hace menos de dos años",
                                                "No está casado(a) y vive en pareja hace dos años o más",
                                                "Está viudo(a)",
                                                "Está separado(a) o divorciado(a)",
                                                "Está soltero(a)",
                                                "Está casado(a)"),
                                    selected = c("No está casado(a) y vive en pareja hace menos de dos años"))
                    )
                ),
                
                
                submitButton("Obtener predicción", icon = icon("chart-line"), width = '30%')
                
            )
        ),
        
        tabPanel("Video", icon = icon("youtube")
        
        )
    
    )
))

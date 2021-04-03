library(shiny)
library(shinythemes)

shinyUI(fluidPage(
                  

    # Estilo css
    includeCSS("www/style.css"),
    
    tags$div (class="slider",
        tags$ul(
            tags$li(
                tags$img (src="Celular.jpg", alt=""),
            ),
            tags$li(
                tags$img (src="empresa_credito.jpg", alt=""),
            ),
            tags$li(
                tags$img (src="inmobiliaria.jpg", alt=""),
            ),
        ),
    ),

    
    tags$div(class="informacion",
    
        # Panel de navegación -----------------------------------------------------
        tabsetPanel(
            
            tabPanel("Home"
                     
                     ),
            
            # Panel de inicio ---------------------------------------------------------
            tabPanel("App", icon = icon("child"),
                     
                   
                # División de la página verticalmente -------------------------------------
                verticalLayout(
                    
                    titlePanel(
                        "Número de hijos de los hogares  colombianos"
                    ),
                    
                    # Predicción ----------------------------------------------------------
                    
                    
                    br(),
                    br(),
                    hr(),
                    
                    # Cuestionario ----------------------------------------------------------
                    
                    tags$div(class="row row-cols-5",
                        tags$div(class="col",
                                 tags$img(src= "Num_integrantes.png",class="imagen"),
                                 
                                 tags$h5("Ingrese el número de integrantes de su hogar"),
                                 
                                 hr(),
                                 
                                 numericInput(inputId = "Num_integrantes",
                                              label = "",
                                              value= 1,
                                              step = 1,
                                              min=1,
                                              max =19),
                        ),
                        tags$div(class="col",
                                 tags$img(src = "genero.png",class="imagen"),
                                 
                                 tags$h5("Ingrese el género del jefe del hogar"),
                                 
                                 hr(),
                                 
                                 selectInput(inputId = "Genero",
                                             label = "",
                                             choices = c("Masculino", "Femenino"),
                                             selected = c("Femenino")), 
                        ),
                        tags$div(class="col",
                                 tags$img(src = "Cumple.png", class="imagen"),
                                 
                                 tags$h5("Ingrese la edad del jefe del hogar"),
                                 
                                 hr(),
                                 
                                 numericInput(inputId = "Edad",
                                              label = "",
                                              value= 48,
                                              step = 1,
                                              min = 13,
                                              max = 106),
                        ),
                        tags$div(class="col",
                                 tags$img(src = "vive_madre_hogar.png",class="imagen"),
                                 
                                 tags$h5("¿La madre del jefe del hogar vive en el hogar?"),  
                                 
                                 hr(),
                                 
                                 selectInput(inputId = "Vive_hogar_madre",
                                             label = "",
                                             choices = c("Si", "No", "fallecida"),
                                             selected = c("Si")), 
                        ),
                        tags$div(class="col",
                                 tags$img(src = "Estado_civil.png", class="imagen"),
                                 
                                 tags$h5("¿Cuál es el estado civil del jefe del hogar"),
                                 
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
                    
                    
                    tags$button(type="submit", class="btn btn-info", "Obtener predicción"),
                    hr(),
                    br(),
                    tags$h1(textOutput("Resultado"))
                    
                )
            ),
            
            tabPanel("Video", icon = icon("youtube")
            
            )
        
        )
    )
))

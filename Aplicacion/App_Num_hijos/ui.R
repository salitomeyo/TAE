library(shiny)
library(shinythemes)

shinyUI(fluidPage(

    # Estilo css
    includeCSS("www/style.css"),
    
    # Titulo de la aplicación -------------------------------------------------
    tags$div(class = "jumbo", 
             tags$h1("Número de hijos de los hogares colombianos", style = "color:white")
             
    ),
    
    # tags$div (class="slider",
    #     tags$ul(
    #         tags$li(
    #             tags$img (src="Celular.jpg", alt=""),
    #         ),
    #         tags$li(
    #             tags$img (src="empresa_credito.jpg", alt=""),
    #         ),
    #         tags$li(
    #             tags$img (src="inmobiliaria.jpg", alt=""),
    #         ),
    #     ),
    # ),

    
    tags$div(class="informacion",
    
        # Panel de navegación -----------------------------------------------------
        tabsetPanel(
            

            # Panel de inicio ---------------------------------------------------------
            tabPanel("Home", icon = icon("home"),
                     
                     br(),
                     br(),
                     
                     
                     tags$h1('¡Bienvenido, usuario!'),
                     
                     tags$p('Esta aplicación está diseñada para que usted ingrese los 
                     datos del hogar al cual pertenece o del cual desea adquirir 
                     información, la información requerida está enfocada principalmente
                     en el jefe de la misma, los datos que administrara no son íntimos 
                     o con los cuales se pueda sentir incomodo, además de que es poca 
                     la información que proporcionara para tener la oportunidad de 
                     obtener una predicción del número de hijos del hogar del cual 
                     proporciono la información.'),
                     
                     tags$p('Le damos gracias por hacer uso de aplicación y esperamos que la 
                     aplicación haya sido de su agrado y pueda usarla de manera 
                     responsable y haga uso adecuado de la información que aquí 
                     se le brinde.'),
                     
                     tags$p('La aplicación que ha tenido la oportunidad de acceder, está 
                     basada en un modelo de predicción Random Forest es cual fue 
                     entrenado con un conjunto de datos de las encuestas de calidad 
                     de vida del año 2019 en el país de Colombia, el cual tienen 
                     exhaustiva información de todas las características de los 
                     hogares y en las cuales se tuvo la oportunidad de escoger como 
                     más importantes las que son pedidas en la misma aplicación.'),
                     
                     
                     br(),
                     br(),
                     hr(),
                     
                     tags$h2('Información acerca de los investigadores encargados 
                     del ajuste del modelo de predicción y creación de la aplicación'),
                     
                     br(),
                     br(),
                     br(),
                     
                     tags$img(src= "Cumple.png",class="imagen"),
                     tags$h5("Cristina Mercedes Ortega Benavides"),
                     tags$h5("Estudiante de Estadística"),
                     
                     
                     tags$img(src= "Cumple.png",class="imagen"),
                     tags$h5("Miguel Angel Londoño Ciceros"),
                     tags$h5("Estudiante de Estadística"),
                     
                     tags$img(src= "Cumple.png",class="imagen"),
                     tags$h5("Jennifer Salazar Galvis"),
                     tags$h5("Estudiante de Estadística"),
                     
                     tags$img(src= "Cumple.png",class="imagen"),
                     tags$h5("Juan Esteban Sanchez Pulgarin"),
                     tags$h5("Estudiante de Estadística"),
                     
                     
                     tags$img(src= "Cumple.png",class="imagen"),
                     tags$h5("Salome Aristizabal Giraldo"),
                     tags$h5("Estudiante de Ingenieria de Sistemas")
                     
                     
                     ),
            
            # Panel de la app  ---------------------------------------------------------
            tabPanel("App", icon = icon("child"),
                     
                   
                # División de la página verticalmente -------------------------------------
                verticalLayout(
                    
                    # titlePanel(
                    #     "Número de hijos de los hogares colombianos"
                    # ),
                    

                    # Predicción panel condicional --------------------------------------------
                    
                    conditionalPanel(
                        condition = "input.Num_integrantes != '0' && 
                                     input.Genero != ' ' && 
                                     input.Edad > 12 && 
                                     input.Estado_civil != ' ' &&
                                     input.Vive_hogar_madre != ' '",
                                     
                                     br(),
                                     uiOutput(outputId = "silueta"),
                                     tags$h1(textOutput("Resultado")),
                                     hr()
                    ),
                    # Cuestionario ----------------------------------------------------------
                    
                    br(),
                    br(),
                    br(),
                    
                    tags$div(class="row row-cols-5",
                        tags$div(class="col",
                                 tags$img(src= "Num_integrantes.png",class="imagen"),
                                 
                                 tags$h5("Ingrese el número de integrantes de su hogar"),
                                 
                                 hr(),
                                 
                                 numericInput(inputId = "Num_integrantes",
                                              label = "",
                                              value= 0,
                                              step = 1,
                                              min= 0,
                                              max =19),
                        ),
                        tags$div(class="col",
                                 tags$img(src = "genero.png",class="imagen"),
                                 
                                 tags$h5("Ingrese el género del jefe del hogar"),
                                 
                                 hr(),
                                 
                                 selectInput(inputId = "Genero",
                                             label = "",
                                             choices = c(" ", "Masculino", "Femenino"),
                                             selected = c(" ")), 
                        ),
                        tags$div(class="col",
                                 tags$img(src = "Cumple.png", class="imagen"),
                                 
                                 tags$h5("Ingrese la edad del jefe del hogar"),
                                 
                                 hr(),
                                 
                                 numericInput(inputId = "Edad",
                                              label = "",
                                              value = 0,
                                              step = 1,
                                              min = 0,
                                              max = 106),
                        ),
                        tags$div(class="col",
                                 tags$img(src = "vive_madre_hogar.png",class="imagen"),
                                 
                                 tags$h5("¿La madre del jefe del hogar vive en el hogar?"),  
                                 
                                 hr(),
                                 
                                 selectInput(inputId = "Vive_hogar_madre",
                                             label = "",
                                             choices = c(" ", "Si", "No", "fallecida"),
                                             selected = c(" ")), 
                        ),
                        tags$div(class="col",
                                 tags$img(src = "Estado_civil.png", class="imagen"),
                                 
                                 tags$h5("¿Cuál es el estado civil del jefe del hogar"),
                                 
                                 hr(),
                                 
                                 selectInput(inputId = "Estado_civil",
                                             label = "",
                                             choices = c(" ",
                                                         "No está casado(a) y vive en pareja hace menos de dos años",
                                                         "No está casado(a) y vive en pareja hace dos años o más",
                                                         "Está viudo(a)",
                                                         "Está separado(a) o divorciado(a)",
                                                         "Está soltero(a)",
                                                         "Está casado(a)"),
                                             selected = c(" "))
                        )
                    ),
                    
                    # Botón Predicción ----------------------------------------------------------
                    conditionalPanel(
                        condition = "input.Num_integrantes != '0' && 
                                     input.Genero != ' ' && 
                                     input.Edad > 12 && 
                                     input.Estado_civil != ' ' &&
                                     input.Vive_hogar_madre != ' '",
                        
                                     br(), 
                                     actionButton(inputId = "submit", "Obtener predicción"),
                                     br()
                    )
                    # actionButton(inputId = "submit", "Obtener predicción"),
                    # tags$button(type="submit", class="btn btn-info", "Obtener predicción"),
                    
                )
            ),
            

            # Panel de video ----------------------------------------------------------
            tabPanel("Video", icon = icon("youtube")
            
            )
        
        )
    )
))

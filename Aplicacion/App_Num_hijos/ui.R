library(shiny)
library(shinythemes)
library(shinyjs)

shinyUI(fluidPage(
  # shinyjs
  useShinyjs(),
  
  # Estilo css
  includeCSS("www/style.css"),
  
  # Ventana emergente de cargando... ----------------------------------------
  tags$div(
      id = "loading-content",
      tags$h1("Cargando...", class = "cargando"),
      class = "jumbotron"
  ),
  
  # Contenido oculto por la ventana emergente
  hidden(
  
  tags$div(
    id = "app-content",
    
    
  # Panel emergente de inicio ----------------------------------------------
  
  conditionalPanel(condition = "input.app == 0",
                   
                   wellPanel(
                     
                     tags$div(class="row",
                              tags$div(class="gris col-6",
                                       tags$img(class="logologin", src="logo.png"),
                                       tags$h1(class="nombre", "Prediciendo el número de hijos"),
                              ),
                              
                              tags$div(class="cyan col-6",
                                       tags$h1(class="negro","Bienvenido"),
                                       
                                       tags$p(class="negro",'Le damos gracias por hacer uso de esta aplicación, esperamos que esta sea de su agrado y haga un uso adecuado de la información que aquí se le brinde.'), 
                                       
                                       tags$h5(class="negro","Seleccione su tipo de usuario:  "),
                                       
                                       tags$div(class="loginform",
                                                selectInput(inputId = "usuario",
                                                            label = "",
                                                            choices = c("Inmobiliaria", "Empresa crediticia", "Usuario natural"),
                                                            selected = c("Inmobiliaria")),
                                                
                                                actionButton(class="loginbutton",inputId = "app", "Continuar"),
                                       )
                              ),
                     ),
                   ),
  ),
  
  
  
  # Panel de la App ---------------------------------------------------------
  
  conditionalPanel(condition = "input.app != 0",
                   
                   # Titulo de la aplicación -------------------------------------------------
                   
                   htmlOutput(outputId = "header"),
                   
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
                              
                              # Panel de la app  ---------------------------------------------------------
                              tabPanel("App", icon = icon("child"),
                                       
                                       
                                       # División de la página verticalmente -------------------------------------
                                       verticalLayout(
                                         
                                         titlePanel(
                                          
                                           tags$h2(class="body", "Complete el formulario con la información de un hogar para obtener la predicción sobre el número de hijos")
                                           
                                         ),
                                         
                                         
                                         # Predicción panel condicional --------------------------------------------
                                         
                                         conditionalPanel(
                                           condition = "input.submit != 0 && output.error == ''",

                                           tags$div(id="resultado"),
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
                                                           tags$img(src= "Num_integrantes.png",class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"),
                                                           
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
                                                           tags$img(src = "genero.png",class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"),
                                                           
                                                           tags$h5("Ingrese el género del jefe del hogar"),
                                                           
                                                           hr(),
                                                           
                                                           selectInput(inputId = "Genero",
                                                                       label = "",
                                                                       choices = c(" ", "Masculino", "Femenino"),
                                                                       selected = c(" ")), 
                                                  ),
                                                  tags$div(class="col",
                                                           tags$img(src = "Cumple.png", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"),
                                                           
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
                                                           tags$img(src = "vive_madre_hogar.png",class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"),
                                                           
                                                           tags$h5("¿La madre del jefe del hogar vive en el hogar?"),  
                                                           
                                                           hr(),
                                                           
                                                           selectInput(inputId = "Vive_hogar_madre",
                                                                       label = "",
                                                                       choices = c(" ", "Si", "No", "fallecida"),
                                                                       selected = c(" ")), 
                                                  ),
                                                  tags$div(class="col",
                                                           tags$img(src = "Estado_civil.png", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"),
                                                           
                                                           tags$h5("¿Cuál es el estado civil del jefe del hogar?"),
                                                           
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
                                           condition = "input.Num_integrantes >= 1 && 
                                     input.Num_integrantes <= 10000 &&
                                     input.Genero != ' ' && 
                                     input.Edad >= 1 && 
                                     input.Edad <= 10000 &&
                                     input.Estado_civil != ' ' &&
                                     input.Vive_hogar_madre != ' '",
                                           br(), 
                                           actionButton(inputId = "submit",  label = HTML("<a href='#resultado' class='button resultado'>obtener prediccion</a>")),
                                           br(),
                                           br(),
                                           tags$h5(textOutput(outputId = "error"))
                                         ),
                                         tags$div(class="rectangle")
                                       )
                              ),
                              
                              # Panel de video ----------------------------------------------------------
                              tabPanel("Video", icon = icon("youtube")
                                       
                              ),
                              
                              # Panel sobre nosotrso ---------------------------------------------------------
                              tabPanel("Sobre nosotros", icon = icon("user-edit"),
                                       
                                       tags$h1('Acerca de la aplicación'),
                                       
                                       tags$p('Esta aplicación permite obtener con facilidad una predicción 
                                              para el número de hijos de un hogar colombiano, 
                                              a partir de conocer las siguientes cinco características sobre el hogar:'),
                                              
                                       tags$p("•	El número de integrantes del hogar", br(),
                                              "•	El genero del jefe de hogar", br(),
                                              "•	La edad del jefe de hogar", br(),
                                              "•	El estado civil del jefe de hogar", br(),
                                              "•	Y si vive en el hogar la madre del jefe de hogar"),
                                       
                                       tags$p("Los datos que administrara no son íntimos o con los cuales se pueda 
                                              sentir incomodo, además de que es poca la información que proporcionara 
                                              para obtener una predicción del número de hijos 
                                              del hogar del cual proporcionó la información."),
                                              
                                        tags$p(
                                        
                                        "Para usarla vaya a el panel", tags$i(class="fa fa-child"),
                                        "App y complete el formulario, cuando todos los campos 
                                        tengan un valor valido se habilitará un botón que le 
                                        mostrará la predicción correspondiente."),
                                        
                                       
                                       tags$p("Las predicciones sobre el número de hijos son dadas por un modelo de
                                              Random Forest el cual fue entrenado sobre un conjunto de datos de la", 
                                              tags$a(href = "http://microdatos.dane.gov.co/index.php/catalog/678/study-description#page=overview&tab=study-desc" , class = "enlace-texto",
                                                      "encuesta de calidad de vida del DANE en el año 2019"),
                                              "en el país de Colombia, y que obtuvo una tasa de acierto del 86% sobre
                                              los datos que se usaron para su validación, los detalles sobre como se llegó 
                                              a este modelo pueden ser consultados en este informe."),
                                       
                                       
                                       hr(),
                                       
                                       tags$h2('Más información'),
                                       
                                       tags$p("Esta aplicación shiny fue creada para el curso Técnicas en aprendizaje estadístico semestre 2021-1
                                              de la Universidad nacional de Colombia sede Medellín por: "),
                                       
                                       tags$div(class="row row-cols-5",
                                                tags$div (class="col co-creator",
                                                          tags$div (class="gris rounded shadow-sm py-5 px-4",
                                                                    tags$img (src="cristina.jpg", alt="", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm",
                                                                              tags$h5 (class="mb-0", "Cristina Mercedes Ortega Benavides"),
                                                                              tags$span (class="small text-uppercase text-muted", "Estudiante de Estadistica"),
                                                                              tags$ul (class="social mb-0 list-inline mt-3",
                                                                                       tags$li (class="list-inline-item",
                                                                                                tags$a (href="https://www.linkedin.com/in/cristina-mercedes-ortega-benavides-0230bb20b/",class="social-link",
                                                                                                        tags$i (class="fa fa-linkedin")
                                                                                                )
                                                                                       )
                                                                              )
                                                                    )
                                                          )
                                                ),
                                                tags$div (class="col co-creator",
                                                          tags$div (class="gris rounded shadow-sm py-5 px-4",
                                                                    tags$img (src="miguel.jpg", alt="", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm",
                                                                              tags$h5 (class="mb-0", "Miguel Angel Londoño Ciceros"),
                                                                              tags$span (class="small text-uppercase text-muted", "Estudiante de Estadistica"),
                                                                              tags$ul (class="social mb-0 list-inline mt-3",
                                                                                       tags$li (class="list-inline-item",
                                                                                                tags$a (href="https://www.linkedin.com/in/miguel-londo%C3%B1o-374b48201/",class="social-link",
                                                                                                        tags$i (class="fa fa-linkedin")
                                                                                                )
                                                                                       )
                                                                              )
                                                                    )
                                                          )
                                                ),
                                                tags$div (class="col co-creator",
                                                          tags$div (class="gris rounded shadow-sm py-5 px-4",
                                                                    tags$img (src="jennifer.jpg", alt="", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm",
                                                                              tags$h5 (class="mb-0", "Jennifer Salazar Galvis"),
                                                                              tags$span (class="small text-uppercase text-muted", "Estudiante de Estadistica"),
                                                                              tags$ul (class="social mb-0 list-inline mt-3",
                                                                                       tags$li (class="list-inline-item",
                                                                                                tags$a (href="https://www.linkedin.com/in/jennifer-salazar-galvis-82a231202/",class="social-link",
                                                                                                        tags$i (class="fa fa-linkedin")
                                                                                                )
                                                                                       )
                                                                              )
                                                                    )
                                                          )
                                                ),
                                                tags$div (class="col co-creator",
                                                          tags$div (class="gris rounded shadow-sm py-5 px-4",
                                                                    tags$img (src="juanes.jpg", alt="", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm",
                                                                              tags$h5 (class="mb-0", "Juan Esteban Sanchez Pulgarin"),
                                                                              tags$span (class="small text-uppercase text-muted", "Estudiante de Estadistica"),
                                                                              tags$ul (class="social mb-0 list-inline mt-3",
                                                                                       tags$li (class="list-inline-item",
                                                                                                tags$a (href="https://www.linkedin.com/in/juan-esteban-sanchez-pulgarin-b39291172/",class="social-link",
                                                                                                        tags$i (class="fa fa-linkedin")
                                                                                                )
                                                                                       )
                                                                              )
                                                                    )
                                                          )
                                                ),
                                                tags$div (class="col co-creator",
                                                          tags$div (class="gris rounded shadow-sm py-5 px-4",
                                                                    tags$img (src="salome.jpg", alt="", class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm",
                                                                              tags$h5 (class="mb-0", "Salome Aristizabal Giraldo"),
                                                                              tags$span (class="small text-uppercase text-muted", "Estudiante de Ingenieria de Sistemas e Informatica"),
                                                                              tags$ul (class="social mb-0 list-inline mt-3",
                                                                                       tags$li (class="list-inline-item",
                                                                                                tags$a (href="https://www.linkedin.com/in/salome-aristizabal-giraldo-7546441bb/",class="social-link",
                                                                                                        tags$i (class="fa fa-linkedin")
                                                                                                )
                                                                                       )
                                                                              )
                                                                    )
                                                          )
                                                ),
                                       )
                              )
                              
                            )
                   )#div class = "information"
  ) #Conditional panel
  )) #div class = "app-content" #Hidden
))

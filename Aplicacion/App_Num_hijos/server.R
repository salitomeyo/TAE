library(shiny)
require(ranger) 

# Cargamos el modelo RF ---------------------------------------------------

load("RandomForest.Rdata")


# Pasos iniciales ---------------------------------------------------------

# Nombre de las varaibles
var_names <-  c("Num_integrantes",  
                "Estado_civil", 
                "Genero", 
                "Edad",
                "Vive_hogar_madre")

# Categorias de las varaibles factor

genero <- c("Masculino", "Femenino")
vive_madre <- c("Si", "No", "fallecida")
E_civil <-  c("No está casado(a) y vive en pareja hace menos de dos años",
    "No está casado(a) y vive en pareja hace dos años o más",
    "Está viudo(a)",
    "Está separado(a) o divorciado(a)",
    "Está soltero(a)",
    "Está casado(a)")

# Server de la aplicación -------------------------------------------------

shinyServer(function(input, output) {
    

    # Cambio de fondo según el usuario ----------------------------------------
    
    observeEvent(input$usuario, {
        
        output$header <- renderUI({
            
            if(input$usuario == "Inmobiliaria"){
                
                tags$div(class = "jumbo1",
                         tags$h1("Número de hijos de los hogares colombianos", style = "color:white")
                         
                )
                
            }else if(input$usuario == "Empresa crediticia"){
                
                tags$div(class = "jumbo2",
                         tags$h1("Número de hijos de los hogares colombianos", style = "color:white")
                         
                )
                
            }else if(input$usuario == "Usuario natural"){
                
                tags$div(class = "jumbo3",
                         tags$h1("Número de hijos de los hogares colombianos", style = "color:white")
                         
                )
                
            }

            
        })

    })

    # Server para la predicción del numero de hijos ---------------------------
    
    observeEvent(input$submit, {
        
        # Variables categoricas a números -----------------------------------------
        
        GENERO <-  which(genero %in% input$Genero)
        ESTADO_CIVIL <- which(E_civil %in% input$Estado_civil)
        VIVE_HOGAR_MADRE <- which(vive_madre %in% input$Vive_hogar_madre)
        
        
        # Variables discretas -----------------------------------------------------
        
        NUM_INTEGRANTES <- input$Num_integrantes
        EDAD <- input$Edad
        
        
        # Creación dataframe para la predicción ------------------------------------------------------
        
        datos_entrada <- cbind(NUM_INTEGRANTES, ESTADO_CIVIL, GENERO, EDAD, VIVE_HOGAR_MADRE)
        datos_entrada <- as.data.frame(datos_entrada)
        colnames(datos_entrada) <- var_names
        
        # Predicción con el modelo RF ---------------------------------------------
        
        prediccion <- predict(RandomForest, datos_entrada)
        
        prediccion <- prediccion$predictions
        
        # Se carga la silueta correspondiente
        nom_silueta <- paste(prediccion, 'svg', sep = ".")
        
        
        if(prediccion == 5){
            prediccion <- "5 o más"
        }

        # Se imprime la predicción ------------------------------------------------
        
        output$Resultado <- renderText({
            paste("El número de hijos del hogar es: ", prediccion)
        })
        
        
        # Se imprime la silueta ---------------------------------------------------
        
        output$silueta <- renderUI({
            tags$img(src = nom_silueta)
        })
        
    })
    
})
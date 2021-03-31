#Librerias
require(ranger)
require(tidyverse)

# Cargando la base de datos
load("Base_modelar.RData")


# Organización de la variable respuesta


Base_modelo <- Base_modelar
Base_modelo$Num_hijos[Base_de_ensayo$Num_hijos >= 5] <- 5

# Variable finales
var_imprt <-  c(
  "Num_integrantes",
  "Estado_civil",
  "Genero",
  "Edad",
  "Vive_hogar_madre",
  "Num_hijos"
)


# Se seleccionan solo las variables importantes 
# Variable respuesta se convierte a factor
Base_modelo <-Base_modelo[,var_imprt]
Base_modelo$Num_hijos <- as.factor(Base_modelo_f$Num_hijos) 



# Ajuste del modelo final


RandomForest <- ranger(Num_hijos~.,  data = Base_modelo,   num.trees = 100,  mtry = 5, 
             max.depth = 8,  importance = 'impurity')



save(RandomForest, file="RandomForest.Rdata")

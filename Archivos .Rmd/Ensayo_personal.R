
Miguel <- c(3, 6, 1, 52, 2)
Jennifer <- c(4, 2, 2, 43, 3)
Juan <- c(4, 6, 1, 59, 2)
Cristina <- c(3, 2, 2, 50, 2)


df <- rbind(Miguel, Jennifer, Juan, Cristina)
df <- data.frame(df)
colnames(df) <- c("Num_integrantes",  
                  "Estado_civil", 
                  "Genero", 
                  "Edad",
                  "Vive_hogar_madre")


load("RandomForest.Rdata")
#modeloRF=readRDS("modeloRF.rds")

prediccion <- predict(RandomForest, df)
prediccion$predictions


prediccion2 <- predict(modeloRF, df)
prediccion2$predictions

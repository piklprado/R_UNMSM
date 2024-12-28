## Pacotes
##library(tidyverse)
library(readxl)
##library(janitor)

## Data Prep ##
## Data from
## Ohyama, L., Holt, R. D., Matthews, T. J., & Lucky, A. (2021). The species–area relationship in ant ecology. Journal of Biogeography,  48(8), 1824-1841.

## Leitura de dados, dados tabulares
write.csv(read_xlsx("data/jbi14149-sup-0003-appendixs3.xlsx"), file = "islas.csv", row.names = FALSE)
write.csv(read_xlsx("data/jbi14149-sup-0002-appendixs2.xlsx")[,-10],file = "archipielagos.csv", row.names = FALSE)


################################################################################

islas.raw <- read.csv("islas.csv")
archipielagos.raw <- read.csv("archipielagos.csv")

summary(islas.raw)
summary(archipielagos.raw)


islas.nombres <- names(islas.raw)
islas.nombres.2 <- gsub("_", ".", tolower(islas.nombres), fixed = TRUE)
islas <- islas.raw
names(islas) <- islas.nombres.2
    
archipielagos.nombres <- names(archipielagos.raw)
archipielagos.nombres.2 <- gsub("_", ".", tolower(archipielagos.nombres), fixed = TRUE)
archipielagos <- archipielagos.raw
names(archipielagos) <- archipielagos.nombres.2

summary(islas)
summary(archipielagos)

## Logs
islas$island.area.log<- log(islas$island.area)
islas$species.richness.log <- log(islas$species.richness)

## Convierte en factores
islas$sar.type <- factor(islas$sar.type)
islas$island.type <- factor(islas$island.type, levels = c("Oceanic", "Continental", "Habitat-patches"))
archipielagos$sar.type <- factor(archipielagos$sar.type)
archipielagos$ecoregion <- factor(archipielagos$ecoregion)
archipielagos$island.type <- factor(archipielagos$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-patches"))

## Aggregate
aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = islas )  

## Islas con suficientes datos
## table, coerção
arch.N <- as.data.frame(table(islas$study.id))
## manipulacao de nomes
names(arch.N) <- c("study.id", "n.muestra")

## Archipelagos con por lo menos 6 islas
## Teste logico, classe logica
N.6 <- arch.N$n.muestra > 6
## Numero
sum(N.6)
## Filtra por logico
## nombres de los arch
arch.ids <- arch.N$study.id[N.6]

## Selecao
## Selección por indexación de las islas de los archipielagos con N>6
islas.sel <- islas[islas$study.id %in% arch.ids, ]
## Lo mismo para los archipielagos
arch.sel <- archipielagos[archipielagos$study.id %in% arch.ids,]


## graficas
plot(species.richness ~ island.area, data = islas.sel)
plot(species.richness ~ island.area, data = islas.sel, log ="xy")
## subset
plot(species.richness ~ island.area, data = islas.sel,
     subset=study.id=="1", log = "xy")

## Con index y titulo del gráfico
plot(species.richness.log ~ island.area.log,
     data = islas.sel,
     subset=study.id == arch.ids[1],
     main = archipielagos$study.location[archipielagos$study.id==arch.ids[1]])

## programacao
## un bucle para todos los gráficos
par(mfrow = c(5,5))
for(i in 1:length(islas.ids)){
    plot(species.richness.log ~ island.area.log,
         data = islas.sel,
         subset = study.id == islas.ids[i],
         main = archipielagos$study.location[archipielagos$study.id==arch.ids[i]])
}
par(mfrow=c(1,1))

## Regressao
## Regresión lineal para el primero archipiélago
arch1.lm <- lm(species.richness.log ~ island.area.log,
         data = islas.sel,
         subset = study.id == arch.ids[1])

## Resumen del ajuste
summary(arch1.lm)
## Explorando el objeto de resumen
arch1.lm.res <- summary(arch1.lm)
arch1.lm.res$coefficients
arch1.lm.res$coefficients[,1]
coef(arch1.lm)
arch1.lm.res$coefficients[,"Estimate"]
arch1.lm.res$coefficients["island.area.log",c("Estimate", "Std. Error")]
arch1.lm.res$r.squared
str(arch1.lm.res)

## La linea de regresión
plot(species.richness.log ~ island.area.log,
     data = islas.sel,
     subset = study.id == arch.ids[1])
abline(arch1.lm)

## Programacao
## Un bucle para hacer todas las regresiones
## Una lista para almacenar los resultados
arch.lm <- list()
## El bucle
for(i in 1:length(arch.ids)){
    arch.lm[[i]] <-
        lm(species.richness.log ~ island.area.log,
         data = islas.sel,
         subset = study.id == arch.ids[i])
}

names(arch.lm) <- arch.ids

## Sapply, apply, lapply
arch.coef <- sapply(arch.lm, coef) ## una matriz
class(arch.coef)

arch.coef <- data.frame(t(arch.coef))
names(arch.coef) <- c("intercepto", "pendiente") 
arch.coef$study.id <- rownames(arch.coef)

##Para exrecicio: graficos com linhas de regressao
par(mfrow = c(5,5))
for(i in 1:length(arch.ids)){
    plot(species.richness.log ~ island.area.log,
         data = islas.sel,
         subset = study.id == arch.ids[i],
         main = archipielagos$study.location[archipielagos$study.id==arch.ids[i]])
    abline(arch.lm[[arch.ids[i]]])
}
par(mfrow=c(1,1))

## Funcoes
## Saca la pendiente, su error y el R2 de las regresiones
f2 <- function(objeto){
    resumen <- summary(objeto)
    pend <- resumen$coefficients["island.area.log", "Estimate"]
    se <- resumen$coefficients["island.area.log", "Std. Error"]
    r2 <- resumen$r.squared
    return( c(pendiente = pend, s.error = se, r.quadrado = r2) )
}

arch.coef2 <- sapply(arch.lm, f2)
arch.coef2 <- data.frame(t(arch.coef2))
arch.coef2$study.id <- rownames(arch.coef2)

## Junta los resultados de la regresión a los datos de los archipiélagos
archipielagos <- merge(arch.coef2, archipielagos by = "study.id")

## Relación con la lluvia
plot(pendiente ~ mean.annual.precip, data = archipielagos)

## archipielagos insulares
archipielagos$tipo <- ifelse(archipielagos$island.type == "Continental",  "Continental", "Insular")

plot(pendiente ~ mean.annual.precip, data = archipielagos, type = "n")
points(pendiente ~ mean.annual.precip, data = archipielagos,
     subset = tipo == "Insular", pch = 19)
points(pendiente ~ mean.annual.precip, data = archipielagos,
       subset = tipo == "Continental", col = "blue", pch = 19)
legend("topright", c("Insular", "Continental"), pch =19,
       col = c("black", "blue"))

## Regression models
z.lm0 <- lm(pendiente ~ insular, data = archipielagos)
z.lm1 <- lm(pendiente ~ mean.annual.precip, data = archipielagos)
z.lm2 <- lm(pendiente ~ insular + mean.annual.precip, data = archipielagos)
z.lm3 <- lm(pendiente ~ insular + mean.annual.precip + mean.annual.precip:insular,
            data = archipielagos)
anova(z.lm3)

t.test(pendiente ~ insular ,data =archipielagos)

## Weighted plot
plot(pendiente ~ mean.annual.precip, data = archipielagos, type = "n")
points(pendiente ~ mean.annual.precip, data = archipielagos,
     subset = tipo == "Insular", pch = 19, cex = log10(1/s.error))
points(pendiente ~ mean.annual.precip, data = archipielagos,
       subset = tipo == "Continental", col = "blue", pch = 19, cex = log10(1/s.error))
legend("topright", c("Insular", "Continental"), pch =19,
       col = c("black", "blue"))

## Regression models
zw.lm0 <- lm(pendiente ~ insular, data = archipielagos, weights = 1/s.error)
zw.lm1 <- lm(pendiente ~ mean.annual.precip, data = archipielagos, weights = 1/s.error)
zw.lm2 <- lm(pendiente ~ insular + mean.annual.precip, data = archipielagos, weights = 1/s.error)
zw.lm3 <- lm(pendiente ~ insular + mean.annual.precip + insular + mean.annual.precip:insular,
            data = archipielagos, weights = 1/s.error)
anova(zw.lm3)

## Randomization test for weighted means

arch.insul <- archipielagos[archipielagos$tipo == "Insular",]
arch.cont <- archipielagos[archipielagos$tipo == "Continental",]
weighted.mean(arch.insul$pendiente, 1/arch.insul$s.error)
weighted.mean(arch.cont$pendiente, 1/arch.cont$s.error)
mean(arch.insul$pendiente)
mean(arch.cont$pendiente)
## permutation test for weighted means

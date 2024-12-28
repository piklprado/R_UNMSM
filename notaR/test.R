## Solucion 1
islas.raw <- read.csv("islas.csv")
islas.nombres <- names(islas.raw)
islas.nombres <- gsub("_", ".", tolower(islas.nombres), fixed = TRUE)
islas <- islas.raw
names(islas) <- islas.nombres
## Solucion 2
archipielagos.raw <- read.csv("archipielagos.csv")
archipielagos.nombres <- names(archipielagos.raw)
archipielagos.nombres <- gsub("_", ".", tolower(archipielagos.nombres), fixed = TRUE)
archipielagos <- archipielagos.raw
names(archipielagos) <- archipielagos.nombres
## Solucion 3
islas$island.area.log<- log(islas$island.area)
islas$species.richness.log <- log(islas$species.richness)
## Solucion 4
islas$sar.type <- factor(islas$sar.type)
islas$island.type <- factor(islas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
archipielagos$sar.type <- factor(archipielagos$sar.type)
archipielagos$ecoregion <- factor(archipielagos$ecoregion)
archipielagos$island.type <- factor(archipielagos$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))
## Solucion 5
islas.mean.area.log <- aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = islas )
## Numero de ilhas por study site
islas.N <- as.data.frame(table(islas$study.id))
## manipulacao de nomes
names(islas.N) <- c("study.id", "n.muestra")
## Coercao
islas.N$study.id <- as.character(islas.N$study.id)
## Solución 6 #
islas.N.6 <- islas.N$n.muestra > 6
## nombres de los arch
islas.ids <- islas.N$study.id[islas.N.6]
##
islas.test <- islas$study.id %in% islas.ids
## Selección por indexación de las islas de los archipielagos con N>6
islas.sel <- islas[islas.test, ]
## Lo mismo para los archipielagos
archipielagos.test <- archipielagos$study.id %in% islas.ids
archipielagos.sel <- archipielagos[archipielagos.test,]
## Solucion 7 ##
hist(islas.sel$species.richness,
     breaks = seq(0, 150, by = 15),
     cex.lab = 1.5,
     cex.axis = 1.25,
     ylab = "Número de islas",
     xlab = "Riqueza de especies",
     main = "")

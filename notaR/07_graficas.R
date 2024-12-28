## Preconcidiones 1
ilhas.raw <- read.csv("islas.csv")
ilhas.nombres <- names(ilhas.raw)
ilhas.nombres <- gsub("_", ".", tolower(ilhas.nombres), fixed = TRUE)
ilhas <- ilhas.raw
names(ilhas) <- ilhas.nombres
## Precondiciones 2
arquip.raw <- read.csv("archipielagos.csv")
arquip.nombres <- names(arquip.raw)
arquip.nombres <- gsub("_", ".", tolower(arquip.nombres), fixed = TRUE)
arquip <- arquip.raw
names(arquip) <- arquip.nombres
#Precondiciones 3
ilhas$island.area.log<- log(ilhas$island.area)
ilhas$species.richness.log <- log(ilhas$species.richness)
## Precondiciones 4
ilhas$sar.type <- factor(ilhas$sar.type)
ilhas$island.type <- factor(ilhas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
arquip$sar.type <- factor(arquip$sar.type)
arquip$ecoregion <- factor(arquip$ecoregion)
arquip$island.type <- factor(arquip$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))
##Precondiciones 5
ilhas.mean.area.log <- aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = ilhas )  
## Numero de ilhas por study site
ilhas.N <- as.data.frame(table(ilhas$study.id))
## manipulacao de nomes
names(ilhas.N) <- c("study.id", "n.muestra")
## Coercao
ilhas.N$study.id <- as.character(ilhas.N$study.id)
## Precondiciones 6 ##
ilhas.N.6 <- ilhas.N$n.muestra > 6
## nombres de los arch
ilhas.ids <- ilhas.N$study.id[ilhas.N.6]
##
ilhas.test <- ilhas$study.id %in% ilhas.ids
## Selección por indexación de las ilhas de los archipielagos con N>6
ilhas.sel <- ilhas[ilhas.test, ]
## Lo mismo para los archipielagos
arquip.test <- arquip$study.id %in% ilhas.ids
arquip.sel <- arquip[arquip.test,]
## Precondiciones 7 ##
library(magick)
library(png)
proibir("x11")
proibir("X11")
proibir("quartz")
png("07_graficas_gabarito.png", width = 480, height = 480, pointsize = 6)
plot(species.richness.log ~ island.area.log,
     data = ilhas.sel,
     cex.lab = 1.5,
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies")
dev.off()
imgOK <- image_read("07_graficas_gabarito.png")
png("07_graficas_aluno.png", width = 480, height = 480, pointsize = 6)
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
plot(species.richness.log ~ island.area.log,
     data = islas.sel,
     cex.lab = 1.5,
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies")

## Condiciones 7 ##
##Has usado una función que te pedimos que no usaras.
dev.off(); imgAluno <- image_read("07_graficas_aluno.png"); proibidas()
## La imagen de su gráfico tiene una gran discrepancia con la figura del enunciado.
imgMatch <-image_compare_dist(imgAluno, imgOK, metric = "", fuzz = 0)$distortion; imgMatch > .50
## La imagen de su gráfico tiene una discrepancia moderada con la figura del enunciado.
imgMatch > .90
## La imagen de su gráfico tiene una pequeña discrepancia  con la figura del enunciado.
imgMatch > .95
## ## La imagen de su gráfico tiene una muy pequeña discrepancia  con la figura del enunciado.
imgMatch > .99

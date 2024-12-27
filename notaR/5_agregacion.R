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
## Ficheros esperados ##
saveRDS(islas.mean.area.log, "5_agregacion_islas_mean.rds")
saveRDS(islas.N, "5_agregacion_islas_N.rds")

## Condiciones 5 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código?
identical(islas, ilhas)
## El objeto <code>archipielagos</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código?
identical(archipielagos, arquip)
## No hay un  objeto <code>islas.mean.area.log</code>.
exists("islas.mean.area.log")
## El objeto <code>islas.mean.area.log</code> no és exactamente el esperado. Utiliza la sintaxis de formula de la funcción <code>aggregate</code>.
identical(islas.mean.area.log, ilhas.mean.area.log)
## No hay un objeto <code>islas.N</code>. 
exists("islas.N")
## El objeto <code>islas.N</code> no es de la classe `dataframe`
is.data.frame(islas.N)
## Los nombres de las variables del objeto <code>islas.N</code> no son los esperados.
identical(names(ilhas.N), names(islas.N))
## La variable <code>study.id</code> del objeto <code>islas.N</code> nos es de classe <code>character</code>.
class(islas.N$study.id) == "character"
## El objeto <code>islas.N</code> no es exactamente lo esperado.
identical(islas.N, ilhas.N)


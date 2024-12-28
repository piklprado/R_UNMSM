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
## Solución 6 ##
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
## Ficheros esperados ##
saveRDS(islas.sel, "06_filtrar_islas_sel.rds")
saveRDS(archipielagos.sel, "06_filtrar_archipielagos_sel.rds")

## Condiciones 6 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(islas, ilhas)
## El objeto <code>archipielagos</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(archipielagos, arquip)
## No hay un objeto <code>islas.N</code>. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
exists("islas.N")
## El objeto <code>islas.N</code> no es exactamente lo esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(islas.N, ilhas.N)
## No hay el objeto <code>islas.N.6</code>
exists("islas.N.6")
## El objeto <code>islas.N.6</code> no es de la clase <code>logical</code>
is.logical(islas.N.6)
## El objeto <code>islas.N.6</code> no es exactamente lo esperado.
identical(ilhas.N.6, islas.N.6)
## No hay el objeto <code>islas.ids</code>
exists("islas.ids")
## El objecto <code>islas.ids</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code> islas.N$study.id[islas.N.6]</code>
identical(islas.ids, ilhas.ids)
## No hay el objeto <code>islas.test</code>
exists("islas.test")
## El objeto <code>islas.test</code> no es de la clase <code>logical</code>
is.logical(islas.test)
## El objeto <code>islas.test</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code>islas$study.id %in% islas.ids</code>.
identical(ilhas.test, islas.test)
## No hay el objeto <code>islas.sel</code>
exists("islas.sel")
## El objeto <code>islas.sel</code> no es exactamente lo esperado.
identical(islas.sel, ilhas.sel)
## No hay el objeto <code>archipielagos.test</code>
exists("archipielagos.test")
## El objeto <code>archipielagos.test</code> no es de la clase <code>logical</code>
is.logical(archipielagos.test)
## El objeto <code>archipielagos.test</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code>archipielagos$study.id %in% arquip.ids</code>.
identical(arquip.test, archipielagos.test)
## No hay el objeto <code>archipielagos.sel</code>
exists("archipielagos.sel")
## El objeto <code>archipielagos.sel</code> no es exactamente lo esperado.
identical(archipielagos.sel, arquip.sel)

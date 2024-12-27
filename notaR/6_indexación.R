## Precondicoes ##
## Ejercicio 1
ilhas.raw <- read.csv("islas.csv")
ilhas.nombres <- names(ilhas.raw)
ilhas.nombres <- gsub("_", ".", tolower(ilhas.nombres), fixed = TRUE)
ilhas <- ilhas.raw
names(ilhas) <- ilhas.nombres
## Ejercicio 2
arquip.raw <- read.csv("archipielagos.csv")
arquip.nombres <- names(arquip.raw)
arquip.nombres <- gsub("_", ".", tolower(arquip.nombres), fixed = TRUE)
arquip <- arquip.raw
names(arquip) <- arquip.nombres
##Ejercicio 3
ilhas$island.area.log<- log(ilhas$island.area)
ilhas$species.richness.log <- log(ilhas$species.richness)
## Ejercicio 4
ilhas$sar.type <- factor(ilhas$sar.type)
ilhas$island.type <- factor(ilhas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
arquip$sar.type <- factor(arquip$sar.type)
arquip$ecoregion <- factor(arquip$ecoregion)
arquip$island.type <- factor(arquip$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))
## Ejercicio 5
ilhas.mean.area.log <- aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = ilhas )  
## Numero de islas por study site
ilhas.N <- as.data.frame(table(ilhas$study.id))
## manipulacao de nomes
names(ilhas.N) <- c("study.id", "n.muestra")
## Ejercicio 6
## Archipelagos con por lo menos 6 islas
ilhas.N.6 <- ilhas.N$n.muestra > 6
## Filtra por logico
## nombres de los arch
ilhas.ids <- ilhas.N$study.id[ilhas.N.6]
## Selección por indexación de las islas de los archipielagos con N>6
ilhas$seleccion <- ilhas$study.id %in% ilhas.ids
ilhas.sel <- ilhas[ilhas$seleccion, ]
## Lo mismo para los archipielagos
arquip$seleccion <- arquip$study.id %in% ilhas.ids 
arquip.sel <- arquip[arquip$seleccion,]

## Solucao ##
## Ejercicio 1
islas.raw <- read.csv("islas.csv")
islas.nombres <- names(islas.raw)
islas.nombres <- gsub("_", ".", tolower(islas.nombres), fixed = TRUE)
islas <- islas.raw
names(islas) <- islas.nombres
## Ejercicio 2
archipielagos.raw <- read.csv("archipielagos.csv")
archipielagos.nombres <- names(archipielagos.raw)
archipielagos.nombres <- gsub("_", ".", tolower(archipielagos.nombres), fixed = TRUE)
archipielagos <- archipielagos.raw
names(archipielagos) <- archipielagos.nombres
## Ejercicio 3
islas$island.area.log<- log(islas$island.area)
islas$species.richness.log <- log(islas$species.richness)
## Ejercicio 4
islas$sar.type <- factor(islas$sar.type)
islas$island.type <- factor(islas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
archipielagos$sar.type <- factor(archipielagos$sar.type)
archipielagos$ecoregion <- factor(archipielagos$ecoregion)
archipielagos$island.type <- factor(archipielagos$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))
## Ejercicio 5
islas.mean.area.log <- aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = islas )
## Numero de ilhas por study site
islas.N <- as.data.frame(table(islas$study.id))
## manipulacao de nomes
names(islas.N) <- c("study.id", "n.muestra")

## Ejercicio 6
## Archipelagos con por lo menos 6 islas
islas.N.6 <- islas.N$n.muestra > 6
## Filtra por logico
## nombres de los arch
islas.ids <- islas.N$study.id[islas.N.6]
## Selección por indexación de las islas de los archipielagos con N>6
islas$seleccion <- islas$study.id %in% islas.ids
islas.sel <- islas[islas$seleccion, ]
## Lo mismo para los archipielagos
archipielagos$seleccion <- archipielagos$study.id %in% islas.ids 
archipielagos.sel <- archipielagos[archipielagos$seleccion,]

## Arquivo da solução
saveRDS(islas.sel, "6_seleccion_islas.rds")
saveRDS(archipielagos.sel, "6_seleccion_archipielagos.rds")

## Testes ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código? Además, ¿Hás añadido la variable `seleccion` al objeto `islas`?
identical(islas, ilhas)
## El objeto <code>archipielagos</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código? Además, ¿Hás añadido la variable `seleccion` al objeto `archipielagos`?
identical(archipielagos, arquip)
## No hay un  objeto <code>islas.mean.area.log</code>.

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
ilhas$species.richness.log <- log(ilhas$species.richness)
ilhas$island.area.log<- log(ilhas$island.area)
## Precondiciones 4
ilhas$sar.type <- factor(ilhas$sar.type)
ilhas$island.type <- factor(ilhas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
arquip$sar.type <- factor(arquip$sar.type)
arquip$ecoregion <- factor(arquip$ecoregion)
arquip$island.type <- factor(arquip$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))

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
islas$species.richness.log <- log(islas$species.richness)
islas$island.area.log<- log(islas$island.area)
## Solucion 4
islas$sar.type <- factor(islas$sar.type)
islas$island.type <- factor(islas$island.type, levels = c("Oceanic", "Continental", "Habitat-Patches"))
archipielagos$sar.type <- factor(archipielagos$sar.type)
archipielagos$ecoregion <- factor(archipielagos$ecoregion)
archipielagos$island.type <- factor(archipielagos$island.type,
                                    levels = c("Oceanic", "Continental", "Mainland Island"),
                                    labels = c("Oceanic", "Continental", "Habitat-Patches"))
## Ficheros esperados 4 ##
saveRDS(islas, "04_variables_categoricas_islas.rds")
saveRDS(archipielagos, "04_variables_categoricas_archipielagos.rds")

## Condiciones 4 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício 1</a> en tu código?
is.data.frame(islas)
## El objeto <code>archipielagos</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
is.data.frame(archipielagos)
## No hay una variable de nombre <code>island.area.log</code> en el objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
any("island.area.log" %in% names(islas))
## No hay una variable de nombre <code>species.richness.log</code> en el objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
any("species.richness.log" %in% names(islas))
## La variable <code>island.area.log</code> del objeto <code>islas</code> no tiene los valores esperados. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
identical(islas$island.area.log, ilhas$island.area.log)
## La variable <code>species.richness.log</code> del objeto <code>islas</code> no tiene los valores esperados. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
identical(islas$species.richness.log, ilhas$species.richness.log)
## La variable <code>sar.type</code> del objeto <code>islas</code> no es de clase <code>factor</code>.
is.factor(islas$sar.type)
## La variable <code>sar.type</code> del objeto <code>islas</code> no es exactamente lo que se espera.
identical(ilhas$sar.type, islas$sar.type)
## La variable <code>island.type</code> del objeto <code>islas</code> no es de clase <code>factor</code>.
is.factor(islas$island.type)
## La variable <code>island.type</code> del objeto <code>islas</code> no tiene los niveles esperados. Verifica los niveles con la función <code>levels</code>.
identical(levels(islas$island.type), levels(ilhas$island.type))
## La variable <code>island.type</code> del objeto <code>islas</code> no es exactamente lo que se espera.
identical(ilhas$island.type, islas$island.type)
## La variable <code>sar.type</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$sar.type)
## La variable <code>sar.type</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$sar.type, archipielagos$sar.type)
## La variable <code>ecoregion</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$ecoregion)
## La variable <code>ecoregion</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$ecoregion, archipielagos$ecoregion)
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$island.type)
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no tiene los niveles esperados. Verifica los niveles con la función <code>levels</code>.
identical(levels(archipielagos$island.type), levels(arquip$island.type))
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$island.type, archipielagos$island.type)


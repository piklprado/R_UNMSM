## Precondicoes
ilhas.raw <- read.csv("islas.csv")
ilhas.nombres <- names(ilhas.raw)
ilhas.nombres <- gsub("_", ".", tolower(ilhas.nombres), fixed = TRUE)
ilhas <- ilhas.raw
names(ilhas) <- ilhas.nombres 
## arquip.raw <- read.csv("archipielagos.csv")
## arquip.nombres <- names(arquip.raw)
## arquip.nombres <- gsub("_", ".", tolower(arquip.nombres), fixed = TRUE)
## arquip <- arquip.raw
##names(arquip) <- arquip.nombres
ilhas$island.area.log<- log(ilhas$island.area)
ilhas$species.richness.log <- log(ilhas$species.richness)

## Solucao
## Cria o objeto islas
islas.raw <- read.csv("islas.csv")
islas.nombres <- names(islas.raw)
islas.nombres <- gsub("_", ".", tolower(islas.nombres), fixed = TRUE)
islas <- islas.raw
names(islas) <- islas.nombres
islas$island.area.log<- log(islas$island.area)
islas$species.richness.log <- log(islas$species.richness)


## Salva arquivo com objeto final esperado
saveRDS(islas, file = "3_anadir_variables.rds")

## testes
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício </a>en tu código?
exists("islas")
## El objeto <code>islas</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício </a>en tu código?
is.data.frame(islas)
## No hay una variable de nombre <code>island.area.log</code> en el objeto <code>islas</code>.
any("island.area.log" %in% names(islas))
## No hay una variable de nombre <code>species.richness.log</code> en el objeto <code>islas</code>.
any("species.richness.log" %in% names(islas))
## La variable <code>island.area.log</code> no tiene los valores esperados. Asegúrate de haber calculado los logaritmos naturales de la variable <code>island.area</code>, con la función <code>log</code>.
identical(islas$island.area.log, ilhas$island.area.log)
## La variable <code>species.richness.log</code> no tiene los valores esperados. Asegúrate de haber calculado los logaritmos naturales de todos los valores de <code>species.richness</code>, con la función <code>log</code>.
identical(islas$species.richness.log, ilhas$species.richness.log)
## El objeto <code>islas</code> no tiene todo que se espera. 
identical(islas, ilhas)

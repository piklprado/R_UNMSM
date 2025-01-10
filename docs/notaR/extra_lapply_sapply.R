## Cria os dados
library(tidyverse)
library(sads)

f1 <- function(S){
    m1 <-
        rsad(S = S, frac=0.01, sad="lnorm", coef=list(meanlog=5, sdlog=2), zeroes=TRUE,
             ssize= 10, sampling="nbinom", k=0.2) |>
        mutate(species = paste("sp",species,sep="_"), sample = paste("sitio",sample, sep="_")) |>
        pivot_wider(names_from=sample, values_from=abundance) |>
        as.data.frame()
    row.names(m1) <- paste0("sp.", sample(1:100, S))
    as.matrix(m1[,-1])
}              

set.seed(42)
lista1 <- list(
    zona_1 = f1(23),
    zona_2 = f1(37),
    zona_3 = f1(18)
)
saveRDS(lista1, file = "inventario.rds")


## Preparacondicoes
abund2 <- readRDS("inventario.rds") 
## Presenca e ausencia
occup2 <- lapply(abund2, ">", 0)
## Alfa diversidade
sp_por_sitio2 <- lapply(occup2, apply, MARGIN = 2, sum) 
alfa2 <- sapply(sp_por_sitio2, mean)
## Gama diversidade
sitios_por_especie2 <- lapply(occup2, apply, MARGIN = 1, sum)
occ_por_especie2 <- lapply(sitios_por_especie2, ">", 0)
gama2 <-  sapply(occ_por_especie2, sum)

## Solucao
abund <- readRDS("inventario.rds") 
## Presenca e ausencia
occup <- lapply(abund, ">", 0)
## Alfa diversidade
sp_por_sitio <- lapply(occup, apply, MARGIN = 2, sum) 
alfa <- sapply(sp_por_sitio, mean)
## Gama diversidade
sitios_por_especie <- lapply(occup, apply, MARGIN = 1, sum)
occ_por_especie <- lapply(sitios_por_especie, ">", 0)
gama <-  sapply(occ_por_especie, sum)

##Testes

## No hay un objeto abund
exists("abund")
## El objeto abund no es una lista
is.list(abund)
## No hay un objeto occup
exists("occup")
## El objeto occup no es una lista
is.list(occup)
## La lista occup no tiene 3 elementos
length(occup)==3
## El objeto occup no contiene datos del tipo logical
all(sapply(occup,is.logical))
## El objeto occup no es exactamente lo que se espera.
identical(occup2, occup)
## No hay un objeto sp_por_site
exists("sp_por_sitio")
## El objeto sp_por_site no es una lista
is.list(sp_por_sitio)
## El objeto sp_por_site no tiene 3 elementos
length(sp_por_sitio)==3
## El objeto sp_por_site no tiene datos del tipo numeric
all(sapply(sp_por_sitio, is.numeric))
## El objeto sp_por_site no es exactamente lo que se espera.
identical(sp_por_sitio2, sp_por_sitio)
## No hay un objeto alfa
exists("alfa")
## El objeto alfa no es un vector numérico
is.numeric(alfa2)
## El objeto alfa no tiene los valores esperados
identical(alfa2, alfa)
## No hay un objeto sitios_por_especie
exists("sitios_por_especie")
## El objeto sitios_por_especie no es una lista
is.list(sitios_por_especie)
## El objeto sitios_por_especie no tem 3 elementos
length(sitios_por_especie)==3
## El objeto sitios_por_especie no tiene datos del tipo numeric
all(sapply(sitios_por_especie, is.numeric))
## No hay un objeto gama
exists("gama")
## El objeto gama no tiene los valores esperados
identical(gama2, gama)

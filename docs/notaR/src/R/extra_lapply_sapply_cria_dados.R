## Preparacao
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

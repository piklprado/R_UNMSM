## Preparacao
## Solucao
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






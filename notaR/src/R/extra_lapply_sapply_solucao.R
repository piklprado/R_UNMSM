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

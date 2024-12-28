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

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

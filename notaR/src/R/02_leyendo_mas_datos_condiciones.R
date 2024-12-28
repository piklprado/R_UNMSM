
## Condiciones 2
## No hay un objeto <code>archipielagos</code>.
exists("archipielagos")
## El objeto <code>archipielagos</code> no es un data frame.
is.data.frame(archipielagos)
## El objeto <code>archipielagos</code> tiene más columnas que deberia tener.
!ncol(archipielagos)>ncol(arquip)
## El objeto <code>archipielagos</code> tiene menos columnas que deberia tener.
!ncol(archipielagos)<ncol(arquip)
## El objeto <code>archipielagos</code> tiene más lineas que deberia tener.
!nrow(archipielagos)>nrow(arquip)
## El objeto <code>archipielagos</code> tiene menos lineas que deberia tener.
!nrow(archipielagos)<nrow(arquip)
## Los nombres de las variables del objeto <code>archipielagos</code> no són los esperados. 
identical(arquip.nombres, names(archipielagos))
## El objeto <code>archipielagos</code> no tiene los mismos datos que el fichero <a href="http://notar.ib.usp.br/arquivo/52">archipielagos.csv</a>.
identical(arquip, archipielagos)


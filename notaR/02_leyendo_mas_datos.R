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


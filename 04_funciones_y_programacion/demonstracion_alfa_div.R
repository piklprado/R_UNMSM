## Carga los archivos necesarios
abund <- readRDS("inventario.rds")
m1 <- abund[[1]]

## Una matriz de especies x sitios
m1[1:4,1:4]

##### Diversidad alfa de espécies
pres <- m1 > 0
(sp.por.sitio <- apply(pres, 2, sum))
mean(sp.por.sitio)

### una funcion
alfa <- function(matriz) {
  pres <- matriz > 0
  (sp.por.sitio <- apply(pres, 2, sum))
  mean(sp.por.sitio)
}

##aplica la funcion
alfa(m1)

## una lista de matrices:primeras fichas y columnas
lapply(abund, function(x)x[1:5,1:5])

## aplica la funcion a todas los elementos de la lista
sapply(abund, alfa)

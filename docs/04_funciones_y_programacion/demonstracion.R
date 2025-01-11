## Los datos que usaremos: iris dataset
data(iris)
## Verifica el objeto
head(iris)
str(iris)
table(iris$Species)

## Crea un factor para la variable Sepal.Length con los niveles:
## - Pequeño: menor que el primer cuartil (<25%) de la espécie
## - Médio: dentro del rango interquartilico (>=25% & < 75%) de la espécie
## - Grande: igual o más grande que el último cuartil (>=75%) de la espécie

## Function quantile te devuelve cuantiles (vease página de ayuda)
quantile(iris$Sepal.Length)
?quantile
## Calculo de los cuantiles de 25% de cada especie
(q25 <- aggregate(iris["Sepal.Length"],
                 by=list(iris$Species),
                 quantile, prob=0.25))
## Calculo de los cuantiles de 75% de cada especie
q75 <- aggregate(iris["Sepal.Length"],
                 by=(list(iris$Species)),
                 quantile, prob=0.75)
## Crea un vector emparejado al de la variable Sepal.Length,
## con los valores de los cuantiles de 25% la especie de cada fila de los datos
## Vease ayuda de la funcción merge
rep.q25 <- merge(iris[c("Species","Sepal.Length")], q25,
                 by.x = "Species", by.y = "Group.1")[[3]]
## Verificando
data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25)
## Hace lo mismo para los cuantiles de 75%
rep.q75 <- merge(iris[c("Species","Sepal.Length")], q75,
                 by.x = "Species", by.y = "Group.1")[[3]]
## Verificando
data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25, rep.q75)
## Crea un vector de caracteres del mismo tamaño de la variable Sepal.Length para rellenar
tama <- vector(mode="character", length = length(rep.q25))
## Verificando
head(data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25, rep.q75, tama))
## Incluye la cadena "Pequeño" en las posiciones del vector en que la variable
## es menor que el valor del vector emparejado rep.q25
criterio <- iris[["Sepal.Length"]] < rep.q25
tama[criterio] <- "Pequeño"
## Verificando
head(data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25, rep.q75, tama))
## Lo mismo para Médias
tama[iris[["Sepal.Length"]] >= rep.q25 & iris[["Sepal.Length"]] < rep.q75] <- "Médio"
## Verificando
head(data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25, rep.q75, tama))
## Lo mismo para Grandes
tama[iris[["Sepal.Length"]] >= rep.q75] <- "Grande"
## Coerción para factor
tama <- factor(tama, levels = c("Pequeño", "Médio", "Grande"))
## Verificando
head(data.frame(Sepal.Length=iris[["Sepal.Length"]], rep.q25, rep.q75, tama))
## Aqui hacemos una tabla de frecuencias de los niveles para cada espécie
table(tama, iris$Species)


## Una función, porque queremos aplicar esa operación a cada variable del objeto iris
## La función tiene un sólo argumento, que és la cadena con el nombre de la variable
## de la cual haremos el factor. Dejamos "Sepal,Length" como el valor por defecto
factor.tam <- function(variable = "Sepal.Length"){
    q25 <- aggregate(iris[variable],
                     by=(list(iris$Species)),
                     quantile, prob=0.25)
    ## Calculo de los cuantiles de 75% de cada especie
    q75 <- aggregate(iris[variable],
                     by=(list(iris$Species)),
                     quantile, prob=0.75)
    ## Crea un vector emparejado al de la variable Sepal.Length,
    ## con los valores de los cuantiles de 25% la especie de cada fila de los datos
    ## Vease ayuda de la funcción merge
    rep.q25 <- merge(iris[c("Species",variable)], q25,
                     by.x = "Species", by.y = "Group.1")[[3]]
    ## Hace lo mismo para los cuantiles de 75%
    rep.q75 <- merge(iris[c("Species",variable)], q75,
                     by = "Species", by.y = "Group.1")[[3]]
    ## Crea un vector de caracteres del mismo tamaño de la variable Sepal.Length para rellenar
    tama <- vector(mode="character", length = length(rep.q25))
    ## Incluye la cadena "Pequeño" en las posiciones del vector en que la variable
    ## es menor que el valor del vector emparejado rep.q25
    tama[iris[[variable]] < rep.q25] <- "Pequeño"
    ## Lo mismo para Médias
    tama[iris[[variable]] >= rep.q25 & iris[[variable]] < rep.q75] <- "Médio"
    ## Lo mismo para Grandes
    tama[iris[[variable]] >= rep.q75] <- "Grande"
    ## Coerción para factor
    factor(tama, levels = c("Pequeño", "Médio", "Grande"))    
}

## Un teste de la función
teste <- factor.tam()
## Verifica contra el objeto creado paso a paso
table(tama, iris$Species)
table(teste, iris$Species)

## Todo parece bién. Pero hacemos una verificación más con la
## muy linda función debug
debug(factor.tam) ## para salir de debug teclea Q

factor.tam()

undebug(factor.tama)

## Hacemos nuestra función más general, con argumentos para definir
## el dataframe con los datos y la variable de agregación
## Seguimos con los valores por defecto que usamos
factor.tam <- function(data = iris,
                       variable = "Sepal.Length",
                       criterio = "Species"){
    q25 <- aggregate(data[variable],
                     by=(list(data$Species)),
                     quantile, prob=0.25)
    ## Calculo de los cuantiles de 75% de cada especie
    q75 <- aggregate(data[variable],
                     by=(list(data$Species)),
                     quantile, prob=0.75)
    ## Crea un vector emparejado al de la variable Sepal.Length,
    ## con los valores de los cuantiles de 25% la especie de cada fila de los datos
    ## Vease ayuda de la funcción merge
    rep.q25 <- merge(data[c(criterio,variable)], q25,
                     by.x = criterio, by.y = "Group.1")[[3]]
    ## Hace lo mismo para los cuantiles de 75%
    rep.q75 <- merge(data[c(criterio,variable)], q75,
                     by = criterio, by.y = "Group.1")[[3]]
    ## Crea un vector de caracteres del mismo tamaño de la variable Sepal.Length para rellenar
    tama <- vector(mode="character", length = length(rep.q25))
    ## Incluye la cadena "Pequeño" en las posiciones del vector en que la variable
    ## es menor que el valor del vector emparejado rep.q25
    tama[data[[variable]] < rep.q25] <- "Pequeño"
    ## Lo mismo para Médias
    tama[data[[variable]] >= rep.q25 & data[[variable]] < rep.q75] <- "Médio"
    ## Lo mismo para Grandes
    tama[data[[variable]] >= rep.q75] <- "Grande"
    ## Coerción para factor
    factor(tama, levels = c("Pequeño", "Médio", "Grande"))    
}

## Un teste de la función
(teste <- factor.tam())
## Verifica contra el objeto creado paso a paso
table(tama, iris$Species)
table(teste, iris$Species)

## Todo parece bién. Pero hacemos una verificación más con la
## muy linda función debug
debug(factor.tam) ## para salir de debug teclea Q

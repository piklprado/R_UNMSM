## Ficheros esperados ##
saveRDS(islas.mean.area.log, "05_agregacion_islas_mean.rds")
saveRDS(islas.N, "05_agregacion_islas_N.rds")

## Condiciones 5 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código?
identical(islas, ilhas)
## El objeto <code>archipielagos</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 4 en tu código?
identical(archipielagos, arquip)
## No hay un  objeto <code>islas.mean.area.log</code>.
exists("islas.mean.area.log")
## El objeto <code>islas.mean.area.log</code> no és exactamente el esperado. Utiliza la sintaxis de formula de la funcción <code>aggregate</code>.
identical(islas.mean.area.log, ilhas.mean.area.log)
## No hay un objeto <code>islas.N</code>. 
exists("islas.N")
## El objeto <code>islas.N</code> no es de la classe `dataframe`
is.data.frame(islas.N)
## Los nombres de las variables del objeto <code>islas.N</code> no son los esperados.
identical(names(ilhas.N), names(islas.N))
## La variable <code>study.id</code> del objeto <code>islas.N</code> nos es de classe <code>character</code>.
class(islas.N$study.id) == "character"
## El objeto <code>islas.N</code> no es exactamente lo esperado.
identical(islas.N, ilhas.N)


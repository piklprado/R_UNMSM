## Ficheros esperados ##
saveRDS(islas.sel, "06_filtrar_islas_sel.rds")
saveRDS(archipielagos.sel, "06_filtrar_archipielagos_sel.rds")

## Condiciones 6 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(islas, ilhas)
## El objeto <code>archipielagos</code> no és exactamente el esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(archipielagos, arquip)
## No hay un objeto <code>islas.N</code>. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
exists("islas.N")
## El objeto <code>islas.N</code> no es exactamente lo esperado. ¿Has incluido la solución de los ejercício 1 a 5 en tu código?
identical(islas.N, ilhas.N)
## No hay el objeto <code>islas.N.6</code>
exists("islas.N.6")
## El objeto <code>islas.N.6</code> no es de la clase <code>logical</code>
is.logical(islas.N.6)
## El objeto <code>islas.N.6</code> no es exactamente lo esperado.
identical(ilhas.N.6, islas.N.6)
## No hay el objeto <code>islas.ids</code>
exists("islas.ids")
## El objecto <code>islas.ids</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code> islas.N$study.id[islas.N.6]</code>
identical(islas.ids, ilhas.ids)
## No hay el objeto <code>islas.test</code>
exists("islas.test")
## El objeto <code>islas.test</code> no es de la clase <code>logical</code>
is.logical(islas.test)
## El objeto <code>islas.test</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code>islas$study.id %in% islas.ids</code>.
identical(ilhas.test, islas.test)
## No hay el objeto <code>islas.sel</code>
exists("islas.sel")
## El objeto <code>islas.sel</code> no es exactamente lo esperado.
identical(islas.sel, ilhas.sel)
## No hay el objeto <code>archipielagos.test</code>
exists("archipielagos.test")
## El objeto <code>archipielagos.test</code> no es de la clase <code>logical</code>
is.logical(archipielagos.test)
## El objeto <code>archipielagos.test</code> no es exactamente lo esperado. Quizás te ayude ese comando: <code>archipielagos$study.id %in% arquip.ids</code>.
identical(arquip.test, archipielagos.test)
## No hay el objeto <code>archipielagos.sel</code>
exists("archipielagos.sel")
## El objeto <code>archipielagos.sel</code> no es exactamente lo esperado.
identical(archipielagos.sel, arquip.sel)

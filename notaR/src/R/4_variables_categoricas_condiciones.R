## Ficheros esperados 4 ##
saveRDS(islas, "4_variables_categoricas_islas.rds")
saveRDS(archipielagos, "4_variables_categoricas_archipielagos.rds")

## Condiciones 4 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128"> ejercício 1</a> en tu código?
exists("islas")
## No hay un objeto <code>archipielagos</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
exists("archipielagos")
## El objeto <code>islas</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício 1</a> en tu código?
is.data.frame(islas)
## El objeto <code>archipielagos</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/130">ejercício 2</a> en tu código?
is.data.frame(archipielagos)
## No hay una variable de nombre <code>island.area.log</code> en el objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
any("island.area.log" %in% names(islas))
## No hay una variable de nombre <code>species.richness.log</code> en el objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
any("species.richness.log" %in% names(islas))
## La variable <code>island.area.log</code> del objeto <code>islas</code> no tiene los valores esperados. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
identical(islas$island.area.log, ilhas$island.area.log)
## La variable <code>species.richness.log</code> del objeto <code>islas</code> no tiene los valores esperados. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/131">ejercício 3</a> en tu código?
identical(islas$species.richness.log, ilhas$species.richness.log)
## La variable <code>sar.type</code> del objeto <code>islas</code> no es de clase <code>factor</code>.
is.factor(islas$sar.type)
## La variable <code>sar.type</code> del objeto <code>islas</code> no es exactamente lo que se espera.
identical(ilhas$sar.type, islas$sar.type)
## La variable <code>island.type</code> del objeto <code>islas</code> no es de clase <code>factor</code>.
is.factor(islas$island.type)
## La variable <code>island.type</code> del objeto <code>islas</code> no tiene los niveles esperados. Verifica los niveles con la función <code>levels</code>.
identical(levels(islas$island.type), levels(ilhas$island.type))
## La variable <code>island.type</code> del objeto <code>islas</code> no es exactamente lo que se espera.
identical(ilhas$island.type, islas$island.type)
## La variable <code>sar.type</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$sar.type)
## La variable <code>sar.type</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$sar.type, archipielagos$sar.type)
## La variable <code>ecoregion</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$ecoregion)
## La variable <code>ecoregion</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$ecoregion, archipielagos$ecoregion)
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no es de clase <code>factor</code>.
is.factor(archipielagos$island.type)
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no tiene los niveles esperados. Verifica los niveles con la función <code>levels</code>.
identical(levels(archipielagos$island.type), levels(arquip$island.type))
## La variable <code>island.type</code> del objeto <code>archipielagos</code> no es exactamente lo que se espera.
identical(arquip$island.type, archipielagos$island.type)


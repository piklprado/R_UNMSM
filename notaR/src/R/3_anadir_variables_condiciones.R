## Fichero esperado 3 ##
saveRDS(islas, file = "3_anadir_variables.rds")

## Condiciones 3 ##
## No hay un objeto <code>islas</code>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício </a>en tu código?
exists("islas")
## El objeto <code>islas</code> no es un <em>data frame</em>. ¿Has incluido la solución del <a href="http://notar.ib.usp.br/exercicio/128">ejercício </a>en tu código?
is.data.frame(islas)
## No hay una variable de nombre <code>island.area.log</code> en el objeto <code>islas</code>.
any("island.area.log" %in% names(islas))
## No hay una variable de nombre <code>species.richness.log</code> en el objeto <code>islas</code>.
any("species.richness.log" %in% names(islas))
## La variable <code>island.area.log</code> no tiene los valores esperados. Asegúrate de haber calculado los logaritmos naturales de la variable <code>island.area</code>, con la función <code>log</code>.
identical(islas$island.area.log, ilhas$island.area.log)
## La variable <code>species.richness.log</code> no tiene los valores esperados. Asegúrate de haber calculado los logaritmos naturales de todos los valores de <code>species.richness</code>, con la función <code>log</code>.
identical(islas$species.richness.log, ilhas$species.richness.log)
## El objeto <code>islas</code> no tiene todo que se espera. 
identical(islas, ilhas)


En este ejercicio convertiremos en factores variables de los *data frame* `islas` y `archipelagos` que hás creado en los ejercícios 1, 2 y 3. 

1. Inicia tu script R con los códigos que has utilizado para resolver los ejercicios [Leyendo Datos](http://notar.ib.usp.br/exercicio/128), [Leyendo Más Datos](http://notar.ib.usp.br/exercicio/130) y [Añadir Variables](http://notar.ib.usp.br/exercicio/131). Con eso tu código para este ejercício debe crear los objetos `islas` y `archipielagos` en tu espacio de trabajo.

2. Convierte la variable `sar.type` del objeto `islas` en un factor.

3. Convierte la variable `island.type` del objeto `islas` en un factor. Los niveles dese factor devem ser `Oceanic`, `Continental`, `Habitat-Patches`, en este orden. Tenga en cuenta que deberá utilizar el argumento `levels` de la función `factor` para reordenar los niveles. 

4. Convierte la variable `sar.type` del objeto `archipielagos` en un factor.

5. Convierte la variable `ecoregion` del objeto `archipielagos` en un factor.

6. Convierte la variable `island.type` del objeto `archipielagos` en un factor. Los niveles dese factor devem ser `Oceanic`, `Continental`, `Habitat-Patches`, en este orden. Tenga en cuenta que deberá utilizar el argumento `labels` de la función `factor` para renombrar los niveles y el argumento `levels` para reordenar los niveles. 

##### ¿Ni idea de por qué recibes mensajes de error? 

Quizás le ayude descargar [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/04_variables_categoricas_islas.rds) y [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/04_variables_categoricas_archipielagos.rds) en su espacio de trabajo y leerlos con los comandos:

`ej4a  <-  readRDS( "04_variables_categoricas_islas.rds")` 

`ej4b  <-  readRDS( "04_variables_categoricas_archipielagos.rds")` 

Los objetos `ej4a` y `ej4b` tendrán los *data frame* tal cual esperados por este ejercício. Puedes compararlos con los *data frame* que creaste en tu código, con la función `identical`. 

Pero atención: no incluyas eses comandos en su *script* de respuesta a este ejercício.

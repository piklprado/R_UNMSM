En este ejercicio usaremos los  *data frames* `islas`, `archipielagos` y `islas.N` que hás creado y trabajado en los ejercícios precedentes. 

1. Inicia tu script R con los códigos que has utilizado para resolver los ejercicios [Leyendo Datos](http://notar.ib.usp.br/exercicio/128), [Leyendo Más Datos](http://notar.ib.usp.br/exercicio/130), [Añadir Variables](http://notar.ib.usp.br/exercicio/131), [Variables Categoricas](http://notar.ib.usp.br/exercicio/132) y [Tablas de Agregación](http://notar.ib.usp.br/exercicio/133). Con eso tu código para este ejercício debe crear los objetos `islas`, `archipielagos` y `islas.N` en tu espacio de trabajo. 

2. Cree un vector lógico que tenga un valor de `TRUE` para cada valor de la variable `n.muestra` del objeto `islas.N` que sea mayor que 6. Y que tenga un valor de `FALSE` para cada valor menor o igual que 6. Asigna esta matriz a un objeto con el nombre `islas.N.6`.

3. Utilice el vector lógico `islas.N.6` para filtrar todos los valores de la variable `study.id` del objeto `islas.N` para los que el valor de `islas.N.6` sea `TRUE`. Asigna el resultado de este filtrado a un objeto llamado `islas.ids`. Este objeto tendrá los rótulos de los sítios de estudio con más de seis islas. 

4. Ahora realice una prueba lógica que verifique si cada valor de la variable `study.id` del objeto `islas` se encuentra entre los rótulos contenidos en el objeto `islas.id`. Utilice el operador lógico `%in%`. Guarda el resultado de esta prueba en un objeto llamado `islas.test`.

5. Filtra las filas del *data frame* `islas` que corresponden a los valores `TRUE` del objeto `islas.test`. El resultado será un nuevo *data frame*, con las mismas variables que el objeto `islas`, pero sólo con las filas seleccionadas. Guarde este nuevo *data frame* en un objeto llamado `islas.sel`.

6. Haiga más una prueba lógica, pero ahora para el objeto `archipielagos`. Su prueba debe verificar si cada valor de la variable `study.id` del objeto `archipielagos` se encuentra entre las rótulos contenidos en el objeto `islas.id`. Guarda el resultado en un objeto llamado `archipielagos.test`.

5. Filtra las filas del *data frame* `archipielagos` que corresponden a los valores `TRUE` del objeto `archipielagos.test`. El resultado será un nuevo *data frame*, con las mismas variables que el objeto `archipielagos`, pero sólo con las filas seleccionadas. Guarde este nuevo *data frame* en un objeto llamado `archipielagos.sel`.


##### ¿Ni idea de por qué recibes mensajes de error? 

Quizás le ayude descargar [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/06_filtrar_islas_sel.rds) y  [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/06_filtrar_archipielagos_sel.rds) en su espacio de trabajo y leerlos con los comandos:

`ej6a  <-  readRDS( "06_filtrar_islas_sel.rds")`

`ej6b  <-  readRDS( "06_filtrar_archipielagos_sel.rds")`


Los objetos `ej6a` y `ej6b`  tendrán los *data frame* tal cual esperados por este ejercício. Puedes compararlos con los objetos que creaste en tu código, con la función `identical`. 

Pero atención: no incluyas eses comandos en su *script* de respuesta a este ejercício.

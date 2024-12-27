En este ejercicio usaremos el  *data frame* `islas` que hás creado y trabajado en los ejercícios precedentes. 

1. Inicia tu script R con los códigos que has utilizado para resolver los ejercicios [Leyendo Datos](http://notar.ib.usp.br/exercicio/128), [Leyendo Más Datos](http://notar.ib.usp.br/exercicio/130), [Añadir Variables](http://notar.ib.usp.br/exercicio/131) y [Variables Categoricas](http://notar.ib.usp.br/exercicio/132). Con eso tu código para este ejercício debe crear los objetos `islas` y `archipielagos` en tu espacio de trabajo. (En este ejercício necesitas solamente del objeto `islas`, pero mantenga los *scripts* de todos los ejercícios en su código).

2. Aplica la funcción `aggregate` en el objeto `islas` para hacer un *data frame* con las médias de los logaritmos de las areas de las islas por tipo de isla (variable  `island.type`) y por región biogeografica (variable `biogeo.realm`). Assigne el resultado en un objeto com el nombre `islas.mean.area.log`.

##### ¿Ni idea de por qué recibes mensajes de error? 

Quizás le ayude descargar [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/5_aggregate.rds)  en su espacio de trabajo y leerlo con el comando:

`ej5  <-  readRDS( "5_aggregate.rds")` 

El objetos `ej5` tendra el *data frame* tal cual esperado por este ejercício. Puedes compararlos con los objetos que creaste en tu código, con la función `identical`. 

Pero atención: no incluyas eses comandos en su *script* de respuesta a este ejercício.

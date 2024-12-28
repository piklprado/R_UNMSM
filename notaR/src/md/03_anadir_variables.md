En este ejercicio vamos a añadir nuevas variables al *data frame* `islas` que hás creado en el ejercício [Leyendo Datos](http://notar.ib.usp.br/exercicio/128).

1. Inicia tu script R con el código que has utilizado para resolver el ejercicio [Leyendo Datos](http://notar.ib.usp.br/exercicio/128). Este código debe crear el objeto `islas` en tu espacio de trabajo.

2. Añade una variable al objeto `islas` que contenga el logaritmo natural de la variable `species.richness`. Esa nueva variable debe llamarse `species.richness.log`.

3. Añade una otra variable al objeto `islas` que contenga el logaritmo natural de la variable `island.area`. Esa nueva variable debe llamarse `island.area.log`.

##### ¿Ni idea de por qué recibes mensajes de error? 

Quizás le ayude descargar [ese fichero](https://github.com/piLaboratory/R_UNMSM/raw/refs/heads/master/notaR/03_anadir_variables.rds) en su espacio de trabajo y leerlo con el comando:

`ej3  <-  readRDS( "03_anadir_variables.rds")` 

El objeto `ej3` tendrá el *data frame* tal cual esperado por este ejercício. Puedes compararlo con el *data frame* que creaste en tu código, con la función `identical`. 

Pero atención: no incluyas eses comandos en su *script* de respuesta a este ejercício.

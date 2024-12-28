En este ejercicio usaremos el  *data frame* `islas.sel`,  que hás creado y trabajado en los ejercícios precedentes. 

1. Inicia tu script R con los códigos que has utilizado para resolver los ejercicios [Leyendo Datos](http://notar.ib.usp.br/exercicio/128), [Leyendo Más Datos](http://notar.ib.usp.br/exercicio/130), [Añadir Variables](http://notar.ib.usp.br/exercicio/131), [Variables Categoricas](http://notar.ib.usp.br/exercicio/132),  [Tablas de Agregación](http://notar.ib.usp.br/exercicio/133) y [Filtrado de Datos](http://notar.ib.usp.br/exercicio/134). Con eso tu código para este ejercício debe crear en  tu espacio de trabajo los objetos que necesitas para ese ejercício. 

2. Añade a su *script* los comandos que haigan un histograma de la variable `species.richness` de lo objeto `islas.sel`. El título del eje X debe ser «Riqueza de espécies» y el título del eje Y debe ser «Número de islas». Los títulos de los ejes deben incrementarse en 1,5 veces y los números de los ejes deben incrementarse en 1,25 veces (véanse los argumentos `cex.axis` y `cex.lab` en la ayuda de `par`, que todavia se aceptan en la función `hist`). Los intervalos de clase del histograma deven ser de 15, empezando en zero hasta 150 (véanse el argumento `breaks` y la función `seq` para crear secuencias). El histograma no debe tener título (véanse el argumento `main` de la función `hist`).

3. Añade al histograma un línea vertical roja al histograma, marcando la média del número de espécies por isla en el *data frame* `islas.sel`.

4. No incluyas en tu *script* ningún comando para guardar el gráfico en un fichero (como `png`, `pdf`, etc). Tampoco incluyas en tu código comandos que abran ventanas gráficas, como `X11` o `quartz`.

El sistema evaluará la similitud de la imagen generada por su código con la imagen siguiente:

<p align="center">
  <img src="https://raw.githubusercontent.com/piLaboratory/R_UNMSM/refs/heads/master/notaR/07_graficas_gabarito.png">
</p>

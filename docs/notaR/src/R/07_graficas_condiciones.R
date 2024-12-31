
## Condiciones 7 ##
##Has usado una función que te pedimos que no usaras.
dev.off(); imgAluno <- image_read("07_graficas_aluno.png"); proibidas()
## No hay el objeto <code>islas.sel</code> ¿Has incluido la solución de los ejercício 1 a 6 en tu código?
exists("islas.sel")
## El objeto <code>islas.sel</code> no es exactamente lo esperado. ¿Has incluido la solución de los ejercício 1 a 6 en tu código?
identical(islas.sel, ilhas.sel)
## La imagen de su gráfico tiene gran discrepancia con la figura del enunciado.
imgMatch <-image_compare_dist(imgAluno, imgOK, metric = "", fuzz = 0)$distortion; imgMatch > .50
## La imagen de su gráfico tiene discrepancias importantes con la figura del enunciado.
imgMatch > .95
## La imagen de su gráfico tiene una discrepancia  moderada con la figura del enunciado.
imgMatch > .975
## La imagen de su gráfico tiene una pequeña discrepancia  con la figura del enunciado.
imgMatch > .99

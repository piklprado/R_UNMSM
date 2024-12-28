
## Condiciones 7 ##
##Has usado una función que te pedimos que no usaras.
dev.off(); imgAluno <- image_read("07_graficas_aluno.png"); proibidas()
## La imagen de su gráfico tiene una gran discrepancia con la figura del enunciado.
imgMatch <-image_compare_dist(imgAluno, imgOK, metric = "", fuzz = 0)$distortion; imgMatch > .50
## La imagen de su gráfico tiene una discrepancia moderada con la figura del enunciado.
imgMatch > .90
## La imagen de su gráfico tiene una pequeña discrepancia  con la figura del enunciado.
imgMatch > .95
## ## La imagen de su gráfico tiene una muy pequeña discrepancia  con la figura del enunciado.
imgMatch > .99

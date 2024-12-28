##Has usado una función que te pedimos que no usaras.
dev.off(); imgAluno <- image_read("aluno.png"); proibidas()
## La imagen de su gráfico tiene una discrepancia de más hasta 50 por ciento con la figura del enunciado
imgMatch <-image_compare_dist(imgAluno, imgOK, metric = "", fuzz = 0)$distortion; imgMatch > .50
## La imagen de su gráfico tiene una discrepancia de hasta 20 por ciento con la figura del enunciado
imgMatch > .80
## La imagen de su gráfico tiene una discrepancia hasta del 10 por ciento con la figura del enunciado
imgMatch > .90
## Muy bien. Su gráfico corresponde a la imagen del enunciado.
imgMatch > .99

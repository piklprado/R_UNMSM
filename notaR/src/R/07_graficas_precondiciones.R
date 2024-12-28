## Precondiciones 7 ##
library(magick)
library(png)
proibir("x11")
proibir("X11")
proibir("quartz")
png("07_graficas_gabarito.png", width = 480, height = 480, pointsize = 6)
plot(species.richness.log ~ island.area.log,
     data = ilhas.sel,
     cex.lab = 1.5,
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies")
dev.off()
imgOK <- image_read("07_graficas_gabarito.png")
png("07_graficas_aluno.png", width = 480, height = 480, pointsize = 6)

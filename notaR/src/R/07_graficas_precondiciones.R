## Precondiciones 7 ##
library(magick)
library(png)
proibir("x11")
proibir("X11")
proibir("quartz")
png("gabarito.png", width = 400, height = 200, pointsize = 6)
plot(species.richness.log ~ island.area.log,
     data = islas.sel,
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies")
dev.off()
imgOK <- image_read("esalignaFig105_2OK.png")
png("aluno.png", width = 400, height = 200, pointsize = 6)

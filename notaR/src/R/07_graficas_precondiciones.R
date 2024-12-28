## Precondiciones 7 ##
X <- 480
ponto <- 10
library(magick)
library(png)
proibir("x11")
proibir("X11")
proibir("quartz")
png("07_graficas_gabarito.png", width = X, height = X, pointsize = ponto)
hist(ilhas.sel$species.richness,
     breaks = seq(0, 150, by = 15),
     cex.lab = 1.5,
     cex.axis = 1.25,
     ylab = "Número de islas",
     xlab = "Riqueza de especies",
     main = "")
dev.off()
imgOK <- image_read("07_graficas_gabarito.png")
png("07_graficas_aluno.png", width = X, height = X, pointsize = ponto)

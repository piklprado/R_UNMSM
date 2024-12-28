## Solucion 7 ##
plot(species.richness.log ~ island.area.log,
     data = islas.sel,
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies")

## subset
par(mfrow = c(2,2))
plot(species.richness.log ~ island.area.log, data = islas.sel,
     subset=study.location=="Kingdom of Tonga",
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies",
     main = "Kingdom of Tonga")
plot(species.richness.log ~ island.area.log, data = islas.sel,
     subset=study.location=="Solomon",
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies",
     main = "Solomon")
plot(species.richness.log ~ island.area.log, data = islas.sel,
     subset=study.location=="Polynesian islands",
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies",
     main = "Polynesian islands")
plot(species.richness.log ~ island.area.log, data = islas.sel,
     subset=study.location=="Cabo Verde, Atlantic",
     xlab = "Ln Área de la isla",
     ylab = "Ln Número de especies",
     main = "Cabo Verde, Atlantic")
par(mfrow=c(1,1))


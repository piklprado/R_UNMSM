##Precondiciones 5
ilhas.mean.area.log <- aggregate( island.area.log ~ island.type + biogeo.realm, FUN = mean, data = ilhas )  
## Numero de ilhas por study site
ilhas.N <- as.data.frame(table(ilhas$study.id))
## manipulacao de nomes
names(ilhas.N) <- c("study.id", "n.muestra")
## Coercao
ilhas.N$study.id <- as.character(ilhas.N$study.id)

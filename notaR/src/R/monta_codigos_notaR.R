nomes <- c("01_leyendo_datos",
           "02_leyendo_mas_datos",
           "03_anadir_variables",
           "04_variables_categoricas",
           "05_agregacion",
           "06_filtrar_datos")#
#           "07_graficas")
sufixos <- c("precondiciones.R", "solucion.R")

df <- expand.grid(sufix = sufixos, nome = nomes)
df$file <- paste(df$nome, df$sufix, sep="_")
df$numero <- as.integer(substr(df$nome, 1,2))


for(i in df$numero){
    nome.cond <- paste0(nomes[i],"_condiciones.R")
    df2 <- df[df$numero %in% (1:i),]
    df2 <- df2[order(df2$sufix, df2$file),]
    nomes.comp <- paste(df2$file, collapse= " ")
    nome.file <- paste0("../../", nomes[i],".R")
    argumento <- paste0("cat ", nomes.comp, " ", nome.cond, " > ", nome.file)
    system(argumento)
    }

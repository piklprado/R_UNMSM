nomes <- c("1_leyendo_datos",
           "2_leyendo_mas_datos",
           "3_anadir_variables",
           "4_variables_categoricas",
           "5_agregacion")
sufixos <- c("precondiciones.R", "solucion.R")

df <- expand.grid(sufix = sufixos, nome = nomes)
df$file <- paste(df$nome, df$sufix, sep="_")
df$numero <- as.integer(substr(df$nome, 1,1))


for(i in df$numero){
    nome.cond <- paste0(nomes[i],"_condiciones.R")
    df2 <- df[df$numero %in% (1:i),]
    df2 <- df2[order(df2$sufix, df2$file),]
    nomes.comp <- paste(df2$file, collapse= " ")
    nome.file <- paste0("../../", nomes[i],".R")
    argumento <- paste0("cat ", nomes.comp, " ", nome.cond, " > ", nome.file)
    system(argumento)
    }

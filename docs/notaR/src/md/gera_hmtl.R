nomes <- c("01_leyendo_datos",
           "02_leyendo_mas_datos",
           "03_anadir_variables",
           "04_variables_categoricas",
           "05_agregacion",
           "06_filtrar_datos",
           "07_graficas",
           "extra_lapply_sapply")
for(n in nomes)
    system(paste0("pandoc ",n,".md --wrap=preserve -o ../../", n,".html"))


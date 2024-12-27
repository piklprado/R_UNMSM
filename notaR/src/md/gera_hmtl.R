nomes <- c("1_leyendo_datos",
           "2_leyendo_mas_datos",
           "3_anadir_variables",
           "4_variables_categoricas",
           "5_agregacion")

for(n in nomes)
    system(paste0("pandoc ",n,".md --wrap=preserve -o ../../", n,".html"))


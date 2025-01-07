if(file.exists("Curso_R_UNMSM.swc")) file.remove("Curso_R_UNMSM.swc")
library(swirlify)
set_lesson(path_to_yaml = "~/work/disciplinas/pos_graduacao/R/UNMSM/2025/tutoriales_swril//Mi_primera_session/lesson.yaml", open_lesson = FALSE, silent = TRUE)
pack_course("~/work/disciplinas/pos_graduacao/R/UNMSM/2025/site/Tutoriales/")
file.rename("tutoriales_swril.swc", "Curso_R_UNMSM.swc")
## Old code
##nome <- commandArgs(trailingOnly = TRUE)
## rota0 <- "Curso_R_UNMSM"
## rota <- paste0("tmp/Curso_R_UNMSM_v",nome)
## if(!dir.exists("tmp")) dir.create("tmp")
## file.copy(paste0(rota0,"/"), "tmp", overwrite = TRUE, recursive = TRUE)
## file.rename(paste0("tmp/",rota0), rota) 
## set_lesson(path_to_yaml = paste0(rota, "/Mi_primera_session/lesson.yaml"), open_lesson = FALSE)
## pack_course("~/work/pos_grad/usp/disciplinas/cursoR/UNMSM/2025/repo_material_didatico/Tutoriales/")
## system(paste0("rm -r ", rota))


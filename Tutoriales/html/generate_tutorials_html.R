library(swirlify)
library(swirl)
library(yaml)
library(stringr)
##source("lesson_to_rmd.R")

any_of_exprs <- function(...){
    lista <- list(...)
    expr <- parse(text = lista[[1]])
    eval(expr)
    }

manifest <- read.table("../Curso_R_UNMSM/MANIFEST")$V1
ddir <- "/home/paulo/work/pos_grad/usp/disciplinas/cursoR/UNMSM/2025/repo_material_didatico/Tutoriales/html"



## for(lesson in manifest){
##     set_lesson(file.path("..", "Curso_R_UNMSM",lesson,"lesson.yaml"), open_lesson=FALSE, silent=TRUE)
##     lesson_to_html(install_course=FALSE, dest_dir=ddir)
## }

f1 <- function(nome){
     set_lesson(file.path("..", "Curso_R_UNMSM",nome,"lesson.yaml"), open_lesson=FALSE, silent=TRUE)
     lesson_to_html(install_course=FALSE , dest_dir=ddir)
     }
## Por alguma razao da pau
f1(manifest[1])
## os excluidos dão pau
lapply(manifest[c(-1,-6, -9, -10, -11)], f1)

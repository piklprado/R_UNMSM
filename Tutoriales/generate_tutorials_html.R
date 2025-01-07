## WIP: no funciona bien y solo en la maquina local
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

manifest <- read.table("../../tutoriales_swril/MANIFEST")$V1
ddir <- "/home/paulo/work/pos_grad/usp/disciplinas/cursoR/UNMSM/2025/site/Tutoriales/html/"



## for(lesson in manifest){
##     set_lesson(file.path("..", "Curso_R_UNMSM",lesson,"lesson.yaml"), open_lesson=FALSE, silent=TRUE)
##     lesson_to_html(install_course=FALSE, dest_dir=ddir)
## }

f1 <- function(nome){
     set_lesson(file.path("..","..", "tutoriales_swril",nome,"lesson.yaml"), open_lesson=FALSE, silent=TRUE)
     lesson_to_html(install_course=FALSE , dest_dir=ddir)
     }
## Por alguma razao da pau
f1(manifest[1])
f1(manifest[2])
f1(manifest[3])
f1(manifest[4])
f1(manifest[5])
f1(manifest[6])
f1(manifest[7])
f1(manifest[8])

## os excluidos dão pau
#lapply(manifest[c(-1,-6, -9, -10, -11)], f1)

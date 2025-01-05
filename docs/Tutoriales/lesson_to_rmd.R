## tentative tweak of swril::lesson_to_html WIP

source("https://raw.githubusercontent.com/swirldev/swirlify/refs/heads/master/R/tools.R")

## from https://raw.githubusercontent.com/swirldev/swirlify/refs/heads/master/R/lesson_to_html.R

makechunk <- function(item) {
  out <- c("```{r, strip.white = TRUE}", item, "```")
  paste0(out, collapse="\n")
}

makechunk_silent <- function(item) {
  out <- c("```{r, strip.white = TRUE, echo=FALSE, message=FALSE}", item, "```")
  paste0(out, collapse="\n")
}

#' @importFrom stringr str_split str_trim
makemult <- function(item) {
  answers <- unlist(str_split(item, ";"))
  answers <- str_trim(answers)
  nums <- paste0(seq(length(answers)), ".")
  paste(nums, answers, collapse="\n")
}

makemd <- function(unit) UseMethod("makemd")

makemd.default <- function(unit) {
  stop("No unit class specified!", unit)
}

makemd.text <- function(unit) {
  paste(unit[['Output']],
        sep="\n\n")
}

makemd.cmd_question <- function(unit) {
  paste(unit[['Output']],
        makechunk(unit[['CorrectAnswer']]),
        sep="\n\n")
}

makemd.mult_question <- function(unit) {
  paste(unit[['Output']],
        makemult(unit[['AnswerChoices']]),
        unit[['CorrectAnswer']],
        sep="\n\n")
}

makemd.script <- function(unit) {
  # Get correct script contents
  script_name <- unit[["Script"]]
  correct_script_name <- paste0(tools::file_path_sans_ext(script_name),
                                "-correct.R")
  path2les <- getOption("swirlify_lesson_dir_path")
  script_path <- file.path(path2les, "scripts", correct_script_name)
  script_contents <- readLines(script_path, warn = FALSE)
  paste(unit[["Output"]],
        makechunk(script_contents),
        sep = "\n\n")
}

## Modified code WIP

lesson_to_rmd <- function (dest_dir = NULL, open_html = FALSE, keep_rmd = TRUE, 
    quiet = FALSE, install_course = FALSE) 
{
    if (!is.logical(open_html)) {
        stop("Argument 'open_html' must be TRUE or FALSE!")
    }
    if (!is.logical(keep_rmd)) {
        stop("Argument 'keep_rmd' must be TRUE or FALSE!")
    }
    if (!is.logical(quiet)) {
        stop("Argument 'quiet' must be TRUE or FALSE!")
    }
    if (!is.logical(install_course)) {
        stop("Argument 'install_course' must be TRUE or FALSE!")
    }
    lesson_file_check()
    course_dir <- getOption("swirlify_course_dir_path")
    if (is.null(dest_dir)) {
        dest_dir <- dirname(getOption("swirlify_course_dir_path"))
    }
    if (!file.exists(dest_dir)) {
        stop(dest_dir, " does not exist!")
    }
    dest_dir <- normalizePath(dest_dir)
    if (install_course) 
        install_course_directory(course_dir)
    lessonPath <- getOption("swirlify_lesson_file_path")
    rmd_filename <- paste0(getOption("swirlify_lesson_dir_name"), 
        ".Rmd")
    destrmd <- file.path(dest_dir, rmd_filename)
    les <- yaml.load_file(lessonPath)
    meta <- unlist(les[1])
    les <- les[-1]
    cat("---", paste("title:", meta["Lesson"]), "output:", "  html_document:", 
        "    theme: spacelab", "---\n", sep = "\n", file = destrmd)
    initpath <- file.path(dirname(lessonPath), "initLesson.R")
    if (file.exists(initpath)) {
        initcode <- paste0(readLines(initpath, warn = FALSE), 
            collapse = "\n")
        initcode <- c("suppressPackageStartupMessages(library(swirl))\n", 
            initcode)
        cat(makechunk_silent(initcode), "\n\n", file = destrmd, 
            append = TRUE)
    }
    for (unit in les) {
        class(unit) <- unit[["Class"]]
        out <- paste(makemd(unit), "\n\n")
        cat(out, file = destrmd, append = TRUE)
        invisible()
    }
    ## message("Knitting html...")
    ## rmarkdown::render(destrmd, quiet = quiet)
    ## html_filename <- paste0(getOption("swirlify_lesson_dir_name"), 
    ##     ".html")
    ## desthtml <- file.path(dest_dir, html_filename)
    if (!keep_rmd) 
        file.remove(destrmd)
    if (open_html) {
        message("Opening html document...")
        browseURL(desthtml)
    }
}

# Análisis y visualización de datos biológicos con R

Sitio web y todo el material utilizado en el curso, dictado para el Doctorado en Ciencias Biológicas, Universidad Nacional Mayor de San Marcos, Lima, Perú (06 al 13 de enero de 2025).

```bash
.
├── README.md                       # this file
├── _site.yml                       # site config
├── 01_introduccion.Rmd             # landing page for each class
├── 01_introdución/                # subfolder for each class + labs
│   ├── lab.Rmd                     # lab source file
│   ├── lab.html
│   ├── slides.Rmd                  # slides source file
│   ├── slides.html
│   └── xaringan-themer.css
├── notaR                           # codes and texts of the ecercises
│   └──src                          # md and R codes for the execrcises
├── index.Rmd                       # home page
├── docs/                           # output folder for the site 
└── theme.css
```

## To deploy this website locally

+ Clone this repository
+ Install `distill`, `xaringanExtra`: 
```
install.packages("distill")
install.packages("xaringanExtra")
```
+ Click on the Build Website button of the Build pane in RStudio or execute `rmarkdown::render_site(encoding = 'UTF-8')`. R may prompt you to install/update some extra packages.

A version of this site will be created in the `docs/` subfolder. Open **index.html** in your web browser. 

## To add slides to each class

Slides are saved in each subfolder, for each class. 

Xaringan slides need xaringan: `install.packages("xaringan")`. These are `.Rmd` files with a special YAML header (you can modify the YAML based on the [sample slides](01_introduccion/slides.Rmd)

You can knit the slides using the knit button, pressing `ctrl+shift+K` in RStudio, or  execute 

```
rmarkdown::render('./[0x_topic]/slides.Rmd',  encoding = 'UTF-8')`.
```

> **Note**  
> Remember to knit your slides and labs before building the site again. 
> Push the `.Rmd` and the `.html` for your slides and labs, the subfolder /libs and `xaringan-themer.css`  
> Push the contents of `/docs` as well, Netlify will build the site from there


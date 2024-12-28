
## Condiciones 1 ##
## No hay un objeto <code>islas.raw</code>
exists("islas.raw") 
## El objeto <code>islas.raw</code> no tiene todo el contenido del fichero "islas.csv". Use la función <code>read.csv</code> para leer el fichero.
identical(islas.raw, ilhas.raw)
## No hay un objeto <code>islas.nombres</code>. Use la función <code>names</code> para sacar los nombres de objetos.
exists("islas.nombres")
## El objeto <code>islas.nombres</code> no contiene los nombres esperados. Siga los pasos 2-4 para crear el objeto y cambiar su contenido. Si tiene alguna duda, consulte las páginas de ayuda de las funciones <code>names</code>, <code>tolower</code> y <code>gsub</code>El objeto <code>islas.nombres</code> no contiene los nombres esperados por los pasos 2-4
identical(islas.nombres, ilhas.nombres)
## No hay un objeto <code>islas</code>
exists("islas")
## El objeto <code>islas</code> no es un data frame
is.data.frame(islas)
## Los nombres de las variables del objeto <code>islas</code> no són los que están en el objeto <code>islas.nombres</code>. 
identical(ilhas.nombres, names(islas))
## El objeto <code>islas</code> no tiene los mismos datos que el objeto <code>islas.raw</code>,
identical(ilhas, islas)



## 1. Leyendo datos

En nuestros ejercicios utilizaremos los datos recopilados por [Ohyama et al. 2021](https://onlinelibrary.wiley.com/doi/10.1111/jbi.14149), para analisar la relación entre área y riqueza de especies.

El fichero [islas.csv](http://notar.ib.usp.br/arquivo/51) tiene datos de areas y número de espécies por isla.
Descargue el fichero en el directorio de su espacio de trabajo (*workspace*) R, donde vas executar el código deste ejercício.

Cree un código (*script*) en R que realice los siguientes pasos:

1. Lee el contenido del fichero [islas.csv](http://notar.ib.usp.br/arquivo/51) en un *data frame* que debes nombrar `islas.raw`. 
**Importante:** su comando debe leer el archivo csv desde su espacio de trabajo en R. No utilice rutas a otros directorios de trabajo en su código.

2. Cree un objeto denominado `islas.nombres` con los nombres de las variables del *data frame* `islas.raw`.

3. Cambie todas las cadenas del objeto `islas.nombres` a minúsculas utilizando la función `tolower`

4. Sustituya todas las apariciones del carácter «_» en el objeto `islas.nombres` por el carácter «.», utilizando la función `gsub`. **Importante:** use el argumento <code>fixed = TRUE</code> de <code>gsub</code>.

5. Cree una copia del objeto `islas.raw` denominada `islas`

6. Cambie los nombres de las variables en el  objeto `islas` por los nombres que están en el objeto `islas.nombres`.

shannon <- function(x){
    x <- x[!is.na(x)&!is.nan(x)&x>0]
    p <- x/sum(x)
    -sum(p*log(p))
}

simpson <- function(x){
    x <- x[!is.na(x)&!is.nan(x)]
    p <- x/sum(x)
    sum(p^2)
    }




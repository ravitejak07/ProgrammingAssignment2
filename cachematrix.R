

> library(NMF)
> library(pnmath)
> library(Rmpi)
> library(clue)

> x <- rmatrix(1000,1000)  // Creates Non Negative Ints
> solve_LSAP(x) 	


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

 makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get, setinv = setinv, getinv = getinv)
 
}


## Write a short comment describing this function
cachesolve <- function(x, ...) { 
    i<- x$getinv()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i<- solve(data, ...)
    x$setinv(i)
    i

}


## Create special object to tore a matrix and provides methods 
## for computing matrix inverse (and others)

## makeCacheMatrix function creates a matrix and holds it's inverse

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL
        
        set <- function(y) {
                i<<-NULL
                x <<- y
        }
        
        get <- function() {
                x
        }
        
        setInverse <- function(inv) {
                i <<-inv
        }
        
        getInverse <- function() {
                i
        }
        
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve will calculate inverse of the matrix or get it from a cache if already calculated

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(x$get())
        x$setInverse(m)
        m
}

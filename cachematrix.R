## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#the makeCacheMatrix function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
i <- NULL 

	set <- function(y) { #----1
        x <<- y
        i <<- NULL
    }

	get <- function() x #----2

	setInverse <- function(inverse) i <<- inverse #----3
	getInverse <- function() i #----4

	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

# the cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        i <- x$getInverse()
	if(!is.null(i)){ 
	        message("getting cached data")
	        return(i)
	}
	
	data <- x$get()
	i <- solve(data, ...)
	x$setInverse(i)
	i
}

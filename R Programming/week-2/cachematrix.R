## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# set function sets the matrix to the matrix passed in parameter
# setinv sets inverse to the passed arg
# get and getinv returns matrix and inverse respectively
# inverse is inititally set to NULL

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

# gets the inverse from x,
#if the inverse in the object is not null then it was cached,
# if it was then we solve it and set it as inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if (!is.null(inv)) { # if inv is found in cache return it
                return(inv)
        }
        mat <- x$get() # get the matrix
        inv <- solve(mat) # compute the inverse
        x$setinv(inv) # store the inverse
        inv
}

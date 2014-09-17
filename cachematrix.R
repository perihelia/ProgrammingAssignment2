                                            # This R program caches the inverse of a matrix, to speed up subsequent access

makeCacheMatrix <- function(x = matrix()) { # This function manages the cache
   m <- NULL                                # Varaible 'm' for caching the inverted matrix
   
   set <- function(y) {                     # When a new matrix (the argument 'y') needs to be inverted and cached,
      x <<- y                               # store the original matrix ('y') in 'x',
      m <<- NULL                            # and empty the cache (until the inverse matrix is computed)
   }
   
   get <- function() {
      x                                     # Retrieve the original (un-inverted) matrix 'x'
   }
   
   setinverse <- function(inverse) {
      m <<- inverse                         # Store the inverse matrix in the cache
   }
   
   getinverse <- function() {
      m                                     # Get the inverse matrix from the cache
   }
   
   
   list(set = set,                          # Return a list containing the four functions defined above
        get = get,                          # for manipulating the cache
        setinverse = setinverse,
        getinverse = getinverse
   )
}

cachesolve <- function(x, ...) {            # This function calculates the inverse matrix and stores it in the cache
   message("Checking cache")                # (using the functions defined inside 'makeCacheMatrix')
   m <- x$getinverse()                      # Get the value in the cache
   
   if(!is.null(m)) {                        # If the inverse matrix is already computed/cached,
      return(m)                             # and return the inverse
   }
   
   message("One moment")                    # Otherwise:
   data <- x$get()                          # retrieve the original matrix,
   message("Computing inverse matrix")      # tell the user
   m <- inverse(data, ...)                  # compute the inverse,
   x$setinverse(m)                          # store it in the cache,
   m                                        # and return the inverse
}

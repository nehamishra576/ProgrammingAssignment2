## This is an implementation to cache inverse of matrix

## This function has set of functions to get data, set data , get inverse, set inverse  

makeCacheMatrix <- function(x = matrix()) {
  invertedMatrix <- NULL;
  set<-function(y){
    x<<-y
    invertedMatrix<<-NULL
  }
  get<- function() x
  setInverse <- function(solve) invertedMatrix<<-solve
  getInverse <- function() invertedMatrix
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## This function get the data either from cache or if not present, calculates and save in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invertedMatrix<-x$getInverse()
        if(!is.null(invertedMatrix)){
          message("getting cached data")
          return(invertedMatrix)
          
        }
        data<-x$get()
        invertedMatrix<-solve(data,...)
        x$setInverse(invertedMatrix)
        invertedMatrix

}


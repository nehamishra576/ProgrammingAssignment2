## This is an implementation to cache inverse of matrix if the same matrix is passed

## This function returns a list of functions to do the following:
## 1. Get data
## 2. Set data 
## 3. Get inverse,
## 4. Set inverse  

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL;
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<- function() x
  setInverse <- function(solve) inv<<-solve
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## This function get the data either from cache or if not present, calculates and save in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getInverse()
        if(!is.null(inv)){
          message("getting cached data")
          return(inv)
          
        }
        data<-x$get()
        inv<-solve(data,...)
        x$setInverse(inv)
        inv

}


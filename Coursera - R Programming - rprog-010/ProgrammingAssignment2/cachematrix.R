## Put comments here that give an overall description of what your
## functions do

# The first function, makeVector creates a special "matrix", 
# which is really a list containing a function to
# set the value of the matrix
# get the value of the matrix
# set the value of the matrix
# get the value of the matrix
makeCacheMatrix <- function(x = matrix()) {
  # set m to NULL as a placeholder for a matrix
  m<-NULL 
  
  # set the matrix, x, to a new matrix, y, and resets the inverse, m, to NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  
  # function to return the matrix, x
  get<-function() x
  
  # sets the matrix, m, to inverse
  setmatrix<-function(solve) m<<- solve
  
  # function to return the inverse, m
  getmatrix<-function() m
  
  # returns the 'special matrix' containing all of the functions defined above
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

# The cacheSolve function calculates the inverse of the special "matrix"
# the special "matrix" which created with the makeCacheMatrix function.
# However, it first checks to see if the inverse has already been calculated.
# If so, it gets the inverse from the cache and skips the computation.
# Otherwise, it calculates the inverse of the matrix 
# and sets the value of the inverse
# in the cache via the setmatrix function.
cacheSolve <- function(x=matrix(), ...) {
  # gets the matrix
  m <- x$getmatrix()
  
  # if matrix exist in cache
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  
  # cache matrix
  x$setmatrix(m)
  
  # Return a matrix that is the inverse of 'x'
  m
}

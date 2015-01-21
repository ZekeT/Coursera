corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  vec <- c()
  for (id in 1:332){
    fileName = formatC(id, width = 3, flag = "0") 
    filePath <- paste(directory, paste(fileName, "csv", sep = "."), sep = "/") 
    
    data <- data.frame(read.csv(filePath))
    count <- sum(complete.cases(data))
    
    if ( count >= threshold ) {
      data2 <- data[complete.cases(data),]
      vec <- c(vec, cor(data2$sulfate, data2$nitrate))
    }
  }
  vec
}
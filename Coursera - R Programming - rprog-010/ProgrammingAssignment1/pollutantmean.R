pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
    
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  df <- data.frame()
  for (i in id){
    fileName = formatC(i, width = 3, flag = "0") 
    filePath <- paste(directory, paste(fileName, "csv", sep = "."), sep = "/") 
    data <- data.frame(read.csv(filePath))
    df <- rbind(df, data)
  } 
  #result <- colMeans(subset(df, select = c(pollutant)), na.rm = TRUE)
  result <- mean(df[,pollutant], na.rm = TRUE)
  result
}

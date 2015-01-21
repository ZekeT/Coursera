## part 4: Ranking hospitals in all states
rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  filename <- "outcome-of-care-measures.csv"
  data <- read.csv(filename, colClasses = "character",na.strings="Not Available")
  
  # data frames
  df <- data.frame()
  
  ## Check that outcome is valid
  validOutcome <- c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) stop("invalid outcome")
  if (outcome == "heart attack") outcomeColNum <- 11
  if (outcome == "heart failure") outcomeColNum <- 17
  if (outcome == "pneumonia") outcomeColNum <- 23 #pneumonia
  
  ## For each state, find the hospital of the given rank
  states <- sort(unique(data[,7]))
  for (i in states){
    stateSubset <- data[data[, 7]==i, ]
    outcomeStateSubset <- stateSubset[!(is.na(stateSubset[,outcomeColNum])),]
    
    if (num=="best") rank <- 1
    else if (num=="worst") rank <- length(outcomeStateSubset[,outcomeColNum])
    else rank <- num
    
    sorted <- outcomeStateSubset[order(as.numeric(outcomeStateSubset[,outcomeColNum]), outcomeStateSubset[,2]),]
    x <- data.frame(sorted[rank,]$Hospital.Name, i)
    df <- rbind(df,x)
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  names(df) <- c("hospital","state")
  df
  
}
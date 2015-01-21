## part 2: Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data
  filename <- "outcome-of-care-measures.csv"
  data <- read.csv(filename, colClasses = "character",na.strings="Not Available")
  
  ## Check state are valid: 
  validState = unique(data[,7])
  if (!state %in% validState) stop("invalid state")
  stateSubset <- data[data[, 7]==state, ]
  
  ## check outcome are valid: "heart attack", "heart failure", or "pneumonia"
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) stop("invalid outcome")
  if (outcome == "heart attack") outcomeColNum <- 11
  if (outcome == "heart failure") outcomeColNum <- 17
  if (outcome == "pneumonia") outcomeColNum <- 23 #pneumonia
    
  # get vector of row numbers with smallest outcome value
  minValue <- min(as.numeric(stateSubset[,outcomeColNum]),na.rm=T)
  vecRowNum <- (as.numeric(stateSubset[,outcomeColNum]) == minValue)
  
  # get vector of hospital names with smallest outcome value
  # if there are multiple hospitals with the minimum outcome value, then
  # return the first hospital name from the alphabetically sorted hospital
  # names list
  hospitals <- sort(stateSubset[vecRowNum,2])
  hospitals[1]
}


## part 3: Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, rank="best") {
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
  
  # remove incomplete cases referencing outcome column
  outcomeStateSubset <- stateSubset[!(is.na(stateSubset[,outcomeColNum])),]
  
  if (rank=="best") rank <- 1
  if (rank=="worst") rank <- length(outcomeStateSubset[,outcomeColNum])
  
  # get vector of row numbers with smallest outcome value
  sorted <- outcomeStateSubset[order(as.numeric(outcomeStateSubset[,outcomeColNum]), outcomeStateSubset[,2]),]
  sorted[rank,]$Hospital.Name
  
}

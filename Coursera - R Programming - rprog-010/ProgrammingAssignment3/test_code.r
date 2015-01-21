## assignment 3

## part 2: Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
  
  ## Check state are valid: 
  validState = unique(data[,7])
  if (!state %in% validState) stop("invalid state")
  
  ## check outcome are valid: "heart attack", "heart failure", or "pneumonia"
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  # get outcome columns numbers
  if (outcome == "heart attack") outcome_col_num <- 11
  else if (outcome == "heart failure") outcome_col_num <- 17
  else outcome_col_num <- 23 #pneumonia
  
  # remove NA rows from table reference selected outcome column
  outcome_col <- data[!is.na(as.numeric(data[,outcome_col_num])),]
  
  # get rows with smalles outcome value
  minvalue <- min(as.numeric(data[,outcome_col]))
  o_row <- which(data[,outcome_col] == minvalue)
  
  # match hospitals to min value
  hospitals <- data[o_row, 2]
    
  # if there are multiple hospitals with the minimum outcome value, then
  # return the first hospital name from the alphabetically sorted hospital
  # names list
  if (length(hospitals) > 1) {
    hospitals <- sort(hospitals)
    hospitals[1]
  }
  else {
    hospitals
  }
  ## Return hospital name in that state with lowest 30-day death rate
  
}

## part 1:  Plot the 30-day mortality rates for heart attack
part_one <- function (){
  # read outcome data using read.csv function
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  # look at the first few rows
  head(outcome)
  # see number of columns in the data set
  ncol(outcome)
  # see number of rows in the data set
  nrow(outcome)
  # see name of each column 
  names(outcome)
  # make histogram of the 30-day death rates from heart attack (column 11)
  hist(outcome[, 11])
}




# part 2
best <- function(state, name) {
  if(nchar(state) != 2)
    stop("invalid state")
  
  if( name != "heart attack" && name != "heart failure" && name != "pneumonia")
    stop("invalid outcome");
  
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  byState <- outcome[outcome$State==state,]
  
  col <- getColumnIndex(name)
  if(nrow(byState) == 0)
    stop("invalid state")
  
  byState[,col] <- as.numeric(byState[,col])
  #print(byState[,col])
  sorted <- byState[order(byState[,col], na.last=TRUE) , ]
  sorted[1,2]
}

getColumnIndex <- function(name) {
  if( name == "heart attack")
    11
  else if( name == "heart failure")
    17
  else if( name == "pneumonia")
    23
  else
    stop("invalid outcome")
}
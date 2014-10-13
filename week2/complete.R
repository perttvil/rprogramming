getFilename <- function(number) {
  if( number < 10 )
    paste0("00", number, ".csv")
  else if( number < 100)
    paste0("0", number, ".csv")
  else
    paste0(number, ".csv")
}


complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  result <- data.frame(id = id, nobs = 0)
  row <- 1
  for( i in id) {
    csv <- read.csv(paste(directory,getFilename(i), sep="/"))
    ca <- complete.cases(csv$nitrate, csv$sulfate)
    trueVector <- ca[ca]
    count <- length(trueVector)
    result[row, 2] <- count
    row <- row + 1
  }
  
  result
}
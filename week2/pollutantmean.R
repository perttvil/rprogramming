getFilename <- function(number) {
  if( number < 10 )
    paste0("00", number, ".csv")
  else if( number < 100)
    paste0("0", number, ".csv")
  else
    paste0(number, ".csv")
}

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
  allNumbers <- c();
  for( i in id) {
    csvFilename <- getFilename(i);
    filename <- paste(directory,csvFilename, sep="/");
    csv <- read.csv(filename)
    numbers <- csv[pollutant]
    bad <- is.na(numbers)
    goodNumbers <- numbers[!bad]
    allNumbers <- c(allNumbers,goodNumbers)
  }
  
  mean(allNumbers)
}


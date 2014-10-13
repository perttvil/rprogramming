corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  result <- numeric()
  files <- list.files(directory, pattern = "\\.(?i)csv$")
  for(file in files) {
    csv <- read.csv(paste(directory, file, sep="/"))
    ca <- complete.cases(csv$Date, csv$nitrate, csv$sulfate, csv$ID)
    count <- length(ca[ca])
    if( threshold <= count && count > 0) {
      cor <- cor(csv$nitrate[ca], csv$sulfate[ca], use = "complete.obs")
      result <- c(result, cor)    
    }
  }
  result
}

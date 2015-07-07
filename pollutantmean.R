##R-Programming Project-1.1: pollutantmean
##by Shu Wang

pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## set working dir 
  
  
  ## identify pollutant column number
  if (pollutant == "sulfate"){
    coln <- 2
  }else if(pollutant == "nitrate"){
    coln <- 3
  }
  
  ##initialize an empty vector to store data
  data <- c()
  
  i = 1
  
  for (i in id){
    
    ## set file path for files identified by "i"
    path <- file.path(directory, sprintf("%03d.csv", as.numeric(i)))
    
    ## read data in each data file
    file <- read.csv(path)[, coln]
    
    ## store pollutant data in th vector initialized before
    data <- c(data, file)
  }
  
  ## calculte the mean of pollutant and remove the NAs
  mean(data, na.rm = TRUE)
}

##sample tests
pollutantmean("specdata", "sulfate", 1:10)
## 4.064128
pollutantmean("specdata", "nitrate", 70:72)
## 1.706047
pollutantmean("specdata", "nitrate", 23)
## 1.280833

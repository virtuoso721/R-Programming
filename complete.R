##R-Programming Project1.2: complete
##by Shu Wang
complete <- function(directory, id = 1:332){
  
  library(data.table)
  
  ## initialize an empty vector to store the number of complete observations(nobs)
  data <- c()
  
  ## initialize an empty vector to store id
  idc <- c()
  
  for (i in id){
    
    ## set file path for files identified by "i"
    path <- file.path(directory, sprintf("%03d.csv", as.numeric(i)))
    
    ## read data in each data file
    file <- read.csv(path)
    
    ## calculate nobs
    complete_cases <- sum(complete.cases(file))
    
    ## store nobs in vector initialized before
    data <- c(data, complete_cases)
    
    ## store id in vector initialized before
    idc <- c(idc, i)
  }
  
  ## create data table to store id and nobs
  data.table(id = idc, nobs = data)
}

## sample test cases
complete("specdata", 1:10)
##id nobs
##1:  1  117
##2:  2 1041
##3:  3  243
##4:  4  474
##5:  5  402
##6:  6  228
##7:  7  442
##8:  8  192
##9:  9  275
##10: 10  148
complete("specdata", c(2, 4, 8, 10, 12))
##id nobs
##1:  2 1041
##2:  4  474
##3:  8  192
##4: 10  148
##5: 12   96
complete("specdata", 30:25)
##id nobs
##1: 30  932
##2: 29  711
##3: 28  475
##4: 27  338
##5: 26  586
##6: 25  463
complete("specdata", 3)
##id nobs
##1:  3  243

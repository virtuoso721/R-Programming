## R Programming Assignment 1.2

complete <- function(directory, id = 1:332){
  library(data.table)
  setwd(paste("~/R Programming/", directory, sep = ""))
  idc <- c()
  nobs <- c()
  for (i in id){
    if (i <= 9){
      table <- read.csv(paste("00", i, ".csv", sep = ""))
    }else if(i >= 10 && i <= 99){
      table <- read.csv(paste("0", i, ".csv", sep = ""))
    }else{
      table <- read.csv(paste(i, ".csv", sep = ""))
    }
    idc <- c(idc, i)
    n <- sum(complete.cases(table))
    nobs <- c(nobs, n)
  }
  data.table(id = idc, nobs = nobs)
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

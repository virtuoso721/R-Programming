## R-Programming Project1.2: correlation
## by Shu Wang
corr <- function(directory, threshold = 0){

  dt <- complete(directory, 1:332)
  
  ## subset the data
  sub <- subset(dt, nobs >= threshold, select = id)
  
  ## convert the data frame to vector
  sub_id <- sub$id
  
  ## initialize an empty vector
  correlation <- c()
  
  for (i in sub_id){
    
    ## set file path for files identified by "i"
    path <- file.path(directory, sprintf("%03d.csv", as.numeric(i)))
    
    ## read data in each data file
    file <- read.csv(path)
    
    ## remove the NA
    complete_file <- file[complete.cases(file), ]
    
    ## calculate and store the correlation to vector that initialized before
    correlation <- c(correlation, cor(complete_file$sulfate, complete_file$nitrate)) 
  }
  correlation
}

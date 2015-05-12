corr <- function(directory, threshold = 0){
  setwd(paste("~/R Programming/", directory, sep = ""))
  dt <- complete(directory, 1:332)
  idt <- c(dt$id[dt$nobs > threshold])
  
  correlation <- c()
  for (i in idt){
    if(i <= 9){
      data <- read.csv(paste("00", i, ".csv", sep = ""))
    }else if(i >= 10 && i <= 99){
      data <- read.csv(paste("0", i, ".csv", sep = ""))
    }else{
      data <- read.csv(paste(i, ".csv", sep = ""))
    }
    complete_data <- data[complete.cases(data), ]
    correlation <- c(correlation, cor(complete_data$sulfate, complete_data$nitrate))
  }
  correlation
}

library(reshape2)
library(ggplot2)
library(caTools) 
library(pixmap)
library(colorspace) 
library(dplyr)
library(data.table)
library(readr)
matrixsummation2 <- function(m){
  result <- array(sapply(seq_along(m), function(i) {
      ind <- which(col(m) == col(m)[i] & abs(row(m)[i] - row(m)) == 1 | 
                 row(m) == row(m)[i] & abs(col(m)[i] - col(m)) == 1)
      sum(m[ind])
  }), dim(m))
return(result)
}

matrixsummation <- function(A){ 
  dimensions <- dim(A)
  A1 <- data.frame(rep(0,dimensions[1]), A[1:dimensions[1],1:(dimensions[2]-1)])
  A2 <- data.frame(A[1:dimensions[1],2:dimensions[2]], rep(0,dimensions[1]))
  A3 <- t(data.frame(rep(0,dimensions[2]), t(A[1:(dimensions[1]-1),1:dimensions[2]])))
  A4 <- t(data.frame(t(A[2:dimensions[1],1:dimensions[2]]),rep(0,dimensions[2]) ))
  A5 <-  t(data.frame(rep(0,dimensions[2]), t(A1[1:(dimensions[1]-1),1:dimensions[2]])))
  A6 <-  t(data.frame(t(A2[2:dimensions[1],1:dimensions[2]]),rep(0,dimensions[2]) ))
  result <- data.matrix(A1+A2+A3+A4 +A5+A6)
  colnames(result) <-NULL
  return(result)
}
matrixcreator <-function(){
  lakeS <- read.csv(file="../MatlabModels/mylake.txt", head=FALSE) 

  
  LikelihoodMap <- list()
  LikelihoodMap[[1]] <- data.matrix((lakeS +  matrix(0.5, nrow=12, ncol=12))/10, rownames.force = NA)
  colnames(LikelihoodMap[[1]]) <- NULL
  LikelihoodMap[[2]] <- data.matrix((lakeS +  matrix(0.5, nrow=12, ncol=12))/10, rownames.force = NA )
  colnames(LikelihoodMap[[2]]) <- NULL
  LikelihoodMap[[3]] <- data.matrix((lakeS +  matrix(0.5, nrow=12, ncol=12))/9, rownames.force = NA )
  colnames(LikelihoodMap[[3]]) <- NULL
  LikelihoodMap[[4]] <- matrix(0.01, nrow = 12, ncol = 12)
  LikelihoodMap[[5]] <- matrix(0.01, nrow = 12, ncol = 12)
  LikelihoodMap[[6]] <- matrix(0.01, nrow = 12, ncol = 12)
  
  LikelihoodMap <- list()
  LikelihoodMap[[1]] <- matrix(0.5, nrow = 1000, ncol = 1000)
  LikelihoodMap[[2]] <- matrix(0.5, nrow = 1000, ncol = 1000)
  LikelihoodMap[[3]] <- matrix(0.6, nrow = 1000, ncol = 1000)
  LikelihoodMap[[4]] <- matrix(0.01, nrow = 1000, ncol = 1000)
  LikelihoodMap[[5]] <- matrix(0.01, nrow = 1000, ncol = 1000)
  LikelihoodMap[[6]] <- matrix(0.01, nrow = 1000, ncol = 1000)
  
  StartingMatrix <- matrix(0, nrow = 1000, ncol = 1000)
  StartingMatrix[1:100,1] <- 1 
  StartingMatrix[1:100,500] <- 2
  StartingMatrix[1:100,100] <- 3
}


modelsimulator <- function(StartingMatrix, LikelihoodMap, NumberofTrials){ 
  #Startingmatrix is the matrix of the initial colonies in map.
  #LikelihoodMap is 6 distinct matrices first 3 contain probaility of birth of an individual from population 1:3 
    #the next three contain probability of death of an individual from populations 1:3 
    #its a list data structure with the birth and death rates 
  #initialising current matrix 
  CurrentMatrix = StartingMatrix
  dimensions <- dim(StartingMatrix)
  Ones <- matrix(1, dimensions[1], dimensions[2])
  
  Updated <- list()
  Updated[[1]] <- CurrentMatrix
  w = 1
  for(i in c(1:NumberofTrials)){
    print(i)
    FreeSpots <- (CurrentMatrix==0)
    PopulationA <- (CurrentMatrix==1)
    PopulationB <- (CurrentMatrix==2)
    PopulationC <- (CurrentMatrix==3)
    
    #Birth Step      
    LikelihoodofPopA <- matrixsummation(PopulationA*LikelihoodMap[[1]])*FreeSpots
    LikelihoodofPopB <- matrixsummation(PopulationB*LikelihoodMap[[2]])*FreeSpots
    LikelihoodofPopC <- matrixsummation(PopulationC*LikelihoodMap[[3]])*FreeSpots
    
    
    Normaliser <- matrixsummation(Ones)
    
    LikelihoodofPopA <- LikelihoodofPopA/Normaliser
    LikelihoodofPopB <- LikelihoodofPopB/Normaliser
    LikelihoodofPopC <- LikelihoodofPopC/Normaliser
    
    RandomNumbers <- matrix(runif(dimensions[1]*dimensions[2], min = 0, max = 1),dimensions[1],dimensions[2])
    
    CurrentMatrix[RandomNumbers < LikelihoodofPopA + LikelihoodofPopB + LikelihoodofPopC] <- 3
    CurrentMatrix[RandomNumbers < LikelihoodofPopA + LikelihoodofPopB] <- 2
    CurrentMatrix[RandomNumbers < LikelihoodofPopA] <- 1
    
    #Death Step
    LikelihoodofDeath <- PopulationA*LikelihoodMap[[4]] + PopulationB*LikelihoodMap[[5]] + PopulationC*LikelihoodMap[[6]]
    RandomNumbers <- matrix(runif(dimensions[1]*dimensions[2], min = 0, max = 1),dimensions[1],dimensions[2])
    CurrentMatrix[ RandomNumbers < LikelihoodofDeath]<-0
    
    #print(CurrentMatrix)
    #This bit can be commented out to increase efficiency but stops the output of the video
    #melted <- melt(CurrentMatrix)
    #melted$Var0 <- i
    if( i %% 10 ==0){
      w = w +1
      Updated[[w +1]] <- CurrentMatrix
      if( i %% 100 == 0){
        #print(Updated)
        saveRDS( Updated, paste0("Output",i/100,".RDS"))
        w = 1
        Updated = list()
      }
    }
  }
  
  return <-  list("finalmatrix"=CurrentMatrix, "Updated"=Updated)
  saveRDS(Updated, "Outputfile.RDS")
  return(return)
}



source('FunctionsWhichGenerateandPlottheModel.R')

LikelihoodMap <- list()
LikelihoodMap[[1]] <- matrix(0.5, nrow = 12, ncol = 12)
LikelihoodMap[[2]] <- matrix(0.5, nrow = 12, ncol = 12)
LikelihoodMap[[3]] <- matrix(0.6, nrow = 12, ncol = 12)
LikelihoodMap[[4]] <- matrix(0.01, nrow = 12, ncol = 12)
LikelihoodMap[[5]] <- matrix(0.01, nrow = 12, ncol = 12)
LikelihoodMap[[6]] <- matrix(0.01, nrow = 12, ncol = 12)

StartingMatrix <- matrix(0, nrow = 12, ncol = 12)
StartingMatrix[1:12,1] <- 1
StartingMatrix[1:12,5] <- 2
StartingMatrix[1:12,10] <- 3

modelsimulator(StartingMatrix, LikelihoodMap, 10)


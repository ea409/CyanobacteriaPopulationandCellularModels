binnedversion <- function(CurrentMatrix){
melted_cormat <- melt(CurrentMatrix)

melted_cormat$Xbin <- floor((melted_cormat$Var1-1)/50)
melted_cormat$Ybin <- floor((melted_cormat$Var2-1)/50)

Final <- data.frame(Xvalue=integer(),
                    Yvalue=integer(),
                    Value=double(),
                    stringsAsFactors=FALSE)
k<-1
for (i in c(0:19)){
  for (j in c(0:19)){
    #for (s in c(0:3)){ 
    #Final[4*k-s,1]  <- i
    #Final[4*k-s,2]  <- j
    #Final[4*k-s,3]  <- sum( melted_cormat[melted_cormat$Xbin ==i & melted_cormat$Ybin ==j, c('value')]==s )
    
    #}
    
      Final[k,1]  <- i
      Final[k,2]  <- j
      Final[k,3]  <- min( melted_cormat[melted_cormat$Xbin ==i & melted_cormat$Ybin ==j, c('value')] )

    k <- k+1
    }

}
return(Final)
}

binnedversion1 <- function(CurrentMatrix){
  melted_cormat <- melt(CurrentMatrix)
  
  melted_cormat$Xbin <- floor((melted_cormat$Var1-1)/50)
  melted_cormat$Ybin <- floor((melted_cormat$Var2-1)/50)
  
  Final <- data.frame(Xvalue=integer(),
                      Yvalue=integer(),
                      Value=double(),
                      stringsAsFactors=FALSE)
  k<-1
  for (i in c(0:19)){
    for (j in c(0:19)){
      for (s in c(0:3)){
      Final[4*k-s,1]  <- i
      Final[4*k-s,2]  <- j
      Final[4*k-s,3]  <- sum( melted_cormat[melted_cormat$Xbin ==i & melted_cormat$Ybin ==j, c('value')]==s )
      
      }
      
      #Final[k,1]  <- i
      #Final[k,3]  <- mean( melted_cormat[melted_cormat$Xbin ==i & melted_cormat$Ybin ==j, c('value')] )
      #Final[k,2]  <- j
      
      k <- k+1
    }
    
  }
  return(Final)
}

j<-50
path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
ModelA <- readRDS(path)
ModelB <- readRDS(path2)

LakeSPhosphate <- read_csv("../MatlabModels/LakeSPhosphate.csv",col_names=FALSE)

Phosphate <- data.matrix(LakeSPhosphate, rownames.force = NA)
colnames(Phosphate)<- c(1:1000)
Phosphate <-binnedversion(Phosphate)
colnames(Phosphate)<- c('x', 'y', 'Phosphate')

LakeSNitrogen <- read_csv("../MatlabModels/LakeSNitrogen.csv",col_names=FALSE)

Nitrogen <- data.matrix(LakeSNitrogen, rownames.force = NA)
colnames(Nitrogen)<- c(1:1000)
Nitrogen <-binnedversion(Nitrogen)
colnames(Nitrogen)<- c('x', 'y', 'Nitrogen')
LakeSLight <- read_csv("../MatlabModels/LakeSLight.csv",col_names=FALSE)
LakeSLight<-LakeSLight^3-60

Light <- data.matrix(LakeSLight, rownames.force = NA)
colnames(Light)<- c(1:1000)
Light <-binnedversion(Light)
colnames(Light) <- c('x', 'y', 'Light')

CurrentMatrix <- ModelA[[12]]

FinalModelA <- binnedversion1(CurrentMatrix)

CurrentMatrix <- ModelB[[12]]

FinalModelB <- binnedversion1(CurrentMatrix)


ForPlotting <- cbind(FinalModelA, Light[rep(1:400, each=4),c('Light')], Nitrogen[rep(1:400, each=4),c('Nitrogen')], Phosphate[rep(1:400, each=4),c('Phosphate')] )      


colnames(ForPlotting) <- c('x', 'y', 'numberofpopulations', 'Light', 'Nitrogen', 'Phosphate')

ForPlotting$cellno <- c(1600:1) %% 4 
ForPlotting$cellno <- ForPlotting$cellno+1
  
ForPlotting$cellno <- c('Empty','Heterotroph', 'Spatial', 'Temporal')[ForPlotting$cellno]







ForPlotting1 <- cbind(FinalModelB, Light[rep(1:400, each=4),c('Light')], Nitrogen[rep(1:400, each=4),c('Nitrogen')], Phosphate[rep(1:400, each=4),c('Phosphate')] )      


colnames(ForPlotting1) <- c('x', 'y', 'numberofpopulations', 'Light', 'Nitrogen', 'Phosphate')

ForPlotting1$cellno <- c(-1:398) %% 4 

ForPlotting1$cellno <- c('Empty','Heterotroph', 'Spatial', 'Temporal')[ForPlotting1$cellno]
ggplot(ForPlotting[ForPlotting$cellno!='Empty',], aes(x=numberofpopulations, y=Phosphate, group=cellno, color=as.factor(cellno))) + geom_point(size=0.2) + scale_color_manual(values=GrandBudapest[c( 4, 2,6 )]) 






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
      k<-k+1
    }
    
  }
  return(Final)
}

k<-1
DataA <- data.frame(Xvalue=integer(),   Yvalue=integer(),   Value=double(), label=integer(), stringsAsFactors=FALSE)
DataB <-  data.frame(Xvalue=integer(),   Yvalue=integer(),   Value=double(), label=integer(), stringsAsFactors=FALSE)


for(j in c(1:20)){
  print(j)
  path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
  path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
  ModelA <- readRDS(path)
  ModelB <- readRDS(path2)
  if( j==1 ){
    PrevA <- ModelA[[1]] 
    PrevB <- ModelB[[1]]
    ColsAprev <-  binnedversion1(PrevA)
    ColsBprev <-  binnedversion1(PrevB)
    
  }
  for(i in seq(from=3, to = 12, length.out= 4) ){
    print(i)
    A <- ModelA[[i]]
    B <- ModelB[[i]]
    
    ColsA <- binnedversion1(A)
    
    
    ColsA[,3] <-  ColsA[,3] - ColsAprev[,3]
    
    ColsA$label <- k
    
    ColsB <- binnedversion1(B)
    
    
    ColsB[,3] <-  ColsB[,3] - ColsBprev[,3]
    
    ColsB$label <- k
  
    PrevA <- ModelA[[i]] 
    PrevB <- ModelB[[i]]
    ColsAprev <-  ColsA
    ColsBprev <- ColsB
    
    DataA <-rbind( ColsA, DataA) 
    DataB <- rbind( ColsB, DataB) 
      
    k <-k+1
    
  
  }
}



ForPlotting <- cbind(DataA, Light[rep(1:400, each=4,80),c('Light')], Nitrogen[rep(1:400, each=4,80),c('Nitrogen')], Phosphate[rep(1:400, each=4,80),c('Phosphate')] )      

colnames(ForPlotting) <- c('x', 'y', 'numberofpopulations', 'Label','Light', 'Nitrogen', 'Phosphate')

ForPlotting$cellno <- rep(c(1600:1) %% 4, 80)

ForPlotting$cellno <- c('Empty','Heterotroph', 'Spatial', 'Temporal')[as.factor(ForPlotting$cellno)]


ggplot(ForPlotting[ForPlotting$cellno!='Empty',], aes(x=numberofpopulations, y=Light, group=cellno, color=as.factor(cellno))) + geom_point(size=0.1) + scale_color_manual(values=GrandBudapest[c( 4, 2,6 )]) 


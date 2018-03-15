

LakeSPhosphate <- read_csv("../MatlabModels/LakeSPhosphate.csv",col_names=FALSE)
LakeSNitrogen <- read_csv("../MatlabModels/LakeSNitrogen.csv",col_names=FALSE)
LakeSLight <- read_csv("../MatlabModels/LakeSLight.csv",col_names=FALSE)
LakeSLight<-LakeSLight^3-60

finalstepmodelplotter<- function(Model, type, level, j){
  colfunc <- colorRampPalette(c("#f1bb7b","#000000"))
  pal1 <- colfunc(50)
  colfunc <- colorRampPalette(c("#a2ddd5","#225d56"))
  pal2 <- colfunc(50)
  colfunc <- colorRampPalette(c("#eea091","#6e2012"))
  pal3 <- colfunc(50)
  colfunc <- colorRampPalette(c("#adaed2","#2d2f53"))
  pal4 <- colfunc(50)
  x= list()
  for(i in c(3:12) ){
      CurrentMatrix <- Model[[i]]
      print(type)
      print(j)
      print(i)
      head(Model[[i]])
      melted_cormat <- melt(Model[[i]])
      melted_cormat[is.na(melted_cormat),]<- 0
      #melted_cormat <- melt(matrixsummation(Model[[i]]==1)+(Model[[i]]==1))
      colnames(melted_cormat) <- c('firstindex', 'secondindex', 'color')
      Stuff <- cbind(melted_cormat, melt(data.matrix(level,  rownames.force = NA)))
      
      Stuff$colorchoice <- "color"
      #Stuff$colorchoice <- pal4[4*Stuff$color+1]
      Stuff[Stuff$color==0,c('colorchoice')] <- pal1[ceiling(49/(max(level)-min(level))*(Stuff[Stuff$color==0,c('value')]-min(level)+0.001))]
      Stuff[Stuff$color==1,c('colorchoice')] <- pal2[ceiling(49/(max(level)-min(level))*(Stuff[Stuff$color==1,c('value')]-min(level)+0.001))]
      Stuff[Stuff$color==2,c('colorchoice')] <- pal3[ceiling(49/(max(level)-min(level))*(Stuff[Stuff$color==2,c('value')]-min(level)+0.001))]
      Stuff[Stuff$color==3,c('colorchoice')] <- pal4[ceiling(49/(max(level)-min(level))*(Stuff[Stuff$color==3,c('value')]-min(level)+0.001))]
      
      x[[i]]<-pixmapIndexed(data=c(1:(1000*1000)), nrow=1000, ncol=1000, col=Stuff$colorchoice,cellres=1) 
  }
  return(x)
}


for(j in c(2:50)){
  path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
  path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
  ModelA <- readRDS(path)
  ModelB <- readRDS(path2)
  type <- 'Second'
  x<- finalstepmodelplotter(ModelA, 'Second', LakeSPhosphate, j)
  for(i in c(3:12) ){png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Phosphate',type,'.png'))
    plot(x[[i]])
    dev.off()
  }
  x<- finalstepmodelplotter(ModelA, 'Second', LakeSNitrogen, j)
  for(i in c(3:12) ){
    png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Nitrogen',type,'.png'))
    plot(x[[i]])
    dev.off()
  }
  x<- finalstepmodelplotter(ModelA, 'Second', LakeSLight, j)
  for(i in c(3:12) ){png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Light',type,'.png'))
    plot(x[[i]])
    dev.off()
  }
  type <- 'First'
  x<- finalstepmodelplotter(ModelB, 'First', LakeSPhosphate, j)
  for(i in c(3:12) ){png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Phosphate',type,'.png'))
    plot(x[[i]])
    dev.off()
  }
  x<- finalstepmodelplotter(ModelB, 'First', LakeSNitrogen, j)
  for(i in c(3:12) ){png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Nitrogen',type,'.png'))
    plot(x[[i]])
    dev.off()
  }
  x<- finalstepmodelplotter(ModelB, 'First', LakeSLight, j)
  for(i in c(3:12) ){png(paste0('plot',format((i-2+10*j)/1200, nsmall=4),'Light',type,'.png'))
    plot(x[[i]])
    dev.off() 
  }
  
}

 v1<-c(1:10)
 v1[10] <- '0.01916667'
 v1[9] <- '0.01833333'
 v1[8] <- '0.0175'
 v1[7] <- '0.01666667'
 v1[6] <- '0.01583333'
 v1[5] <- '0.0150'
 v1[4] <-'0.01416667'
 v1[3] <- '0.01333333'
 v1[2] <- '0.0125'
 v1[1] <- '0.01083333'




type='Second'
level='Light'
for(j in c(1:50)){
  for(i in c(3:12) ){ v [10*(j-1) +i-2] <- paste0('plot',format((i-2+10*j)/1200, nsmall=4),level,type,'.png')
  }
}

paste0('plot',v1,level,type,'.png')
v[1:10] <- paste0('plot',v1,level,type,'.png')
paste0(v, collapse=' ')



j<-50 

path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
ModelA <- readRDS(path)
ModelB <- readRDS(path2)

melted_cormat <- melt(ModelA[[10]]==1)

ggplot(data=melted_cormat, aes(x=Var1, y=Var2)) +stat_density2d(aes(fill=..level.., geom='polygon')) + scale_colour_gradient(low="#f1bb7b",high="#000000") 

melted_cormat <- melt(ModelB[[10]])



AmountA <-data.frame(c(1:500),c(1:500),c(1:500),c(1:500),c(1:500))
AmountB <-data.frame(c(1:500),c(1:500),c(1:500),c(1:500),c(1:500))
for(j in c(1:50)){
  path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
  path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
  ModelA <- readRDS(path)
  ModelB <- readRDS(path2)
  for(i in c(3:12) ){
    CurrentMatrix <- ModelA[[i]]
    AmountA[10*(j-1) +i-2, 2] <- sum(CurrentMatrix==0)
    AmountA[10*(j-1) +i-2, 3] <- sum(CurrentMatrix==1)
    AmountA[10*(j-1) +i-2, 4] <- sum(CurrentMatrix==2)
    AmountA[10*(j-1) +i-2, 5] <- sum(CurrentMatrix==3)
    
    CurrentMatrix <- ModelB[[i]]
    AmountB[10*(j-1) +i-2, 2] <- sum(CurrentMatrix==0)
    AmountB[10*(j-1) +i-2, 3] <- sum(CurrentMatrix==1)
    AmountB[10*(j-1) +i-2, 4] <- sum(CurrentMatrix==2)
    AmountB[10*(j-1) +i-2, 5] <- sum(CurrentMatrix==3)
    
  }
}
j<-1 
path <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/Output",j,".RDS" )
path2 <- paste0("/Users/ediemaljibury/SEBminiproject/CompetitivePopulationModels/SecondOutput",j,".RDS" )
ModelA <- readRDS(path)
ModelB <- readRDS(path2)
i<-1 
CurrentMatrix <- ModelA[[i]]
AmountA[501, 2] <- sum(CurrentMatrix==0)
AmountA[501, 3] <- sum(CurrentMatrix==1)
AmountA[501, 4] <- sum(CurrentMatrix==2)
AmountA[501, 5] <- sum(CurrentMatrix==3)
AmountA[501, 1] <-0

CurrentMatrix <- ModelB[[i]]
AmountB[501, 2] <- sum(CurrentMatrix==0)
AmountB[501, 3] <- sum(CurrentMatrix==1)
AmountB[501, 4] <- sum(CurrentMatrix==2)
AmountB[501, 5] <- sum(CurrentMatrix==3)
AmountB[501, 1] <-0

colnames(AmountA) <-  c('Time', 'Empty' ,'Heterotroph', 'Spatial', 'Temporal')
GrandBudapest <- c("#009B77","#DD4124", "#D65076", "#45B8AC", "#EFC050", "#5B5EA6", "#9B2335", "#DFCFBE", "#55B4B0", "#E15D44", "#7FCDCD", "#BC243C", "#C3447A" )

GatheredA <- AmountA %>%
  gather(key='Species', Value, -Time)

attempt1 <- ggplot(data=GatheredA, aes(x=Time, y=Value, colour=Species, group=Species)) + geom_smooth() + scale_color_manual(values=GrandBudapest[c(8, 4, 2,6 )]) + ylab(label= 'Population size')

colnames(AmountB) <- c('Time', 'Empty' ,'Heterotroph', 'Spatial', 'Temporal')

GatheredB <- AmountB %>%
  gather(key='Species', Value, -Time)

attempt2 <- ggplot(data=GatheredB, aes(x=Time, y=Value, colour=Species, group=Species)) + geom_smooth() + scale_color_manual(values=GrandBudapest[c(8, 4, 2,6 )])+ ylab(label= 'Population size')
grid.arrange(attempt1, attempt2)
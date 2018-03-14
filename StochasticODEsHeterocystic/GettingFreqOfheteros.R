#p <- ggplot(hr2, aes(x = Cell, y = Value, color = Attribute))
#p + geom_line(aes(group = interaction(Attribute, as.factor(Organism))), size = 3, alpha = 0.5) + 
# geom_point(size = 3,aes(group = interaction(Attribute, as.factor(Organism)))) + 
#scale_color_manual(values = GrandBudapest)

res3 = c()

test <- filter(compiled3, Attribute == "Heterocysts" & Nlevel == "vlow")
x <- test$Value
for (i in 1:30){
  a = 1+(i-1)*20
  b = i*20
  d <- x[a:b]
  y <- which(d %in% c(1))
  y1 = c(y, 0)
  y2 = c(0,y)
  res <- y1-y2
  dims <- length(res) -1
  res2 <- res[2:dims]
  print(res2)
  res3 <- c(res2, res3)
}

yelpvlow <- as.data.frame(res3)
vlow <- as.data.frame(rep("vlow", dim(yelpvlow)[1]))
yelp1 <- bind_cols(yelpvlow, vlow)
colnames(yelp6) = c("spacing", "Nlevel")


yelpnone <- as.data.frame(res3)
none <- as.data.frame(rep("none", dim(yelpnone)[1]))
yelp2 <- bind_cols(yelpnone, none)

yelpvhigh <- as.data.frame(res3)
vhigh <- as.data.frame(rep("vhigh", dim(yelpvhigh)[1]))
yelp6 <- bind_cols(yelpvhigh, vhigh)

yelplow <- as.data.frame(res3)
low <- as.data.frame(rep("low", dim(yelplow)[1]))
yelp4 <- bind_cols(yelplow, low)

yelpmed <- as.data.frame(res3)
med <- as.data.frame(rep("med", dim(yelpmed)[1]))
yelp5 <- bind_cols(yelpmed, med)

finalyelp <- bind_rows(yelp1, yelp2, yelp3, yelp4, yelp5)
write.csv(finalyelp, "finalyelp.csv")

GrandBudapest <- c("#5B5EA6", "#DD4124","#009B77", "#EFC050", "#9B2335", "#DFCFBE","#D65076",  "#55B4B0", "#E15D44", "#7FCDCD", "#BC243C", "#C3447A" )

finalyelp2 <- filter(finalyelp, spacing>1)

TransparentGrandBudapest<-c( t_col("#009B77",per), t_col("#DD4124",per),  t_col("#D65076",per),t_col("#45B8AC"), "#EFC050", t_col("#5B5EA6",per), t_col("#9B2335",per), t_col("#DFCFBE",per), t_col("#55B4B0",per), t_col("#E15D44",per), "#7FCDCD", t_col("#BC243C",per), t_col("#C3447A",per ))

ZagrebT <- c("#dd4124", "#b0341c","#841725", "#581a0e", "#2c0d07")

p <- ggplot(finalyelp2, aes(spacing ,color = Nlevel))
p+geom_density(size = 2, binwidth = 1)  + scale_x_continuous(limits = c(1, 15))+
  scale_color_manual(values = TransparentGrandBudapest[c(1,6,3,5,11)]) 


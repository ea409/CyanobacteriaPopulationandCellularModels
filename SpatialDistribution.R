# Plotting for the miniproject:
library(dplyr)
library(ggplot2)
library(tidyr)


readin <- function(filenamein, colheading) { 
storage <- read.csv(filenamein, head = FALSE)
colnames(storage)[1:60] <- c(1:60)
sN <- gather(storage, "Organism", colheading, c(1:60))
cellnumber <- as.data.frame(rep(c(1:22), 60))
datanameout <- bind_cols(cellnumber, sN)
colnames(datanameout)[c(1,3)] <- c("Cell", colheading)
return(datanameout)
}
sN <- readin("NStoredNitrogen60.csv", "StoredNitrogen")
sC <- readin("NFixedCarbon60.csv", "FixedCarbon")
hetR <- readin("NHetR60.csv", "HetR")
patS <- readin("NPatS60.csv", "PatS")
hetN <- readin("NHetN60.csv", "HetN")
length <- readin("NLength60.csv", "Length")
oxygen <- readin("NOxygen60.csv", "Oxygen")
heterocysts <- readin("NHeterocysts60.csv", "Heterocysts")
fixednitrogen <- readin("NFixedNitrogen60.csv", "FixedNitrogen")

output1 <- right_join(sN,sC, by = c("Organism", "Cell"))
output2 <- right_join(output1,hetR, by = c("Organism", "Cell"))
output3 <- right_join(output2,patS, by = c("Organism", "Cell"))
output4 <- right_join(output3,hetN, by = c("Organism", "Cell"))
output5 <- right_join(output4,length, by = c("Organism", "Cell"))
output6 <- right_join(output5,oxygen, by = c("Organism", "Cell"))
output7 <- right_join(output6,heterocysts, by = c("Organism", "Cell"))
output8 <- right_join(output7,fixednitrogen, by = c("Organism", "Cell"))

result <- gather(output8,"Attribute", "Value", c(3:11))

#resultlow <- result
#resultmed <- result
#resulthigh <- result

#IDli <- as.data.frame(rep("low", 11880))
#resultlowi <- cbind(result, IDli)
#colnames(resultlowi)[5] <- "Nlevel"

#IDvli <- as.data.frame(rep("vlow", 11880))
#resultvlowi <- cbind(result, IDvli)
#colnames(resultvlowi)[5] <- "Nlevel"

#IDni <- as.data.frame(rep("none", 11880))
#resultnonei <- cbind(result, IDni)
#colnames(resultnonei)[5] <- "Nlevel"

#IDhi <- as.data.frame(rep("high", 11880))
#resulthighi <- cbind(result, IDhi)
#colnames(resulthighi)[5] <- "Nlevel"

#IDmi <- as.data.frame(rep("med", 11880))
#resultmedi <- cbind(result, IDmi)
#colnames(resultmedi)[5] <- "Nlevel"

#IDvhi <- as.data.frame(rep("vhigh", 11880))
#resultvhighi <- cbind(result, IDvhi)
#colnames(resultvhighi)[5] <- "Nlevel"

compiled3 <- bind_rows(resultvlowi, resultlowi, resultnonei, resultmedi, resulthighi)

compiled2 <- bind_rows(compiled, resultvhigh)

# Plotting the answers

hr <- compiled3 %>%
  filter(Attribute == "FixedNitrogen" | Attribute == "Oxygen" | Attribute == "FixedCarbon" | Attribute == "Heterocysts") %>%
  group_by(Attribute, Cell) %>%
  mutate("Amount" = sum(Value)/60) %>%
  mutate("Levels" = Value/60) 

# All species

GrandBudapest <- c( "#5B5EA6", "#DD4124","#009B77", "#EFC050", "#9B2335", "#DFCFBE","#D65076",  "#55B4B0", "#E15D44", "#7FCDCD", "#BC243C", "#C3447A" )
p <- ggplot(hr, aes(Cell, Amount, color = Attribute)) 
p + geom_line(aes(linetype = Nlevel), size = 2, alpha = 0.5) + 
geom_point(size = 2) +
  scale_color_manual(values = GrandBudapest)

# Individual Species

p <- ggplot(hr, aes(x = Cell, y = Amount, color = Attribute))
p + geom_line(aes(group = interaction(Attribute, as.factor(Organism))), size = 3, alpha = 0.5) + 
 geom_point(size = 3,aes(group = interaction(Attribute, as.factor(Organism)))) + 
scale_color_manual(values = GrandBudapest)

# stacking plots

pr <- compiled3 %>%
  filter(Attribute == "Heterocysts" | Attribute == "FixedNitrogen" | Attribute == "Oxygen") %>%
  filter(Nlevel == "none") %>%
  group_by(Attribute, Cell) %>%
  mutate("Amount" = sum(Value)/60) %>%
  mutate("Levels" = Value/60) 

p <- ggplot(pr, aes(Cell, Amount, color = Attribute))
p + geom_line(size = 2, alpha = 0.5) + 
  geom_point(size = 3) + 
  scale_color_manual(values = GrandBudapest[c(2,3,1)])

# Plotting different N levels

pr <- compiled3 %>%
  filter(Attribute == "Oxygen") %>%
  group_by(Nlevel, Attribute, Cell) %>%
  mutate("Amount" = sum(Value)/60) %>%
  mutate("Levels" = Value/60) 

Bucharest <- c("#EEA091", "#CE8071", "#AE6051", "#8E4031", "#6E2012")

Zagreb <- c("#dd4124", "#b0341c", "#841725", "#581a0e", "#2c0d07")

Istanbul <- c("#efc050", "#f0c661", "#f2cc72", "#f3d284", "#f5d996")

p <- ggplot(pr, aes(Cell, Amount, color = Nlevel))
p + geom_line(size = 2, alpha = 1)  + 
  scale_color_manual(values = Istanbul[c(1,3,2,5,4)])

# Do a color scale rather than five different


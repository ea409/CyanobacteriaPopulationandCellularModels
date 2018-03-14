library(ggplot2)
library(dplyr)
library(wesanderson)

months = as.data.frame(c(rep("Jan", 31*24), rep("Feb", 28*24), rep("Mar", 31*24), rep("April", 30*24), rep("May", 31*24), rep("Jun", 30*24), rep("Jul", 31*24), rep("Aug", 31*24), rep("Sep", 30*24), rep("Oct", 31*24), rep("Nov", 30*24), rep("Dec", 31*24)))
colnames(months) = "months"
months_3 <- rbind(months, months, months)
months3 <- months_3[c(1:26280),1]

t = as.data.frame(c(1:26280)/24)

heterotrophy <- read.csv("lowNeat2.csv", head = FALSE)
heterotropht <- read.csv("heterotropht.csv")
heterotrophy_2 <- cbind(months3, t, heterotrophy)
Name <- as.data.frame(rep("Heterotrophic", dim(heterotrophy_2)[1]))
heterotrophy_3 <- bind_cols(Name, heterotrophy_2)
colnames(heterotrophy_3) = c("Type","Month","Day","Nitrogen", "Cells", "Carbon", "Internal.Phosphate", "External.Nitrogen", "External.Phosphate")

spatialy <- read.csv("lowNspace2.csv", head = FALSE)
spatialt <- read.csv("heterotropht.csv")
spatial_2 <- cbind(months3, t, spatialy)
Name2 <- as.data.frame(rep("Spatial", dim(spatial_2)[1]))
spatial_3 <- bind_cols(Name2, spatial_2)
colnames(spatial_3) <- c("Type","Month","Day","Nitrogen", "Vegetative", "Heterocysts", "Carbon", "Internal.Phosphate", "External.Phosphate")
spatial_4 <- mutate(spatial_3, Cells = Heterocysts + Vegetative)

temporaly <- read.csv("lowNtemp2.csv", head = FALSE)
temporalt <- read.csv("temporalt.csv")
temporal_2 <- cbind(months3, t, temporaly)
Name3 <- as.data.frame(rep("Temporal", dim(temporal_2)[1]))
temporal_3 <- bind_cols(Name3, temporal_2)
colnames(temporal_3) <- c("Type","Month","Day","Nitrogen", "Cells", "Carbon", "Internal.Phosphate", "External.Phosphate")

heterotrophyw <- read.csv("eat2.csv", head = FALSE)
heterotropht <- read.csv("heterotropht.csv")
heterotrophy_2w <- cbind(months3, t, heterotrophyw)
Namew <- as.data.frame(rep("Heterotrophic2", dim(heterotrophy_2w)[1]))
heterotrophy_3w <- bind_cols(Namew, heterotrophy_2w)
colnames(heterotrophy_3w) = c("Type","Month","Day","Nitrogen", "Cells", "Carbon", "Internal.Phosphate", "External.Nitrogen", "External.Phosphate")

heterotrophyx <- read.csv("midNeat2.csv", head = FALSE)
heterotropht <- read.csv("heterotropht.csv")
heterotrophy_2x <- cbind(months3, t, heterotrophyx)
Namex <- as.data.frame(rep("Heterotrophic2x", dim(heterotrophy_2x)[1]))
heterotrophy_3x <- bind_cols(Namex, heterotrophy_2x)
colnames(heterotrophy_3x) = c("Type","Month","Day","Nitrogen", "Cells", "Carbon", "Internal.Phosphate", "External.Nitrogen", "External.Phosphate")


GrandBudapest2 <- c("#225d56", "#a2ddd5", "#009B77","#DD4124", "#D65076", "#45B8AC", "#EFC050", "#5B5EA6", "#9B2335", "#DFCFBE", "#55B4B0", "#E15D44", "#7FCDCD", "#BC243C", "#C3447A" )


result <- bind_rows(heterotrophy_3, spatial_4, temporal_3, heterotrophy_3w, heterotrophy_3x)
p <- ggplot(result, aes(Day, Cells, color  = Type))
p+geom_line(size = 1) + scale_color_manual(values=GrandBudapest2[c(1,2,6,4,8)])

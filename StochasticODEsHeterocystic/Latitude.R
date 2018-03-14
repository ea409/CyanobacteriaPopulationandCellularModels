# Phosphate Reduction

deg20 <- read.csv("20degN_L_temporal.csv")
deg32 <- read.csv("32degN_L_temporal.csv")
deg52 <- read.csv("52degN_L_temporal.csv")
deg65 <- read.csv("65degN_L_temporal.csv")
deg72 <- read.csv("72degN_L_temporal.csv")

identifier1 <- as.data.frame(rep("20N", 26279))
identifier2 <- as.data.frame(rep("32N", 26279))
identifier3 <- as.data.frame(rep("52N", 26279))
identifier4 <- as.data.frame(rep("65N", 26279))
identifier5 <- as.data.frame(rep("72N", 26279))


day = as.data.frame(1:(26279))

deg20n <- bind_cols(day/24,identifier1, deg20)
deg32n <- bind_cols(day/24,identifier2, deg32)
deg52n <- bind_cols(day/24,identifier3, deg52)
deg65n <- bind_cols(day/24, identifier4, deg65)
deg72n <- bind_cols(day/24, identifier5, deg72)


colnames(deg20n) = c("Day","North", "Nitrogen", "Cells", "Carbon", "Phosphate", "External.Phosphate")
colnames(deg32n) = c("Day","North", "Nitrogen", "Cells", "Carbon", "Phosphate", "External.Phosphate")
colnames(deg52n) = c("Day" ,"North", "Nitrogen", "Cells", "Carbon", "Phosphate", "External.Phosphate")
colnames(deg65n) = c("Day" ,"North", "Nitrogen", "Cells", "Carbon", "Phosphate", "External.Phosphate")
colnames(deg72n) = c("Day" ,"North", "Nitrogen", "Cells", "Carbon", "Phosphate", "External.Phosphate")



resultNorth <- rbind(deg20n, deg32n, deg52n, deg65n, deg72n)
resultNorth$Nitrogen <- Re(resultNorth$Nitrogen)
resultNorth$Carbon <- Re(resultNorth$Carbon)
resultNorth$Phosphate <- Re(resultNorth$Phosphate)
resultNorth$Cells <- Re(resultNorth$Cells)
resultNorth$External.Phosphate <- Re(resultNorth$External.Phosphate)

pN <- ggplot(resultNorth, aes(Day, y = Cells, color  = North))
pN+geom_point() + scale_color_manual(values = GrandBudapest)
                                     
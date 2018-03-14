output = c()
for (i in 1:15) { 
  id = paste("differentiatorcell", i, ".csv", sep ="")
  differentiator = read.csv(id, head = FALSE)
  organism = as.data.frame(rep(i, 60))
  differentiator <- bind_cols(differentiator, organism)
  colnames(differentiator) = c("StoredNitrogen", "HetR", "PatS", "HetN", "FixedNitrogen", "Time", "Organism")
  output <- bind_rows(output, differentiator)
}
product <- gather(output, "Identity", "Amount", c(1:5))

product2 <- filter(product, Organism != 1 & Organism != 5 & Organism != 6 & Organism != 7)
product3 <- filter(product2, Identity != "PatS")

GrandBudapest <- c("#DD4124","#9B2335", "#45B8AC", "#C3447A", "#D65076", "#009B77",   "#DFCFBE", "#55B4B0", "#E15D44", "#7FCDCD", "#BC243C", "#5B5EA6")

p <- ggplot(product3, aes(x = Time, y = Amount, color = Identity, group = interaction(Identity, as.factor(Organism))))
p + geom_line(size = 1, alpha = 0.5)+
  geom_point() +
  scale_color_manual(values = GrandBudapest)


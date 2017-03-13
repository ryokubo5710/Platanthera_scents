install.packages('xlsx')
install.packages('vegan')
library(rJava)
library(xlsx)
library(vegan)


#setwd("")

DF  <- read.csv("C:/Users/Claire Rusch/Desktop/OutputScriptMarie_KovatsMatchOnly70.csv", header=TRUE)

# All Orchid species but NO PINK HABANERIA
DFChem <- DF[c(1:39, 54:119),3:56]
rownames(DFChem) <- DF$Species[c(1:39, 54:119)]
nmds <- metaMDS(DFChem, k=3, trymax=200)
stressplot(nmds)
plot(nmds)


plants=c(rep("P. obtusata",39), rep("P. dilatata", 17), rep("P. huronensis", 18),  rep("P. stricta", 13), rep("P. stricta", 4), rep("P. ciliaris", 6), rep("P. yosemitensis", 3), rep("P. dilatata", 3), rep("P. dilatata", 2))
palette=c(rep("yellowgreen",39),  rep("lightblue", 17), rep("orange", 18),   rep("darkblue", 13), rep("darkblue", 4), rep("brown", 6), rep("purple", 3), rep("lightblue", 3), rep("lightblue", 2), "black")

ordiplot(nmds,type="n")
abline(h=0, v=0, lty=2)
points(nmds, disp="sites", pch=21, col="black", bg=palette, cex=1.3)
ordiellipse(nmds, plants, col="black", kind = "sd", lwd=1)
ordispider(nmds, groups=plants, col="black", label = TRUE)


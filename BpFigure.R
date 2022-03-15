## Create Histograms for Base Counts ##
require(dplyr)
require(ggplot2)
require(grid)

#Read csv
BaseCounts <- read.csv("BaseCounts.csv", header = F)

#Rename columns to be more descriptive
colnames(BaseCounts) <- c("A", "G", "C", "T")

#Rename rows to match output files from DNAnalyze.sh
rownames(BaseCounts) <- sprintf("DNAseq%03d", 1:100)

#Calculate Proportions
BaseProp <- BaseCounts %>% mutate(A = A/1000, G = G/1000, C = C/1000, T = T/1000)

#Generate Histograms
HistA <- ggplot(data = BaseProp, aes(x = A)) +
        geom_bar(fill = "#fc8d62", show.legend = FALSE) + ylab("Count") +
        theme_classic()
print(HistA)

HistG <- ggplot(data = BaseProp, aes(x = G)) +
        geom_bar(fill = "#66c2a5", show.legend = FALSE) + ylab("Count") +
        theme_classic()
print(HistG)

HistC <- ggplot(data = BaseProp, aes(x = C)) +
        geom_bar(fill = "#8da0cb", show.legend = FALSE) + ylab("Count") +
        theme_classic()
print(HistC)

HistT <- ggplot(data = BaseProp, aes(x = T)) +
        geom_bar(fill = "#e78ac3", show.legend = FALSE) + ylab("Count") +
        theme_classic()
print(HistT)

#Plot all histograms on same page and save to pdf
pdf("SimulatedBaseCounts.pdf", width = 8, height = 6)
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(2, 2)))
        print(HistA, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
        print(HistG, vp = viewport(layout.pos.row = 1, layout.pos.col = 2))
        print(HistC, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
        print(HistT, vp = viewport(layout.pos.row = 2, layout.pos.col = 2))
dev.off()



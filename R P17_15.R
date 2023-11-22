library(readxl)

mba <- read_excel("p17_15.xlsx")

set.seed(123)  # set random seed for reproducibility
k <- 3  # number of clusters
mba_clusters <- kmeans(mba[,2:8], k)

install.packages("GGally")

library(GGally)
ggpairs(mba, columns=2:8, aes(color=as.factor(mba_clusters$cluster)))

aggregate(mba[,2:8], by=list(mba_clusters$cluster), FUN=mean)

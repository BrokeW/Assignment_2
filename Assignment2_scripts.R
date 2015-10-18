#Download the datasets
T <- read.table("http://www.biostatisticien.eu/springeR/Weight_birth.csv", header=TRUE)
#filter out the smoked mom
pos.s <- which(T$SMOKE==1)
T.S <- T[pos.s,]
#filter out the non-smoked mom
pos.ns <- which(T$SMOKE==0)
T.NS <- T[pos.ns,]
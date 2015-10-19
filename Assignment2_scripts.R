#Download the datasets
T <- read.table("http://www.biostatisticien.eu/springeR/Weight_birth.csv", header=TRUE)
#filter out the smoking mom
pos.s <- which(T$SMOKE==1)
T.S <- T[pos.s,]
#filter out the non-smoking mom
pos.ns <- which(T$SMOKE==0)
T.NS <- T[pos.ns,]
#Print the mean birth weight of children born to smoking and non-smoking mothers separately
mean.weight.s <- mean(T.S[,"BWT"])
mean.weight.ns <- mean(T.NS[,"BWT"])
sprintf("The mean weight of children born to smoking mothers is mean.weight.s %s grams. The mean weight of children born to non-smoking mothers is mean.weight.ns %s grams.", mean.weight.s, mean.weight.ns)
#filter out the mothers which have had no premature births in the past, and those had one or more
pos.npre <- which(T$PTL==0)
T.NP <- T[pos.npre,]
pos.pre <- which(T$PTL>0)
T.P <- T[pos.pre,]
sd.NP <- sd(T.NP$BWT)
sd.P <- sd(T.P$BWT)
sprintf("The standard deviation of the birth weight of children born to mothers of previous premature births is sd.P %s. The standard deviation of the birth weight of children born to mothers of non-previous premature is sd.NP %s.", sd.P, sd.NP)

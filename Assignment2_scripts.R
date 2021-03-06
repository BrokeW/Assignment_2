#(1)Download the datasets
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
sprintf("The mean weight of children born to smoking mothers is %s grams. The mean weight of children born to non-smoking mothers is %s grams.", mean.weight.s, mean.weight.ns)
#filter out the mothers which have had no premature births in the past, and those had one or more
pos.npre <- which(T$PTL==0)
T.NP <- T[pos.npre,]
pos.pre <- which(T$PTL>0)
T.P <- T[pos.pre,]
#calculate the standard deviation of each
sd.NP <- sd(T.NP$BWT)
sd.P <- sd(T.P$BWT)
#Prints out the standard deviation of children born to mothers of previous premature births and mothers of non-premature births mothers
sprintf("The standard deviation of the birth weight of children born to mothers of previous premature births is %s. The standard deviation of the birth weight of children born to mothers of non-previous premature is %s.", sd.P, sd.NP)
#culculate the fraction of smoking mom who has premature births
f <- sum(T.S$PTL>0)/nrow(T.S)
sprintf("The fraction of smoking mothers which have previously had premature births is %s.", f)

#(2)define the function
myfun <- function(m1, sd1, x0, x1, N){
  sample1 <- rnorm(N, m1, sd1)
  sample2 <- runif(N, x0, x1)
  p1 <- pnorm(sample1, m1, sd1)
  p2 <- punif(sample2, x0, x1)
  x = sample1 * sample2
  px=p1*p2
  E <- sum(x*px)
  SD <- sd(x)
  sprintf("The expected value of x is %s, the standard deviation of x is %s.", E, SD)
  
  #propose a way for potential correlation between sample1 and sample2
  ##"return (cor(sample1, sample2))"
}

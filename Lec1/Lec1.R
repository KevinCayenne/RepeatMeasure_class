library(dplyr)
library(lubridate)
library(ggplot2)

bmi <- read.csv("d:/Data/Research_projeccts/狡代秖籔参璸だ猂/Lec1/BMIrepeated.csv")

x <- seq(0,9,3)
y <- cbind(bmi$BMI0, bmi$BMI1, bmi$BMI2, bmi$BMI3)

par(mfrow = c(1,2))
plot(x,y[1,],type="l",
     lwd=1,col=1,lty=1,ylim=c(15,50),
     axes = FALSE,
     xlab="months",ylab="BMI",
     main="Placebo group")
axis(1, at = x, labels = seq(0,9,3))
axis(2)

meltbmi <- melt(bmi, id = c("ID","SEX","AGE","Treatment"))
par(mfrow = c(1,2))
ggplot(meltbmi, aes(variable,value,group=ID)) +
  geom_line()

for(subj in 2:50){
  lines(x,y[subj,],lty=1,lwd=1,col=1,type="l")
}

plot(x,y[51,],type="l",
     lwd=1,col=1,lty=1,ylim=c(15,50),
     axes = FALSE,
     xlab="months",ylab="BMI",
     main="Drug group")
axis(1, at = x, labels = seq(0,9,3))
axis(2)

for(subj in 52:100){
  lines(x,y[subj,],lty=1,lwd=1,col=1,type="l")
}

############

seizure <- read.table('d:/Data/Research_projeccts/狡代秖籔参璸だ猂/Lec1/Seizure.txt')
x <- seq(0,4,1)
placebo <- seizure[seizure[,1]==0,2:6]
progabide <- seizure[seizure[,1]==1,2:6]

par(mfrow = c(1,2))
plot(x,placebo[1,],type="l",
     lwd=1,col=1,lty=1,
     ylim=c(0,max(placebo,progabide)),
     axes = FALSE,
     xlab="visit",ylab="Seizure counts",
     main="Placebo group")
axis(1, at = x, labels = seq(0,4,1))
axis(2)

for(subj in 2:nrow(placebo)){
  lines(x,placebo[subj,],lty=1,lwd=1,col=1,type="l")
}

plot(x,progabide[1,],type="l",lwd=1,col=1,lty=1,ylim=c(0,max(placebo,progabide)),axes = FALSE,xlab="visit",ylab="Seizure counts",main="Progabide group")
axis(1, at = x, labels = seq(0,4,1))
axis(2)

for(subj in 2:nrow(progabide)){
  lines(x,progabide[subj,],lty=1,lwd=1,col=1,type="l")
} 

x1 <- rep(1,8)
x2 <- rep(100,8)
x3 <- rep(1,8)
x4 <- -c(30, 31, 32, 33, 30, 31, 32, 33)
X <- as.matrix(cbind(x1,x2,x3,x4)) 
Y <- c(90, 92, 88, 90, 10, 8, 11, 9) 
I <- diag(8)

Beta <- solve(t(X)%*%X)%*%t(X)%*%Y

H <- X%*%solve(t(X)%*%X)%*%t(X)
(I-H)%*%Y

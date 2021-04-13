x<-seq(-1,1,by=0.01)
errorDev<-rnorm(length(x),0,1.1)
theta<-runif(2)
y<-2*x+3+errorDev
innerProd<-function(x,theta) {
  c(1,x)%*%theta
}
costFunction <- function(X,y,theta=c(0,0)) {
  hypMod<-tapply(X,1:length(X),function(inner) innerProd(inner,theta))
  ((y-hypMod)%*%(y-hypMod))/(2*length(X))
}
gradCostFunction<- function(X,y,theta=c(0,0)) {
  hypMod<-tapply(X,1:length(X),function(inner) innerProd(inner,theta))
  c(sum(hypMod-y)/length(X),((hypMod-y)%*%X)/length(X))
}
graDDescent<- function(x,y,theta=c(0,0),alpha=1,numStep=1){
  for (ith in 1:numStep) {
    theta<-theta-alpha*gradCostFunction(x,y,theta)   
  }
  theta
}



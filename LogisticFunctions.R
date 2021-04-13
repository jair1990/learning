sigmoidFunction <- function(X) {
  1/(1+exp(-X))
}
logCostFunction<- function(X,y,theta=rep(0,dim(X)[2]),lambda=0) {
  hypMod<-sigmoidFunction(X%*%theta) 
  (0.5*lambda*sum(X[,2:ncol(X)]*X[,2:ncol(X)])-y%*%log(hypMod)-(1-y)%*%log(1-hypMod))/(dim(X)[1])
}

gradLogCostFunction<- function(X,y,theta=rep(0,dim(X)[2]),lambda=0) {
  hypMod<-sigmoidFunction(X%*%theta)
  (lambda*c(0,theta[2:length(theta)])+(t(X)%*%(hypMod-y)))/dim(X)[1]
}

graDDescentLog<- function(x,y,theta=rep(0,dim(x)[2]),alpha=1,lambda=0,numStep=1){
  for (ith in 1:numStep) {
    theta<-theta-alpha*gradLogCostFunction(x,y,theta=theta,lambda=lambda)   
  }
  as.vector(theta)
}

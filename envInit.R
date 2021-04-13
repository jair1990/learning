
#Initializiing environment multiple features...

m<-1000
x_0<-rep(1,m)
x_1<-rnorm(m,0,0.1)
x_2<-rnorm(m,0,0.1)
XTest=cbind(x_0,x_1,x_2)
dimnames(XTest)<-NULL
errorTest<-rnorm(m,0,1)
theta<-c(0,2,4)
yTest<-as.vector(XTest%*%theta)+errorTest
myDataTest<-cbind(x_1,x_2,yTest)
dimnames(myDataTest)<-NULL
theta<-runif(3)


##Initializing environment logistic Regression...

#m<-1000
#x_0<-rep(1,m)
#x_1<-rnorm(m,0,0.1)
#x_2<-rnorm(m,0,0.1)
#XTest=cbind(x_0,x_1,x_2)
#dimnames(XTest)<-NULL
#errorTest<-rnorm(2,0,0.3)
#theta<-c(0,2,4)
#preYTest<-sigmoidFunction(XTest%*%theta)
#yTest<-rep(0,length(preYTest))
#yTest[preYTest>0.75]=1
#yTest<-as.vector(XTest%*%theta)+errorTest
#theta<-runif(3)

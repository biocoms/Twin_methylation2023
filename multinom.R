
library(nnet)


#Discordance multinomial logistic regression

#working code
sdata3 <- read.table("~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR_clogit.txt", header=T, sep="\t",row.names=1)
str(sdata3)
sdata <- read.table("../MZClClp_SampleInfo.txt", header=T, sep="\t",row.names=1)

results<-matrix(nrow=736848,ncol=6)
resultsNames<-matrix(nrow=736848,ncol=6)

for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1]-sdata3[i,25],0,sdata3[i,2]-sdata3[i,26],0,sdata3[i,3]-sdata3[i,27],0,sdata3[i,4]-sdata3[i,28],0,sdata3[i,5]-sdata3[i,29],0,sdata3[i,6]-sdata3[i,30],0,sdata3[i,7]-sdata3[i,31],0,sdata3[i,8]-sdata3[i,32],0,sdata3[i,9]-sdata3[i,33],0,sdata3[i,10]-sdata3[i,34],0,sdata3[i,11]-sdata3[i,35],0,sdata3[i,12]-sdata3[i,36],0,sdata3[i,13]-sdata3[i,37],0,sdata3[i,14]-sdata3[i,38],0,sdata3[i,15]-sdata3[i,39],0,sdata3[i,16]-sdata3[i,40],0,sdata3[i,17]-sdata3[i,41],0,sdata3[i,18]-sdata3[i,42],0,sdata3[i,19]-sdata3[i,43],0,sdata3[i,20]-sdata3[i,44],0,sdata3[i,21]-sdata3[i,45],0,sdata3[i,22]-sdata3[i,46],0,sdata3[i,23]-sdata3[i,47],0,sdata3[i,24]-sdata3[i,48],0)
  test3<-test2[1,]
  sdata$cg10871096<-test3
  sdata$Cleft_Type3 <- relevel(factor(sdata$Cleft_Type), ref = "Ctl")
  test2 <- multinom(Cleft_Type3 ~ cg10871096+Sex + Age+Demographic , data = sdata)
  #summary(test2)
  #print(summary(test2))
  z <- summary(test2)$coefficients/summary(test2)$standard.errors
  p <- (1 - pnorm(abs(z), 0, 1)) * 2
  #print(i)
  results[i,1:6]<-p[1:6]
  resultsNames[i,1:6]<-names(p)
}
str(results)
str(resultsNames)
resultsNames[1,]
resultsNames[735650,]
resultsNames[,2]<-rownames(sdata3)
input <- read.table("~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR_clogit.txt", header=T, sep="\t",row.names=1)
pvalgene <- data.frame(results)
output <- data.frame(cbind(input, pvalgene))
rownames(output)<-rownames(sdata3)
colnames(output) <- c(colnames(input),names(p))
names(p)
str(names(p))
names(p)[2]<-"Methylation"
colnames(output) <- c(colnames(input),names(p))
# resultsNames<-as.data.frame(resultsNames)
# rownames(resultsNames)<-rownames(sdata3)
write.table(output,file="~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR_clogit_multinom.txt",quote=FALSE,sep="\t",row.names=TRUE)


#Concordance
#working code
sdata3 <- read.table("~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR_clogit.txt", header=T, sep="\t",row.names=1)
str(sdata3)
sdata <- read.table("../MZClClp_Concordant_SampleInfo.txt", header=T, sep="\t",row.names=1)

results<-matrix(nrow=736848,ncol=5)
resultsNames<-matrix(nrow=736848,ncol=5)

for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1]-sdata3[i,9],0,sdata3[i,2]-sdata3[i,10],0,sdata3[i,3]-sdata3[i,11],0,sdata3[i,4]-sdata3[i,12],0,sdata3[i,5]-sdata3[i,13],0,sdata3[i,14]-sdata3[i,6],0,sdata3[i,7]-sdata3[i,15],0,sdata3[i,8]-sdata3[i,16],0)
  test3<-test2[1,]
  sdata$cg10871096<-test3
  sdata$Cleft_Type3 <- relevel(factor(sdata$Cleft_Type2), ref = "0")
  test2 <- multinom(Cleft_Type3 ~ cg10871096+Sex + Age1+Demographic , data = sdata)
  #summary(test2)
  #print(summary(test2))
  z <- summary(test2)$coefficients/summary(test2)$standard.errors
  p <- (1 - pnorm(abs(z), 0, 1)) * 2
  #print(i)
  results[i,1:5]<-p[1:5]
  resultsNames[i,1:5]<-names(p)
}
str(results)
str(resultsNames)
resultsNames[1,]
resultsNames[735650,]
resultsNames[,2]<-rownames(sdata3)
input <- read.table("~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR_clogit.txt", header=T, sep="\t",row.names=1)
pvalgene <- data.frame(results)
output <- data.frame(cbind(input, pvalgene))
rownames(output)<-rownames(sdata3)
colnames(output) <- c(colnames(input),names(p))
names(p)
str(names(p))
names(p)[2]<-"Methylation"
colnames(output) <- c(colnames(input),names(p))
write.table(output,file="~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR_clogit_multinom.txt",quote=FALSE,sep="\t",row.names=TRUE)

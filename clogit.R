
library(survival)


#Discordance
sdata3 <- read.table("~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR.txt", header=T, sep="\t",row.names=1)
results<-matrix(nrow=736848,ncol=1)

#Read sample table
sdata <- read.table("../MZClClp_SampleInfo.txt", header=T, sep="\t",row.names=1)

for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1],sdata3[i,25],sdata3[i,2],sdata3[i,26],sdata3[i,3],sdata3[i,27],sdata3[i,4],sdata3[i,28],sdata3[i,5],sdata3[i,29],sdata3[i,6],sdata3[i,30],sdata3[i,7],sdata3[i,31],sdata3[i,8],sdata3[i,32],sdata3[i,9],sdata3[i,33],sdata3[i,10],sdata3[i,34],sdata3[i,11],sdata3[i,35],sdata3[i,12],sdata3[i,36],sdata3[i,13],sdata3[i,37],sdata3[i,14],sdata3[i,38],sdata3[i,15],sdata3[i,39],sdata3[i,16],sdata3[i,40],sdata3[i,17],sdata3[i,41],sdata3[i,18],sdata3[i,42],sdata3[i,19],sdata3[i,43],sdata3[i,20],sdata3[i,44],sdata3[i,21],sdata3[i,45],sdata3[i,22],sdata3[i,46],sdata3[i,23],sdata3[i,47],sdata3[i,24],sdata3[i,48])
  test3<-test2[1,]
  sdata$cg10871096<-test3
  test<-summary(clogit(as.numeric(sdata$Cleft_Type2) ~ sdata$cg10871096+sdata$Sex+sdata$Demographic+sdata$Age + strata(sdata$Sample)))
  #print(i)
  #print(sdata)
  #print(test)
  #rownames(sdata3[i,])
  results[i,1]<-test$coefficients[1,5]
  #rownames(results[i,]) <-rownames(sdata3[i,])
}
str(results)
str(sdata3)
rownames(results) <-rownames(sdata3)
str(sdata3)
str(results)
procs <- c("Bonferroni", "BH","BY")
pvalues<-results
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
str(adjpgenotype)
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")
rownames(results) <-rownames(sdata3)
output <- data.frame(cbind(sdata3,pvalgene))
rownames(output)<-rownames(sdata3)
colnames(output) <- c(colnames(sdata3),"Rawp_logit","Bonferroni_logit","BH_logit","BY_logit")
write.table(output,file="~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR_clogit.txt",quote=FALSE,sep="\t",row.names=TRUE)
str(sdata)
str(sdata3)

#Concordance data
sdata3 <- read.table("~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR.txt", header=T, sep="\t",row.names=1)
results<-matrix(nrow=736848,ncol=1)

#Read sample table
sdata <- read.table("../MZClClp_Concordant_SampleInfo.txt", header=T, sep="\t",row.names=1)

for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1],sdata3[i,9],sdata3[i,2],sdata3[i,10],sdata3[i,3],sdata3[i,11],sdata3[i,4],sdata3[i,12],sdata3[i,5],sdata3[i,13],sdata3[i,14],sdata3[i,6],sdata3[i,7],sdata3[i,15],sdata3[i,8],sdata3[i,16])
  test3<-test2[1,]
  sdata$cg10871096<-test3
  test<-summary(clogit(as.numeric(sdata$Cleft_Type2) ~ sdata$cg10871096+sdata$Sex+sdata$Demographic+sdata$Age + strata(sdata$Sample)))
  results[i,1]<-test$coefficients[1,5]
}
str(results)
str(sdata3)
rownames(results) <-rownames(sdata3)
str(sdata3)
str(results)
procs <- c("Bonferroni", "BH","BY")
pvalues<-results
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
str(adjpgenotype)
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")
rownames(results) <-rownames(sdata3)
output <- data.frame(cbind(sdata3,pvalgene))
rownames(output)<-rownames(sdata3)
colnames(output) <- c(colnames(sdata3),"Rawp_logit","Bonferroni_logit","BH_logit","BY_logit")
write.table(output,file="~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR_clogit.txt",quote=FALSE,sep="\t",row.names=TRUE)
str(sdata)
str(sdata3)




library(mztwinreg)


#mztwinreg for discordance 
sdata3 <- read.table("~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest.txt", header=T, sep="\t",row.names=1)
results<-matrix(nrow=736848,ncol=4)
resultsNames<-matrix(nrow=736848,ncol=4)
sdata <- read.table("MZClClp_SampleInfo.txt", header=T, sep="\t",row.names=1)
sdata3

logis_pval <- function(x){
  tryCatch(
    expr = {
      anova(x)
    },
    error = function(e){
      message('Caught an error!')
      print(e)
    },
    warning = function(w){
      message('Caught an warning!')
      print(w)
    },
    finally = {
    }
  )
}


for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1],sdata3[i,25],sdata3[i,2],sdata3[i,26],sdata3[i,3],sdata3[i,27],sdata3[i,4],sdata3[i,28],sdata3[i,5],sdata3[i,29],sdata3[i,6],sdata3[i,30],sdata3[i,7],sdata3[i,31],sdata3[i,8],sdata3[i,32],sdata3[i,9],sdata3[i,33],sdata3[i,10],sdata3[i,34],sdata3[i,11],sdata3[i,35],sdata3[i,12],sdata3[i,36],sdata3[i,13],sdata3[i,37],sdata3[i,14],sdata3[i,38],sdata3[i,15],sdata3[i,39],sdata3[i,16],sdata3[i,40],sdata3[i,17],sdata3[i,41],sdata3[i,18],sdata3[i,42],sdata3[i,19],sdata3[i,43],sdata3[i,20],sdata3[i,44],sdata3[i,21],sdata3[i,45],sdata3[i,22],sdata3[i,46],sdata3[i,23],sdata3[i,47],sdata3[i,24],sdata3[i,48])
  test3<-test2[1,]
  sdata$Meth<-test3
  #linear regression tests wheter the intrapair differneces in Cleptype of a given twin pair are predicted by its differences in factors
  test4<-logis_pval(fam_env(Cleft_Type2 ~ Meth + Sex + Demographic + Age, regression="logistic",data=sdata ))
  if(is_empty(dim(test4))){
    results[i,1:4]<-cbind(1,1,1,1)
    resultsNames[i,1:4]<-cbind("Meth","Sex","Demographic","Age")
  } else{
    write.table(test4,file="testResults2.txt",quote=FALSE,sep="\t",row.names=TRUE)
    test5<-read.table(file="testResults2.txt")
    results[i,1:4]<-test5$P[1:4]
    resultsNames[i,1:4]<-rownames(test5)[1:4]
  }
}

output <- cbind(sdata3,results)
colnames(output) <- c(colnames(sdata3),"Meth","Sex","Demographic","Age")
rownames(output) <- rownames(sdata3)
write.table(output,file="~/Documents/Projects/meth_twin/RefBase/Discordance_RefBase_Ttest_LR.txt",quote=FALSE,sep="\t",row.names=TRUE)

#mztwinreg for concordance
sdata3 <- read.table("~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest.txt", header=T, sep="\t",row.names=1)
results<-matrix(nrow=736848,ncol=4)
resultsNames<-matrix(nrow=736848,ncol=4)
sdata <- read.table("MZClClp_Concordant_SampleInfo.txt", header=T, sep="\t",row.names=1)


logis_pval <- function(x){
  tryCatch(
    expr = {
      anova(x)
    },
    error = function(e){
      message('Caught an error!')
      print(e)
    },
    warning = function(w){
      message('Caught an warning!')
      print(w)
    },
    finally = {
    }
  )
}

for (i in 1:dim(sdata3)[1]) {
  test2<-cbind(sdata3[i,1],sdata3[i,9],sdata3[i,2],sdata3[i,10],sdata3[i,3],sdata3[i,11],sdata3[i,4],sdata3[i,12],sdata3[i,5],sdata3[i,13],sdata3[i,14],sdata3[i,6],sdata3[i,7],sdata3[i,15],sdata3[i,8],sdata3[i,16])
  test3<-test2[1,]
  sdata$Meth<-test3
  test4<-logis_pval(fam_env(Cleft_Type2 ~ Meth + Sex + Demographic + Age, regression="logistic",data=sdata ))
  if(is_empty(dim(test4)))
  {
    results[i,1:4]<-cbind(1,1,1,1)
    resultsNames[i,1:4]<-cbind("Meth","Sex","Demographic","Age")
  } 
  else
  {
    write.table(test4,file="testResults2.txt",quote=FALSE,sep="\t",row.names=TRUE)
    test5<-read.table(file="testResults2.txt")
    results[i,1:4]<-test5$P[1:4]
    resultsNames[i,1:4]<-rownames(test5)[1:4]
  }
}

output <- cbind(sdata3,results)
colnames(output) <- c(colnames(sdata3),"Meth","Sex","Demographic","Age")
rownames(output) <- rownames(sdata3)
write.table(output,file="~/Documents/Projects/meth_twin/QN+RefBase/Concordance_QN_RefBase_Ttest_LR.txt",quote=FALSE,sep="\t",row.names=TRUE)







library("GenomicFeatures")
library(gtsummary)
library(rms)
library(mztwinreg)
library("netgwas")
library(tidyverse)
library(ChAMP)
library(shinyMethyl)
library(minfi)

library(wateRmelon)
library(multtest)

#RefBase
#bdata3 <- read.table("~/Documents/Projects/meth_twin/Blood_data_processing/ComBat_RefBase.txt", header=T, sep="\t",row.names=1)

#EpiDish
bdata3 <- read.table("~/Documents/Projects/meth_twin/Blood_data_processing/ComBat_EpiDish.txt", header=T, sep="\t",row.names=1)



# Discordance without Quantile Norm(QN) Mvalue

mzClpA<-cbind(bdata3[,1],bdata3[,3],bdata3[,5],bdata3[,7],bdata3[,9],bdata3[,12],bdata3[,13],bdata3[,15],bdata3[,17],bdata3[,19],bdata3[,21],bdata3[,23],bdata3[,25],bdata3[,27],bdata3[,29],bdata3[,31],bdata3[,47],bdata3[,51],bdata3[,53],bdata3[,61],bdata3[,69],bdata3[,75],bdata3[,78],bdata3[,79])
mzClpU<-cbind(bdata3[,2],bdata3[,4],bdata3[,6],bdata3[,8],bdata3[,10],bdata3[,11],bdata3[,14],bdata3[,16],bdata3[,18],bdata3[,20],bdata3[,22],bdata3[,24],bdata3[,26],bdata3[,28],bdata3[,30],bdata3[,32],bdata3[,48],bdata3[,52],bdata3[,54],bdata3[,62],bdata3[,70],bdata3[,76],bdata3[,77],bdata3[,80])

MZmet.Beta<-cbind(mzClpA,mzClpU)
#convert beta value to M-value
MZmet.Mvalue <- beta2m(MZmet.Beta)
MZmet.Mvalue[is.na(MZmet.Mvalue)]<--10

boxplot(MZmet.Mvalue)



#paired ttest for Discordance without QN
MZdiff<-MZmet.Mvalue[,1:24]-MZmet.Mvalue[,25:48] #look at the different of beta value between affected and unaffected 
aot<-function(x) {t.test(x[1:24],mu=0)$p.value}
ttestresults<-apply(MZdiff,1,aot)
procs <- c("Bonferroni", "BH","BY")
pvalues<-ttestresults
str(pvalues)
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
str(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")

output <- data.frame(cbind(MZmet.Mvalue[,1:24],MZmet.Mvalue[,25:48],pvalgene))
rownames(output)<-rownames(bdata3)
colnames(output) <- c(colnames(bdata3)[1],colnames(bdata3)[3],colnames(bdata3)[5],colnames(bdata3)[7],colnames(bdata3)[9],colnames(bdata3)[12],colnames(bdata3)[13],colnames(bdata3)[15],colnames(bdata3)[17],colnames(bdata3)[19],colnames(bdata3)[21],colnames(bdata3)[23],colnames(bdata3)[25],colnames(bdata3)[27],colnames(bdata3)[29],colnames(bdata3)[31],colnames(bdata3)[47],colnames(bdata3)[51],colnames(bdata3)[53],colnames(bdata3)[61],colnames(bdata3)[69],colnames(bdata3)[75],colnames(bdata3)[78],colnames(bdata3)[79],
                      colnames(bdata3)[2],colnames(bdata3)[4],colnames(bdata3)[6],colnames(bdata3)[8],colnames(bdata3)[10],colnames(bdata3)[11],colnames(bdata3)[14],colnames(bdata3)[16],colnames(bdata3)[18],colnames(bdata3)[20],colnames(bdata3)[22],colnames(bdata3)[24],colnames(bdata3)[26],colnames(bdata3)[28],colnames(bdata3)[30],colnames(bdata3)[32],colnames(bdata3)[48],colnames(bdata3)[52],colnames(bdata3)[54],colnames(bdata3)[62],colnames(bdata3)[70],colnames(bdata3)[76],colnames(bdata3)[77],colnames(bdata3)[80],"Rawp","Bonferroni","BH","BY")

write.table(output,file="~/Documents/Projects/meth_twin/EpiDish/Discordance_EpiDish_Ttest.txt",quote=FALSE,sep="\t",row.names=TRUE)



# Discordance with QN Mvalue


MZmet.norm.Beta <- betaqn(MZmet.Beta)
MZmet.norm.Mvalue <- beta2m(MZmet.norm.Beta)
MZmet.norm.Mvalue[is.na(MZmet.norm.Mvalue)]<--10

boxplot(MZmet.norm.Mvalue)

#paired t-test
MZdiff<-MZmet.norm.Mvalue[,1:24]-MZmet.norm.Mvalue[,25:48]
aot<-function(x) {t.test(x[1:24],mu=0)$p.value}
ttestresults<-apply(MZdiff,1,aot)
procs <- c("Bonferroni", "BH","BY")
pvalues<-ttestresults
str(pvalues)
#adjust p-value for multiple testing procedures
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
str(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")

output <- data.frame(cbind(MZmet.norm.Mvalue[,1:24],MZmet.norm.Mvalue[,25:48],pvalgene))
rownames(output)<-rownames(bdata3)
colnames(output) <- c(colnames(bdata3)[1],colnames(bdata3)[3],colnames(bdata3)[5],colnames(bdata3)[7],colnames(bdata3)[9],colnames(bdata3)[12],colnames(bdata3)[13],colnames(bdata3)[15],colnames(bdata3)[17],colnames(bdata3)[19],colnames(bdata3)[21],colnames(bdata3)[23],colnames(bdata3)[25],colnames(bdata3)[27],colnames(bdata3)[29],colnames(bdata3)[31],colnames(bdata3)[47],colnames(bdata3)[51],colnames(bdata3)[53],colnames(bdata3)[61],colnames(bdata3)[69],colnames(bdata3)[75],colnames(bdata3)[78],colnames(bdata3)[79],
                      colnames(bdata3)[2],colnames(bdata3)[4],colnames(bdata3)[6],colnames(bdata3)[8],colnames(bdata3)[10],colnames(bdata3)[11],colnames(bdata3)[14],colnames(bdata3)[16],colnames(bdata3)[18],colnames(bdata3)[20],colnames(bdata3)[22],colnames(bdata3)[24],colnames(bdata3)[26],colnames(bdata3)[28],colnames(bdata3)[30],colnames(bdata3)[32],colnames(bdata3)[48],colnames(bdata3)[52],colnames(bdata3)[54],colnames(bdata3)[62],colnames(bdata3)[70],colnames(bdata3)[76],colnames(bdata3)[77],colnames(bdata3)[80],"Rawp","Bonferroni","BH","BY")

write.table(output,file="~/Documents/Projects/meth_twin/QN+EpiDish/Discordance_QN_EpiDish_Ttest.txt",quote=FALSE,sep="\t",row.names=TRUE)



#MZClClp_Concordant without QN
#Assign affected to unaffected to make concordant twin as an control group to compare with disconcordant twin
mzConClpA<-cbind(bdata3[,33],bdata3[,35],bdata3[,37],bdata3[,39],bdata3[,41],bdata3[,57],bdata3[,59],bdata3[,89])
mzConClpU<-cbind(bdata3[,34],bdata3[,36],bdata3[,38],bdata3[,40],bdata3[,42],bdata3[,58],bdata3[,60],bdata3[,90])

MZConmet.Beta<-cbind(mzConClpA,mzConClpU)


MZConmet.Mvalue <- beta2m(MZConmet.Beta)
MZConmet.Mvalue[is.na(MZConmet.Mvalue)]<--10

boxplot(MZConmet.Mvalue)

#paired t-test
MZCondiff<-MZConmet.Mvalue[,1:8]-MZConmet.Mvalue[,9:16]
aot<-function(x) {t.test(x[1:8],mu=0)$p.value}
ttestresults<-apply(MZCondiff,1,aot)
procs <- c("Bonferroni", "BH","BY")
pvalues<-ttestresults
str(pvalues)
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
str(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")

output <- data.frame(cbind(MZConmet.Mvalue[,1:8],MZConmet.Mvalue[,9:16],pvalgene))
rownames(output)<-rownames(bdata3)
colnames(output) <- c(colnames(bdata3)[33],colnames(bdata3)[35],colnames(bdata3)[37],colnames(bdata3)[39],colnames(bdata3)[41],colnames(bdata3)[57],colnames(bdata3)[59],colnames(bdata3)[89],
                      colnames(bdata3)[34],colnames(bdata3)[36],colnames(bdata3)[38],colnames(bdata3)[40],colnames(bdata3)[42],colnames(bdata3)[58],colnames(bdata3)[60],colnames(bdata3)[90],"Rawp","Bonferroni","BH","BY")

write.table(output,file="~/Documents/Projects/meth_twin/EpiDish/Concordance_EpiDsh_Ttest.txt",quote=FALSE,sep="\t",row.names=TRUE)





#MZClClp_Concordant afterNor
#paired ttest with QN
MZConmet.norm.Beta <- betaqn(MZConmet.Beta)
MZConmet.norm.Mvalue <- beta2m(MZConmet.norm.Beta)
MZConmet.norm.Mvalue[is.na(MZConmet.norm.Mvalue)]<--10


boxplot(MZConmet.norm.Mvalue)
#paired ttest
MZCondiff<-MZConmet.norm.Mvalue[,1:8]-MZConmet.norm.Mvalue[,9:16]
aot<-function(x) {t.test(x[1:8],mu=0)$p.value}
ttestresults<-apply(MZCondiff,1,aot)
procs <- c("Bonferroni", "BH","BY")
pvalues<-ttestresults
str(pvalues)
resgenotype <- mt.rawp2adjp(t(pvalues),procs)
adjpgenotype <- resgenotype$adjp[order(resgenotype$index),]
pvalgene <- cbind(adjpgenotype)
pvalgene <- data.frame(pvalgene)
str(pvalgene)
colnames(pvalgene) <- c("Rawp","Bonferroni","BH","BY")

output <- data.frame(cbind(MZConmet.norm.Mvalue[,1:8],MZConmet.norm.Mvalue[,9:16],pvalgene))
rownames(output)<-rownames(bdata3)
colnames(output) <- c(colnames(bdata3)[33],colnames(bdata3)[35],colnames(bdata3)[37],colnames(bdata3)[39],colnames(bdata3)[41],colnames(bdata3)[57],colnames(bdata3)[59],colnames(bdata3)[89],
                      colnames(bdata3)[34],colnames(bdata3)[36],colnames(bdata3)[38],colnames(bdata3)[40],colnames(bdata3)[42],colnames(bdata3)[58],colnames(bdata3)[60],colnames(bdata3)[90],"Rawp","Bonferroni","BH","BY")


write.table(output,file="~/Documents/Projects/meth_twin/QN+EpiDish/Concordance_QN_EpiDish_Ttest.txt",quote=FALSE,sep="\t",row.names=TRUE)


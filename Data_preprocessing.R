#Procedure normalization
library(tidyverse)
library(ChAMP)
library(shinyMethyl)
library(minfi)
library(wateRmelon)
library("EpiDISH")
library("TCA")

#Load idat file
myLoad <- champ.load(directory = "~/Documents/Projects/meth_twin/iDAT_files Blood", method= "minfi", force = TRUE, arraytype="EPIC")
champ.QC()

#write.csv(myLoad$beta, "~/Documents/Projects/meth_twin/Blood_data_processing/myLoad_Output_Blood.csv", quote = FALSE, row.names = TRUE)

#Normalization using ChAMP
myNorm <- champ.norm(beta=myLoad$beta, plotBMIQ = TRUE, arraytype = "EPIC", core=5)
champ.SVD(beta=myNorm %>% as.data.frame(), pd=myLoad$pd)

#Quality Control 
champ.QC(beta = myNorm, pheno=myLoad$pd$Sample_Group)
write.table(myNorm,"~/Documents/Projects/meth_twin/Blood_data_processing/myNorm_Champ.Norm.txt",sep = "\t",row.names=TRUE)

#Batch correction using ComBat
myCombat <- champ.runCombat(beta=myNorm,pd=myLoad$pd,batchname=c("Slide"))


champ.SVD(beta=myCombat %>% as.data.frame(),pd=myLoad$pd)
dim(myCombat)
write.table(myCombat,"~/Documents/Projects/meth_twin/Blood_data_processing/myCombat_Blood.txt",quote=FALSE,row.names=TRUE)

#celltype deconvolution
##1. Refbase
myRefBase <- champ.refbase(beta = myCombat, arraytype ="EPIC")
print(myRefBase)
write.table(myRefBase$CorrectedBeta,"~/Documents/Projects/meth_twin/Blood_data_processing/ComBat_RefBase.txt",sep = "\t",row.names=TRUE)

boxplot(myRefBase$CellFraction)
write.csv(myRefBase$CellFraction,"~/Documents/Projects/meth_twin/Blood_data_processing/myRefBase$CellFraction.csv",quote=FALSE,row.names=TRUE)
#run SVD for RefBase blood
champ.SVD(beta=myRefBase$CorrectedBeta)
champ.QC(beta = myRefBase$CorrectedBeta)

##2. EpiDish
#bdata <- read.table("../myCombat_Array_Blood.txt", header=T, sep="\t",row.names=1)
#str(bdata)
BloodFrac<- epidish(beta.m = myCombat, ref.m = centDHSbloodDMC.m, method = "RPC")
#str(BloodFrac)
write.csv(BloodFrac$estF,"~/Documents/Projects/meth_twin/Blood_data_processing/BloodFrac$estF.csv",quote=FALSE,row.names=TRUE)
boxplot(BloodFrac$estF)
#using TCA for linear regression
bdata_after<-tca(myCombat,BloodFrac$estF)
#str(bdata_after)
#W for n and k weight, mus_hat fior the mean of each source in each feature
bdata2<-bdata_after$mus_hat %*% t(bdata_after$W) 
#str(bdata2)
#write.table(bdata2,"../bdata2.txt",sep = "\t",row.names=TRUE)
bdata3<-as.data.frame(bdata2)
#str(bdata3)
rownames(bdata3)<-rownames(myCombat)
#str(bdata3)
write.table(bdata3,file="~/Documents/Projects/meth_twin/Blood_data_processing/ComBat_EpiDish.txt",quote=FALSE,sep="\t",row.names=TRUE)



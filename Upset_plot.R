df1<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_t-test_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df1 <- df1[['X0']]

df2 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_t-test_p-val_less_than_0.05.txt",
                  header = TRUE, sep = '\t')
df2 <- df2[['X0']]

df3<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_t-test_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df3 <- df3[['X0']]

df4 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_t-test_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df4 <- df4[['X0']]

df5<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_Logisreg_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df5 <- df5[['X0']]

df6 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_logisreg_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df6 <- df6[['X0']]
#
df7<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_RefBase_BeforeNor_Logisreg_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df7 <- df7[['X0']]

df8 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_Refbase_AfterNor_Logisreg_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df8 <- df8[['X0']]

df9<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_clogit_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df9 <- df9[['X']]

df10 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_clogit_p-val_less_than_0.05.txt",
                  header = TRUE, sep = '\t')
df10 <- df10[['X']]

df11<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_clogit_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df11 <- df11[['X']]

df12 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_clogit_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df12 <- df12[['X']]

df13<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_multinom_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df13 <- df13[['X']]

df14 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_multinom_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df14 <- df14[['X']]

df15<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_multinom_p-val_less_than_0.05.txt',
                header = TRUE, sep = '\t')
df15 <- df15[['X']]

df16 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt',
                  header = TRUE, sep = '\t')
df16 <- df16[['X']]

# 
# # ###
# df1<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_t-test_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                 header = TRUE, sep = '\t')
# df1 <- df1[['X']]
# 
# df2 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_t-test_p-val_less_than_0.05_annotated_first7000_hg38.txt",
#                   header = TRUE, sep = '\t')
# df2 <- df2[['X']]
# 
# df3<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_t-test_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                 header = TRUE, sep = '\t')
# df3 <- df3[['X']]
# 
# df4 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_t-test_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                   header = TRUE, sep = '\t')
# df4 <- df4[['X']]
# 
# df5<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_Logisreg_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                 header = TRUE, sep = '\t')
# df5 <- df5[['X']]
# 
# df6 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_Logisreg_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                   header = TRUE, sep = '\t')
# df6 <- df6[['X']]
# 
# df7<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_Logisreg_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                 header = TRUE, sep = '\t')
# df7 <- df7[['X']]
# 
# df8 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_Logisreg_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                   header = TRUE, sep = '\t')
# df8 <- df8[['X']]
# 
# df9<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_clogit_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                 header = TRUE, sep = '\t')
# df9 <- df9[['X']]
# 
# df10 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_clogit_p-val_less_than_0.05_annotated_first7000_hg38.txt",
#                    header = TRUE, sep = '\t')
# df10 <- df10[['X']]
# 
# df11<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_clogit_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                  header = TRUE, sep = '\t')
# df11 <- df11[['X']]
# 
# df12 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_clogit_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                    header = TRUE, sep = '\t')
# df12 <- df12[['X']]
# 
# df13<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_multinom_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                  header = TRUE, sep = '\t')
# df13 <- df13[['X']]
# 
# df14 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_multinom_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                    header = TRUE, sep = '\t')
# df14 <- df14[['X']]
# 
# df15<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_multinom_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                  header = TRUE, sep = '\t')
# df15 <- df15[['X']]
# 
# df16 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_multinom_p-val_less_than_0.05_annotated_first7000_hg38.txt',
#                    header = TRUE, sep = '\t')
# df16 <- df16[['X']]
# 
# #
# df1<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_t-test_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df1<- df1[df1$Rawp<0.01,]
# df1 <- df1[['X0']]
# 
# df2 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_t-test_p-val_less_than_0.05.txt",
#                   header = TRUE, sep = '\t')
# df2<- df2[df2$Rawp<0.01,]
# df2 <- df2[['X0']]
# 
# df3<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_t-test_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df3<- df3[df3$Rawp<0.01,]
# df3 <- df3[['X0']]
# 
# df4 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_t-test_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df4<- df4[df4$Rawp<0.01,]
# df4 <- df4[['X0']]
# 
# df5<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_Logisreg_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df5<- df5[df5$Meth<0.01,]
# df5 <- df5[['X0']]
# 
# df6 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_logisreg_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df6<- df6[df6$Meth<0.01,]
# df6 <- df6[['X0']]
# #
# df7<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_RefBase_BeforeNor_Logisreg_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df7<- df7[df7$Meth<0.01,]
# df7 <- df7[['X0']]
# 
# df8 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_Refbase_AfterNor_Logisreg_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df8<- df8[df8$Meth<0.01,]
# df8 <- df8[['X0']]
# 
# df9<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_clogit_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df9<- df9[df9$Rawp_logit<0.01,]
# df9 <- df9[['X']]
# 
# df10 <- read.table("/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_clogit_p-val_less_than_0.05.txt",
#                   header = TRUE, sep = '\t')
# df10<- df10[df10$Rawp_logit<0.01,]
# df10 <- df10[['X']]
# 
# df11<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_clogit_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df11<- df11[df11$Rawp_logit<0.01,]
# df11 <- df11[['X']]
# 
# df12 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_clogit_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df12<- df12[df12$Rawp_logit<0.01,]
# df12 <- df12[['X']]
# 
# 
# df13<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_multinom_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df13<- df13[df13$Methylation<0.01,]
# df13 <- df13[['X']]
# 
# df14 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_multinom_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df14<- df14[df14$Methylation<0.01,]
# df14 <- df14[['X']]
# 
# df15<-read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_multinom_p-val_less_than_0.05.txt',
#                 header = TRUE, sep = '\t')
# df15<- df15[df15$Methylation<0.01,]
# df15 <- df15[['X']]
# 
# df16 <- read.table('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt',
#                   header = TRUE, sep = '\t')
# df16<- df16[df16$Methylation<0.01,]
# df16 <- df16[['X']]


# BiocManager::install("VennDetail")
# install.packages("UpSetR")
library(UpSetR)
#install.packages("purrr")
library("purrr")
# install.packages('dplyr')
library(dplyr)


combined <- reduce(list(data.frame(gene = df2, "QN.BMIQ.EpiDish.paired t-test"=1),
                       data.frame(gene = df1, "BMIQ.EpiDish.paired t-test"=1),
                        data.frame(gene = df3, "BMIQ.RefBase.paired t-test"=1),
                        data.frame(gene = df4, "QN.BMIQ.RefBase.paired t-test"=1),
                        data.frame(gene = df5, "QN.BMIQ.EpiDish.LR"=1),
                        data.frame(gene = df6, "BMIQ.EpiDish.LR"=1),
                        data.frame(gene = df7, "BMIQ.RefBase.LR"=1),
                        data.frame(gene = df8, "QN.BMIQ.RefBase.LR"=1),
                       data.frame(gene = df9, "BMIQ.EpiDish.clogit"=1),
                       data.frame(gene = df10, "QN.BMIQ.EpiDish.clogit"=1),
                        data.frame(gene = df11, "BMIQ.RefBase.clogit"=1),
                        data.frame(gene = df12, "QN.BMIQ.RefBase.clogit"=1),
                        data.frame(gene = df13, "QN.BMIQ.EpiDish.multinom"=1),
                       data.frame(gene = df14, "BMIQ.EpiDish.multinom"=1),
                        data.frame(gene = df15, "BMIQ.RefBase+multinom"=1),
                        data.frame(gene = df16, "QN.BMIQ.RefBase+.multinom"=1)
), full_join)
combined[is.na(combined)] <- 0
combined
sampName = list(colnames(combined)[2:17])
upset(combined, nsets = 16)


import os
import pandas as pd 
import csv



#Function to modify the duplicated column name
# def rename_duplicate_columns(df):
#     cols = pd.Series(df.columns)
#     for dup in cols[cols.duplicated()].unique(): 
#         cols[cols[cols == dup].index.values.tolist()] = [dup + '_' + str(i) if i != 0 else dup for i in range(sum(cols == dup))]
#     df.columns = cols
#     return df


#function to read and remove multinom that is less than 0.05. Concordance twin


#Constants for clarity and maintainability (ttest: con:17, discodance:49) (logis: con:21,discordance:53) (clogit: con:25,discordance: 57)(multinom: concordance:26, discordance:58)
CUTOFF_column = 'Methylation'
CUTOFF_VALUE = 0.05
test = 'paired t-test'

def read_file(file1, file2):

    # Temporary storage for lines
    lines_to_write = []

    with open(file1, "r") as rf:
        header = rf.readline().split()
        next(rf)
        for line in rf:
            lines = line.split()
            try:
                if lines[CUTOFF_column] == "NA" or float(lines[CUTOFF_column]) >= CUTOFF_VALUE:
                    continue
                lines_to_write.append(line)
            except (IndexError, ValueError):
                pass

    # Writing to file2
    with open(file2, "w") as output:
        for line in lines_to_write:
            output.write(line + "\n")

    # Reading file2 into DataFrame
    dataframe = pd.read_csv(file2, sep="\t", names=header, index_col=0)

    # Writing DataFrame back to file2
    dataframe.to_csv(file2, sep='\t', index=True, header=header)


# t-test

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/Blood06062022_MZClClp_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/Blood06102022_MZClClp_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/Blood06132022_MZClClp_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_RefBase_AfterNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/Blood06142022_MZClClp_RefBase_CellTypeCorrected_MvalueLogitRes_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_RefBase_BeforeNor_t-test_p-val_less_than_0.05.txt')


read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/Blood01202023_MZClClp_Concordant_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_Concordant_AfterNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/Blood01202023_MZClClp_Concordant_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_Concordant_BeforeNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/Blood01232023_MZClClp_Concordant_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Concordant_RefBase_AftereNor_t-test_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/Blood01232023_MZClClp_Concordant_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Concordant_RefBase_BeforeNor_t-test_p-val_less_than_0.05.txt')



# Logisreg

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/Blood01202023_MZClClp_Concordant_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_Concordance_AfterNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/Blood01202023_MZClClp_Concordant_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_Concordant_BeforeNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/Blood01232023_MZClClp_Concordant_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Concordant_RefBase_AfterNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/Blood01232023_MZClClp_Concordant_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Concordant_RefBase_BeforeNor_Logisreg_p-val_less_than_0.05.txt')


read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/Blood06062022_MZClClp_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/Blood06102022_MZClClp_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/Blood06132022_MZClClp_RefBase_CellTypeCorrected_MvalueLogitRes_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_RefBase_AfterNor_Logisreg_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/Blood06142022_MZClClp_RefBase_CellTypeCorrected_MvalueLogitRes_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_RefBase_BeforeNor_Logisreg_p-val_less_than_0.05.txt')



# clogit
read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/clogit/Blood05042023_MZClClp_Concordant_CellTypeCorrected_Mvalueclogit_mztwinreg_AfterNor_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_Concordance_AfterNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/clogit/Blood05042023_MZClClp_Concordant_CellTypeCorrected_Mvalueclogit_mztwinreg_BeforeNor_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_Concordant_BeforeNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/clogit/Blood05032023_MZClClp_Concordant_RefBase_CellTypeCorrected_Mvalueclogit_mztwinreg_AfterNor_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Concordant_RefBase_AfterNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/clogit/Blood05022023_MZClClp_Concordant_RefBase_CellTypeCorrected_Mvalueclogit_mztwinreg_BeforeNor_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Concordant_RefBase_BeforeNor_clogit_p-val_less_than_0.05.txt')



read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/clogit/Blood050423_MZClClp_CellTypeCorrected_Mvalueclogit_AfterNor_round4_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/clogit/Blood050423_MZClClp_CellTypeCorrected_Mvalueclogit_BeforeNor_round4_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/clogit/Blood03052023_MZClClp_RefBase_CellTypeCorrected_Mvalueclogit_mztwinreg_AfterNor_PN_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_RefBase_AfterNor_clogit_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/clogit/Blood02052023_MZClClp_RefBase_CellTypeCorrected_Mvalueclogit_mztwinreg_BeforeNor_PN_Confounder.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_RefBase_BeforeNor_clogit_p-val_less_than_0.05.txt')

# multinon

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/multinom/Blood05172023_MZClClp_Concordance_CellTypeCorrected_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_Concordance_AfterNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/multinom/Blood05172023_MZClClp_Concordance_CellTypeCorrected_multinom_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_Concordant_BeforeNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/multinom/Blood05162023_MZClClp_Concordance_RefBase_CellTypeCorrected_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Concordant_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/multinom/Blood05162023_MZClClp_Concordance_RefBase_CellTypeCorrected_multinom_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Concordant_RefBase_BeforeNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/multinom/Blood05152023_MZClClp_CellTypeCorrected_Mvalue_multinomNames_AfterNor_round4.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_WoRefBase/multinom/Blood05152023_MZClClp_CellTypeCorrected_Mvalue_multinomNames_BeforeNor_round4.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/multinom/Blood05152023_MZClClp_RefBase_CellTypeCorrected_multinom_mztwinreg_AfterNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt')

read_file('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Champ.Norm_RefBase/multinom/Blood05162023_MZClClp_RefBase_CellTypeCorrected_multinom_mztwinreg_BeforeNor_PN.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_RefBase_BeforeNor_multinom_p-val_less_than_0.05.txt')



#remove concordance index
def remove_con(file1,file2,file3):

    df1 = pd.read_csv(file1, sep = '\t',index_col = 0)
    df2 = pd.read_csv(file2, sep = '\t', index_col=0)
    df = df1[df1.index.isin(df2.index) == False]
    df.to_csv(file3 , sep = '\t', index = True, header = True)


remove_con('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_Concordance_AfterNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_multinom_p-val_less_than_0.05.txt')


remove_con('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_Concordant_BeforeNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_multinom_p-val_less_than_0.05.txt')


remove_con('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Concordant_RefBase_AfterNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AftereNor_multinom_p-val_less_than_0.05.txt')

remove_con('/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_RefBase_BeforeNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Concordant_RefBase_BeforeNor_multinom_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_multinom_p-val_less_than_0.05.txt')



#CpG annotation
##### hg38 #####
#clogit
test = 'multinom'
sort_column = 'Methylation'
N_rows = 7000
def cpg_annotation(file1,file2,file3,file4,file5):

    df1 = pd.read_csv(file1, sep = '\t',index_col = 0)
    df2 = pd.read_csv(file2, sep = '\t', index_col=0, dtype=str)
    #merge file1 with the files b4 and b5
    df = pd.merge(df1, df2, left_index=True, right_index=True)
    df.to_csv(file3 , sep = '\t', index = True, header = True)
    #sort p-value and pick rows
    df_sort = df.sort_values(sort_column, ascending= True).head(N_rows)
    #write a file
    df_sort.to_csv(file4 , sep = '\t', index = True, header = True)
    #drop NA value in the columns
    df_to_bed = df_sort[['chr','start','end', 'Strand']]
    df_to_bed = df_to_bed.dropna()
    #write file
    df_to_bed.to_csv(file5 , sep = '\t', index = False, header = False)



cpg_annotation(f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result1/MZClClp_AfterNor_Removed_con_{test}_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/CpG_loc_strand_hg38.txt', 
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_{test}_p-val_less_than_0.05_annotated_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_{test}_p-val_less_than_0.05_annotated_first{N_rows}_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_EpiDish/07152023_MZClClp_QN_EpiDish_Removed_con_{test}_p-val_less_than_0.05_{N_rows}_hg38.bed')

cpg_annotation(f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result2_Mvalue_beforeNorm/MZClClp_BeforeNor_Removed_con_{test}_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/CpG_loc_strand_hg38.txt', 
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_{test}_p-val_less_than_0.05_annotated_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_{test}_p-val_less_than_0.05_annotated_first{N_rows}_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/EpiDish/07152023_MZClClp_EpiDish_Removed_con_{test}_p-val_less_than_0.05_{N_rows}_hg38.bed')

cpg_annotation(f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result3_Refbase_afterNorm/MZClClp_Removed_con_RefBase_AfterNor_{test}_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/CpG_loc_strand_hg38.txt', 
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_{test}_p-val_less_than_0.05_annotated_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_{test}_p-val_less_than_0.05_annotated_first{N_rows}_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/QN_RefBase/07152023_MZClClp_Removed_con_QN_Refbase_{test}_p-val_less_than_0.05_{N_rows}_hg38.bed')

cpg_annotation(f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/Results/Result4_Refbase_beforenorm/MZClClp_Removed_con_Refbase_BeforeNor_{test}_p-val_less_than_0.05.txt',
'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/CpG_loc_strand_hg38.txt', 
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_{test}p-val_less_than_0.05_annotated_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_{test}_p-val_less_than_0.05_annotated_first{N_rows}_hg38.txt',
f'/Users/thingnguyen/Documents/Projects/Twinproject/BloodLoad/CpG_site/RefBase/07152023_MZClClp_Removed_con_RefBase_{test}_p-val_less_than_0.05_{N_rows}_hg38.bed')

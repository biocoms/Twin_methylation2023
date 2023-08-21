library(ggplot2)
data <- read.table('EpiD_visual.txt', header = T, sep = '\t')
data1 <- read.table('QN.EpiD_visual.txt', header = T, sep = '\t')
data2 <- read.table('RefBase_visual.txt', header = T, sep = '\t')
data3 <- read.table('QN.RefBase_visual.txt', header = T, sep = '\t')
data4 <- read.table('Epi+RB combined.txt', header = T, sep = '\t')
#create variable to assign color to each value
group.colors <- c("EpiD.paired t-test" = "#F8766D", "EpiD.LR" = "#00BA38", "EpiD.clogit" = "#CD9600",
                  "EpiD.multinom" = "#619CFF")

group.colors1 <- c("QN.EpiD.paired t-test" = "#F8766D", "QN.EpiD.LR" = "#00BA38", "QN.EpiD.clogit" = "#CD9600",
                  "QN.EpiD.multinom" = "#619CFF")
group.colors2 <- c("RefBase.paired t-test" = "#F8766D", "RefBase.LR" = "#00BA38", "RefBase.clogit" = "#CD9600",
                  "RefBase.multinom" = "#619CFF")

group.colors3 <- c("QN.RefBase.paired t-test" = "#F8766D", "QN.RefBase.LR" = "#00BA38", "QN.RefBase.clogit" = "#CD9600",
                  "QN.RefBase.multinom" = "#619CFF")

#data
data$order <- c(1:length(data$term))

plot <- ggplot(data, aes( x = reorder(term,order), y = -log10(pvalue), fill = module)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = group.colors) + coord_flip()+
  scale_x_discrete(labels = c("actin filament bundle organization",
                              "actin filament bundle assembly",
                              "placenta blood vessel development",
                              "labyrinthine layer blood vessel development",
                              "cellular protein complex localization",
                              "establishment or maintenance of cytoskeleton polarity",
                              "TOR signaling",
                              "endocytic recycling",
                              "negative regulation of collagen biosynthetic process",
                              "deoxyribonucleotide metabolic process",
                              "regulation of receptor biosynthetic process",
                              "response to vitamin A",
                              "deoxyribonucleotide biosynthetic process",
                              "deoxyribonucleotide metabolic process",
                              "response to vitamin A")) +
  scale_fill_discrete(name = "Pipeline")+
  ylab("-log(adjusted p-value)")+
  xlab("")+
  labs(caption ="BMIQ.EpiDISH") +
  theme(plot.caption = element_text(size = 18, face = "bold", hjust = 0.8))


#data1
data1$order <- c(1:length(data1$term))
  
plot1 <- ggplot(data1, aes( x = reorder(term,order), y = -log10(pvalue), fill = module)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = group.colors1) + coord_flip()+
  scale_x_discrete(labels = c("coenzyme A metabolic process",
                              "actin polymerization/depolymerization",
                              "leukocyte apoptotic process",
                              "regulation of development, heterochronic",
                              "hepatocyte apoptotic process",
                              "regulation of timing of cell differentiation",
                              "regulation of cholesterol metabolic process",
                              "regulation of cholesterol biosynthetic process",
                              "regulation of receptor biosynthetic process",
                              "peptidyl-methionine modification",
                              "endocytic recycling",
                              "response to vitamin A",
                              "positive regulation of receptor biosynthetic process",
                              "peptidyl-methionine modification",
                              "endocytic recycling",
                              "mRNA polyadenylation")) +
  scale_fill_discrete(name = "Pipeline")+
  xlab("")+
  ylab("-log(adjusted p-value)")+
  labs(caption ="QN.EpiDISH") +
  theme(plot.caption = element_text(size = 18, face = "bold", hjust = 0.8))


#data2
data2$order <- c(1:length(data2$term))

plot2 <- ggplot(data2, aes( x = reorder(term,order), y = -log10(pvalue), fill = module)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = group.colors2) + coord_flip()+
  scale_x_discrete(labels = c("platelet-derived growth factor receptor-beta signaling pathway",
                              "regulation of platelet-derived growth factor receptor signaling pathway",
                              "actin filament capping",
                              "positive regulation of protein maturation",
                              "negative regulation of actin filament depolymerization",
                              "entry of bacterium into host cell",
                              "cholesterol import",
                              "corpus callosum development",
                              "embryonic placenta morphogenesis",
                              "negative regulation of Notch signaling pathway",
                              "apoptotic cell clearance",
                              "neuron projection regeneration",
                              "labyrinthine layer morphogenesis",
                              "regulation of vascular permeability",
                              "cellular component disassembly involved in execution phase of apoptosis",
                              "sarcomere organization",
                              "entry of bacterium into host cell",
                              "regulation of platelet-derived growth factor receptor signaling pathway",
                              "cholesterol import",
                              "positive regulation of receptor recycling",
                              "negative regulation of apoptotic process involved in morphogenesis",
                              "diterpenoid biosynthetic process",
                              "formate metabolic process",
                              "regulation of germinal center formation",
                              "regulation of mitochondrial membrane potential",
                              "positive regulation of nuclease activity",
                              "regulation of nuclease activity",
                              "DNA catabolic process",
                              "regulation of beta-amyloid clearance",
                              "chorio-allantoic fusion",
                              "macrophage differentiation",
                              "regulation of fibroblast growth factor production",
                              "calcium-independent cell-cell adhesion via plasma membrane cell-adhesion molecules",
                              "regulation of neuromuscular junction development",
                              "cholesterol import",
                              "positive regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",
                              "cell-substrate junction assembly",
                              "positive regulation of nuclease activity",
                              "positive regulation of protein insertion into mitochondrial membrane involved in apoptotic signaling pathway",
                              "regulation of fibroblast growth factor production",
                              "focal adhesion assembly",
                              "regulation of protein kinase C signaling",
                              "corpus callosum development",
                              "cholesterol import",
                              "regulation of Fc receptor mediated stimulatory signaling pathway",
                              "regulation of beta-amyloid clearance")) +
  scale_fill_discrete(name = "Pipeline")+
  xlab("")+
  ylab("-log10(adjusted p-value)")+
  labs(caption ="RefBase") +
  theme(plot.caption = element_text(size = 18, face = "bold", hjust = 0.8))


#data3
data3$order <- c(1:length(data3$term))

plot3 <- ggplot(data3, aes( x = reorder(term,order), y = -log10(pvalue), fill = module)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = group.colors3) + coord_flip()+
  scale_x_discrete(labels=c("thymic T cell selection",
                            "regulation of endoplasmic reticulum stress-induced intrinsic apoptotic signaling pathway",
                            "regulation of beta-amyloid clearance",
                            "positive regulation of triglyceride lipase activity",
                            "positive regulation of lipoprotein lipase activity",
                            "positive regulation of mitochondrial fission",
                            "endothelial cell morphogenesis",
                            "negative regulation of Notch signaling pathway",
                            "regulation of heterotypic cell-cell adhesion",
                            "protein kinase B signaling",
                            "spinal cord motor neuron cell fate specification",
                            "low-density lipoprotein particle clearance",
                            "positive regulation of monooxygenase activity",
                            "regulation of platelet-derived growth factor receptor signaling pathway",
                            "lymphocyte apoptotic process",
                            "negative regulation of heterotypic cell-cell adhesion",
                            "negative regulation of chemokine production",
                            "negative regulation of apoptotic process involved in morphogenesis",
                            "dorsal aorta development",
                            "stress fiber assembly",
                            "positive regulation of killing of cells of other organism",
                            "mitochondrial genome maintenance",
                            "cardiac vascular smooth muscle cell differentiation",
                            "choline catabolic process",
                            "regulation of podosome assembly",
                            "negative regulation of Notch signaling pathway",
                            "negative regulation of reactive oxygen species metabolic process",
                            "pyrimidine dimer repair",
                            "negative regulation of glycolytic process",
                            "regulation of beta-amyloid clearance",
                            "negative regulation of membrane depolarization",
                            "positive regulation of monooxygenase activity",
                            "regulation of fibroblast growth factor production",
                            "negative regulation of mitochondrial depolarization",
                            "regulation of platelet-derived growth factor receptor-beta signaling pathway",
                            "negative regulation of heterotypic cell-cell adhesion",
                            "histone deubiquitination",
                            "regulation of myotube differentiation",
                            "negative regulation of Notch signaling pathway",
                            "spinal cord motor neuron cell fate specification",
                            "regulation of podosome assembly",
                            "negative regulation of membrane depolarization",
                            "pyrimidine dimer repair",
                            "regulation of beta-amyloid clearance",
                            "negative regulation of heterotypic cell-cell adhesion")) +
  scale_fill_discrete(name = "Pipeline")+
  xlab("")+
  ylab("-log10(adjusted p-value)")+
  labs(caption ="QN.RefBase") +
  theme(plot.caption = element_text(size = 18, face = "bold", hjust = 0.8))



data4$order <- c(1:length(data4$term))

plot4 <- ggplot(data4, aes( x = reorder(term,order), y = -log10(pvalue), fill = module)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = group.colors) + coord_flip()+
  scale_x_discrete(labels = c("actin filament bundle organization",
                              "actin filament bundle assembly",
                              "placenta blood vessel development",
                              "labyrinthine layer blood vessel development",
                              "cellular protein complex localization",
                              "establishment or maintenance of cytoskeleton polarity",
                              "TOR signaling",
                              "endocytic recycling",
                              "negative regulation of collagen biosynthetic process",
                              "deoxyribonucleotide metabolic process",
                              "regulation of receptor biosynthetic process",
                              "response to vitamin A",
                              "deoxyribonucleotide biosynthetic process",
                              "deoxyribonucleotide metabolic process",
                              "response to vitamin A",
                              "coenzyme A metabolic process",
                              "actin polymerization/depolymerization",
                              "leukocyte apoptotic process",
                              "regulation of development, heterochronic",
                              "hepatocyte apoptotic process",
                              "regulation of timing of cell differentiation",
                              "regulation of cholesterol metabolic process",
                              "regulation of cholesterol biosynthetic process",
                              "regulation of receptor biosynthetic process",
                              "peptidyl-methionine modification",
                              "endocytic recycling",
                              "response to vitamin A",
                              "positive regulation of receptor biosynthetic process",
                              "peptidyl-methionine modification",
                              "endocytic recycling",
                              "mRNA polyadenylation",
                              "platelet-derived growth factor receptor-beta signaling pathway",
                              "regulation of platelet-derived growth factor receptor signaling pathway",
                              "actin filament capping",
                              "positive regulation of protein maturation",
                              "negative regulation of actin filament depolymerization",
                              "entry of bacterium into host cell",
                              "cholesterol import",
                              "corpus callosum development",
                              "embryonic placenta morphogenesis",
                              "negative regulation of Notch signaling pathway",
                              "apoptotic cell clearance",
                              "neuron projection regeneration",
                              "labyrinthine layer morphogenesis",
                              "regulation of vascular permeability",
                              "cellular component disassembly involved in execution phase of apoptosis",
                              "sarcomere organization",
                              "entry of bacterium into host cell",
                              "regulation of platelet-derived growth factor receptor signaling pathway",
                              "cholesterol import",
                              "positive regulation of receptor recycling",
                              "negative regulation of apoptotic process involved in morphogenesis",
                              "diterpenoid biosynthetic process",
                              "formate metabolic process",
                              "regulation of germinal center formation",
                              "regulation of mitochondrial membrane potential",
                              "positive regulation of nuclease activity",
                              "regulation of nuclease activity",
                              "DNA catabolic process",
                              "regulation of beta-amyloid clearance",
                              "chorio-allantoic fusion",
                              "macrophage differentiation",
                              "regulation of fibroblast growth factor production",
                              "calcium-independent cell-cell adhesion via plasma membrane cell-adhesion molecules",
                              "regulation of neuromuscular junction development",
                              "cholesterol import",
                              "positive regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",
                              "cell-substrate junction assembly",
                              "positive regulation of nuclease activity",
                              "positive regulation of protein insertion into mitochondrial membrane involved in apoptotic signaling pathway",
                              "regulation of fibroblast growth factor production",
                              "focal adhesion assembly",
                              "regulation of protein kinase C signaling",
                              "corpus callosum development",
                              "cholesterol import",
                              "regulation of Fc receptor mediated stimulatory signaling pathway",
                              "regulation of beta-amyloid clearance",
                              "thymic T cell selection",
                              "regulation of endoplasmic reticulum stress-induced intrinsic apoptotic signaling pathway",
                              "regulation of beta-amyloid clearance",
                              "positive regulation of triglyceride lipase activity",
                              "positive regulation of lipoprotein lipase activity",
                              "positive regulation of mitochondrial fission",
                              "endothelial cell morphogenesis",
                              "negative regulation of Notch signaling pathway",
                              "regulation of heterotypic cell-cell adhesion",
                              "protein kinase B signaling",
                              "spinal cord motor neuron cell fate specification",
                              "low-density lipoprotein particle clearance",
                              "positive regulation of monooxygenase activity",
                              "regulation of platelet-derived growth factor receptor signaling pathway",
                              "lymphocyte apoptotic process",
                              "negative regulation of heterotypic cell-cell adhesion",
                              "negative regulation of chemokine production",
                              "negative regulation of apoptotic process involved in morphogenesis",
                              "dorsal aorta development",
                              "stress fiber assembly",
                              "positive regulation of killing of cells of other organism",
                              "mitochondrial genome maintenance",
                              "cardiac vascular smooth muscle cell differentiation",
                              "choline catabolic process",
                              "regulation of podosome assembly",
                              "negative regulation of Notch signaling pathway",
                              "negative regulation of reactive oxygen species metabolic process",
                              "pyrimidine dimer repair",
                              "negative regulation of glycolytic process",
                              "regulation of beta-amyloid clearance",
                              "negative regulation of membrane depolarization",
                              "positive regulation of monooxygenase activity",
                              "regulation of fibroblast growth factor production",
                              "negative regulation of mitochondrial depolarization",
                              "regulation of platelet-derived growth factor receptor-beta signaling pathway",
                              "negative regulation of heterotypic cell-cell adhesion",
                              "histone deubiquitination",
                              "regulation of myotube differentiation",
                              "negative regulation of Notch signaling pathway",
                              "spinal cord motor neuron cell fate specification",
                              "regulation of podosome assembly",
                              "negative regulation of membrane depolarization",
                              "pyrimidine dimer repair",
                              "regulation of beta-amyloid clearance",
                              "negative regulation of heterotypic cell-cell adhesion")) +
  scale_fill_discrete(name = "Pipeline")+
  ylab("-log(adjusted p-value)")+
  xlab("")+
  labs(caption ="All pipelines") +
  theme(plot.caption = element_text(size = 18, face = "bold", hjust = 0.8))



library("ggpubr")
figure <- ggarrange(plot, plot1, plot2, plot3,
                    labels = c("A", "B", "C", "D"),
                    ncol = 2, nrow = 2)
figure


#   
# 
# # Add the "A" label in the left corner
# plot_with_a <- plot +
#   annotate("text", x = -4, y = -5, label = "A", hjust = 8, vjust = 1, size = 8, fontface = "bold")
# 
# # Add title at the bottom with big and bold fonts
# final_plot <- plot_with_a +
#   theme(plot.caption = element_text(hjust = 0.5, size = 20, face = "bold"))
# 
# # Display the final plot
# print(final_plot)
# 
# 
# #put the minus in front of pvalue
# ggplot(data1, aes( x = term, y = -log10(pvalue), fill = module)) +
#   geom_bar(stat = "identity", position = "dodge") + coord_flip()
#   # Combine all groups into a single facet
#   theme(legend.position = "right",  # Move the legend to the side
#         axis.title.y = element_blank()) +
#   geom_text(
#     aes(label = paste(round(-log10(pvalue), 2))),
#     color = "black",
#     size = 3,
#     hjust = -0.1,
#     position = position_dodge(0.9)
#   ) +
#   theme(
#     legend.position = "right",  # Move the legend to the side
#     panel.grid = element_blank(),
#     axis.text.x = element_blank(),
#     axis.text.y = element_text(size = 16, face = "bold"),
#     axis.ticks = element_blank(),
#     axis.title.y = element_blank(),
#     strip.text.x = element_text(size = 14, face = "bold"),
#     strip.background = element_blank()
#   ) +
#   scale_fill_manual(values = group.colors)










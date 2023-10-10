if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# motif analysis
library("devtools");
install_github("Danko-Lab/rtfbs_db/rtfbsdb")BiocManager::install("ChAMP")


BiocManager::install("shinyMethyl")
BiocManager::install("EpiDISH")
BiocManager::install("wateRmelon")
BiocManager::install("shinyMethyl")
BiocManager::install("multtest")
BiocManager::install("VennDetail")
install.packages("UpSetR")
install.packages("netgwas")
install.packages("TCA")
install.packages("ggplot2")
install.packages('rms')
install.packages("purrr")
install.packages('dplyr')



library(tidyverse)
library(ChAMP)
library("GenomicFeatures")
library(gtsummary)
library(mztwinreg)
library(ChAMP)
library("EpiDISH")
library("rsvd")
library("TCA")
library(wateRmelon)
library(ggplot2)
library(rms)
library ("purrr")
library(shinyMethyl)

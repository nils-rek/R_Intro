# ----------------------------------------------
# Mendelian Randomisation Basics----------------
# ----------------------------------------------


# 1 Preparation---------------------------------

## Install/ load package
install.package("MendelianRandomization")
library("MendelianRandomization")
library("tidyverse")


## Load data
load("C:/Users/nkapp/OneDrive/Documents/InflamDepSx/MR/MR_IL6.RData")

## Set tutorial names
dat = il6
rm(il6)

dat = dat[, c("chr", "SNP", "A1", "A2", "beta", "se", "sx.20513.beta", "sx.20513.se")]
colnames(dat) = c("chr", "SNP", "A1", "A2", "exp.beta", "exp.se", "out.beta", "out.se")

# 2 IVW-MR--------------------------------------


## Run model
mr_ivw(mr_input(snps = dat$SNP, bx = dat$exp.beta, bxse = dat$exp.se, 
                by = dat$out.beta, byse = dat$out.se), 
       model = "fixed", weights = "delta")


## Plot model
mr_plot(mr_input(snps = dat$SNP, bx = dat$exp.beta, bxse = dat$exp.se, 
                 by = dat$out.beta, byse = dat$out.se), 
        error = TRUE, line = "ivw", orientate = TRUE, interactive = FALSE, 
        labels = TRUE) + theme_bw()


# 3 MedianWeighted-MR---------------------------


## Run model
mr_median(mr_input(snps = dat$SNP, bx = dat$exp.beta, bxse = dat$exp.se, 
                   by = dat$out.beta, byse = dat$out.se), 
          weighting = "weighted", iterations = 10000)


# 3 MREgger-------------------------------------

## Run model
mr_egger(mr_input(snps = dat$SNP, bx = dat$exp.beta, bxse = dat$exp.se, 
                  by = dat$out.beta, byse = dat$out.se))


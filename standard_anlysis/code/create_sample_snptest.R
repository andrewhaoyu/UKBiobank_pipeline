###read the full sample file
sample <- fread('/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb1771_imp_chr1_v2_s487398.sample',header=T)

##load all the cleaned data
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pheno.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pc.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/sample.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/fam.clean.Rdata")
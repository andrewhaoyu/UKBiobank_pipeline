###read the full sample file
sample <- fread('/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb1771_imp_chr1_v2_s487398.sample',header=T)

##load all the cleaned data
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pheno.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pc.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/sample.clean.Rdata")
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/fam.clean.Rdata")

#### Take out breast cancer
### create the corresponding pheno files
bin1 <- pheno.clean$Breast
bin1[bin1==99] <- 0
sample.pheno <- sample.clean[,1:3]

pc.pheno <- pc.clean[,1:15]
colnames(pc.pheno) <- c("cov1","cov2","cov3","cov4","cov5","cov6",
                        "cov7","cov8","cov9","cov10","cov11","cov12",
                        "cov13","cov14","cov15")
first.row <- c(rep(0,3),rep("C",15),"B")

sample.snptest <- data.frame(sample.pheno,pc.pheno,bin1)

sample.snptest <- rbind(first.row,sample.snptest)

write.table(sample.snptest,file="/dcl01/chatterj/data/UKBiobank_pipeline/standard_anlysis/result/sample_snptest.sample",row.names = F,col.names = T, quote=F)


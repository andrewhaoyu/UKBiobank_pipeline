##load all the phenotype files

library(data.table)
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
colnames(pc.pheno) <- c("pc1","pc2","pc3","pc4","pc5","pc6",
                        "pc7","pc8","pc9","pc10","pc11","pc12",
                        "pc13","pc14","pc15")
first.row <- c(rep(0,3),rep("C",15),"B")

sample.snptest <- data.frame(sample.pheno,pc.pheno,bin1)


####demostrate the self design code
####setup your genetic data files
library(devtools)
library(bc2,lib.loc = '/dcl01/chatterj/data/tools/')
#install_github("andrewhaoyu/bc2", args = c('--library="/home/zhangh24/R/x86_64-pc-linux-gnu-library/3.4"'))
install_github("andrewhaoyu/bc2", ref='development',args = c('--library="/users/hzhang1/R/x86_64-pc-linux-gnu-library/3.3"'))
file.name <- '/dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_1.gen'

con <- file(file.name)
open(con)
oneLine <- readLines(con,n=1)
myVector <- strsplit(oneLine," ")
snpid <- as.character(myVector[[1]][2])
#snpid_result[i] <- snpid
n <- nrow(sample.snptest)
snpvalue <- rep(0,n)

test <- unlist(myVector)
snppro <- as.numeric(unlist(myVector)[7:length(myVector[[1]])])

snpvalue <- convert(snppro,n)
snpvalue <- snpvalue[idx.fil][idx.match]
freq <- sum(snpvalue)/(2*n.sub)

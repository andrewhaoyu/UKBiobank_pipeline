# library(data.table)
# pheno <- fread("/dcl01/chatterj/data/ukbiobank/pheno.csv")


#library(eeptools)
#
#fully raw data, uncleaned cohort data
load("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pheno.Rdata")
###ICD codes related to breat cancer

#ICD_9 <- bd[,2766:2795]
#ICD_10 <- bd[,2632:2663]
###take out the principle components
#pc.all <- bd[,2362:2376]
library(data.table)
pheno <- fread("/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/Data_Cancer.txt",
               header = T)
pc <- fread("/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_sqc_v2.txt",header = F)
pc <- pc[,26:65]

fam <- fread("/dcl01/chatterj/data/ukbiobank/genetic_v2/genotype/ukb1771_cal_chr1_v2_s488364.fam")


#subject.id.pc <- pc.test$V2


sample <- fread('/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb1771_imp_chr1_v2_s487398.sample',header=T)
###the first row is not person, it's an indicator for the coloumn class
#sample <- sample[-1,]
#n.sample <- nrow(sample)-1
sample.id <- sample$ID_1
subject.id.fam <- fam$V1
subject.id.pheno <- pheno$Subject_ID

overlap.id <- intersect(intersect(sample.id,subject.id.fam),subject.id.pheno)


pheno.clean <- pheno[subject.id.pheno%in%overlap.id,]
pc.clean <- pc[subject.id.fam%in%overlap.id,]
sample.clean <- sample[sample.id%in%overlap.id,]
fam.clean <- fam[subject.id.fam%in%overlap.id,]


all.equal(fam.clean$V1,sample.clean$ID_1)
all.equal(fam.clean$V1,pheno.clean$Subject_ID)
idx.match <- match(fam.clean$V1,pheno.clean$Subject_ID)
pheno.clean <- pheno.clean[idx.match,]

all.equal(pheno.clean$Subject_ID,fam.clean$V1)



save(pheno.clean,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pheno.clean.Rdata")
save(pc.clean,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pc.clean.Rdata")
save(sample.clean,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/sample.clean.Rdata")
save(fam.clean,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/fam.clean.Rdata")

###generate the id which are in the sample, but not in the overlap data
id.exclusion <- sample.id[which(sample.id%in%overlap.id!=T)]
###take out the first row since that's not an id, that's an indicator for data type
id.exclusion <- id.exclusion[-1]

write.table(id.exclusion,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/exclusion_id.txt",row.names = F,col.names=F,quote=F)













#test <- which(sample.id%in%overlap.id!=T)






# idx <- which(overlap.id<0)
# 
# 
# # ###take out all the sample with no id
# # sample <- as.data.frame(sample[sample$ID_1>0,])
# 
# 
# 
# 
# 
# try <- which((sample.id%in%subject.id.fam)!=T)
# 
# idx.cases <- which(pheno$Breast==1)
# cases <- pheno[idx.cases,]
# 
# 
# ##check whether the person got multiple cancer
# idx.cases.multiple.cancer <- which(cases$Prostate!=99|cases$Colorectal!=99|cases$Bronchus_Lung!=99|cases$Melanoma_of_skin!=99|cases$Non_Hodgkins_lymphoma!=99|cases$Corpus_Uterus!=99|cases$Kidney_RenalPelvis!=99|cases$Bladder!=99|cases$Ovary!=99|cases$Pancreas!=99|cases$Leukemia!=99|cases$Thyroid!=99)
# 
# idx.control <-  which(pheno$Prostate==99&pheno$Colorectal==99&pheno$Bronchus_Lung==99&pheno$Melanoma_of_skin==99&pheno$Non_Hodgkins_lymphoma==99&pheno$Corpus_Uterus==99&pheno$Kidney_RenalPelvis==99&pheno$Bladder==99&pheno$Ovary==99&pheno$Pancreas==99&pheno$Leukemia==99&pheno$Thyroid==99&pheno$Breast==99)
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# # for(i in 1:nrow(cases)){
# # if({
# #   idx.cases.multiple.cancer  
# # }
# # }
# 
# 
# # bd <- read.table("/dcl01/chatterj/data/ukbiobank/pheno.tab", header=TRUE, sep="\t")
# # bd$f.53.0.0 <- as.Date(bd$f.53.0.0)
# # bd$f.53.1.0 <- as.Date(bd$f.53.1.0)
# # bd$f.53.2.0 <- as.Date(bd$f.53.2.0)
# # bd$f.40000.0.0 <- as.Date(bd$f.40000.0.0)
# # bd$f.40000.1.0 <- as.Date(bd$f.40000.1.0)
# # bd$f.40000.2.0 <- as.Date(bd$f.40000.2.0)
# # bd$f.40005.0.0 <- as.Date(bd$f.40005.0.0)
# # bd$f.40005.1.0 <- as.Date(bd$f.40005.1.0)
# # bd$f.40005.2.0 <- as.Date(bd$f.40005.2.0)
# # bd$f.40005.3.0 <- as.Date(bd$f.40005.3.0)
# # bd$f.40005.4.0 <- as.Date(bd$f.40005.4.0)
# # bd$f.40005.5.0 <- as.Date(bd$f.40005.5.0)
# # bd$f.40005.6.0 <- as.Date(bd$f.40005.6.0)
# # bd$f.40005.7.0 <- as.Date(bd$f.40005.7.0)
# # bd$f.40005.8.0 <- as.Date(bd$f.40005.8.0)
# # bd$f.40005.9.0 <- as.Date(bd$f.40005.9.0)
# # bd$f.40005.10.0 <- as.Date(bd$f.40005.10.0)
# # bd$f.40005.11.0 <- as.Date(bd$f.40005.11.0)
# # bd$f.40005.12.0 <- as.Date(bd$f.40005.12.0)
# # bd$f.40005.13.0 <- as.Date(bd$f.40005.13.0)
# # bd$f.40005.14.0 <- as.Date(bd$f.40005.14.0)
# # bd$f.40005.15.0 <- as.Date(bd$f.40005.15.0)
# # bd$f.40005.16.0 <- as.Date(bd$f.40005.16.0)
# # bd$f.40005.17.0 <- as.Date(bd$f.40005.17.0)
# # bd$f.40005.18.0 <- as.Date(bd$f.40005.18.0)
# # bd$f.40005.19.0 <- as.Date(bd$f.40005.19.0)
# # bd$f.40005.20.0 <- as.Date(bd$f.40005.20.0)
# # bd$f.40005.21.0 <- as.Date(bd$f.40005.21.0)
# # bd$f.40005.22.0 <- as.Date(bd$f.40005.22.0)
# # bd$f.40005.23.0 <- as.Date(bd$f.40005.23.0)
# # bd$f.40005.24.0 <- as.Date(bd$f.40005.24.0)
# # bd$f.40005.25.0 <- as.Date(bd$f.40005.25.0)
# # bd$f.40005.26.0 <- as.Date(bd$f.40005.26.0)
# # bd$f.40005.27.0 <- as.Date(bd$f.40005.27.0)
# # bd$f.40005.28.0 <- as.Date(bd$f.40005.28.0)
# # bd$f.40005.29.0 <- as.Date(bd$f.40005.29.0)
# # bd$f.40005.30.0 <- as.Date(bd$f.40005.30.0)
# # bd$f.40005.31.0 <- as.Date(bd$f.40005.31.0)
# # bd$f.110002.1.0 <- as.Date(bd$f.110002.1.0)
# # bd$f.110002.2.0 <- as.Date(bd$f.110002.2.0)
# # bd$f.110002.3.0 <- as.Date(bd$f.110002.3.0)
# # bd$f.110002.4.0 <- as.Date(bd$f.110002.4.0)
# # 
# # save(bd,file="/dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/pheno.Rdata")
# # 
# # 
# 
# file.name <- '/dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_1.gen'
# 
# con <- file(file.name)
# open(con)
# oneLine <- readLines(con,n=1)
# myVector <- strsplit(oneLine," ")
# snpid <- as.character(myVector[[1]][2])
# snpid_result[i] <- snpid
# snpvalue <- rep(0,n)
# 
# test <- unlist(myVector)
# snppro <- as.numeric(unlist(myVector)[7:length(myVector[[1]])])
# 

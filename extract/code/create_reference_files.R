#rs_id <- read.table("/Users/haoyuzhang/GoogleDrive/UKBiobank_pipeline/extract/result/rs_id.txt",header=F)

#snp_info



library(data.table)

####merge the information files for all the 22 chr
text <- "cat "
for(i in 1:22){
  text <- paste0(text,"ukb_mfi_chr",i,"_v2.txt ")  
}
text <- paste0(text, " > ../../../UKBiobank_pipeline/extract/result/merged_info.txt")

system(text)
library(data.table)
setwd('/dcl01/chatterj/data/UKBiobank_pipeline/extract/result')
snp_info <- fread("merged_info.txt")

total <- nrow(snp_info)
####generate the CHR information
CHR <- rep(0,total)
setwd('/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data')
colnames(snp_info) <- c("rs_id","position","allele1","allele2","MAF","V6")

total <- 0
for(i in 1:22){
  print(i)
  temp <- system(paste0("wc -l ukb_mfi_chr",i,"_v2.txt"),intern=T)
  temp <- as.integer(gsub("ukb_.*","",temp))
  CHR[total+(1:temp)] <- i
  total <- total + temp
}

snp_info <- cbind(snp_info,CHR)
snp_info <- as.data.frame(snp_info)
save(snp_info,file="/dcl01/chatterj/data/UKBiobank_pipeline/extract/result/snp_info.Rdata")

##############read the rs_id for targeted SNPs




#idx <- which(snp_info$rs_id==)





# 
# library(data.table)
# 
# ####get the total number of SNPs in the ukbiobank data
# total <- 0
# 
# for(i in 1:22){
#   print(i)
#   data <-fread(paste0("/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_mfi_chr",i,"_v2.txt"))
#   temp <- nrow(data)
#   total <- temp + total
# }
# 
# ###create the snp information file
# 
# rs_id <- rep("c",total)
# position <- rep(0,total)
# allele2 <- allele1 <- rep("c",total)
# MAF <- rep(0,total)
# V6 <- rep(0,total)
# CHR <- rep(0,total)
# snp.info <- data.frame(rs_id,position,allele1,allele2,MAF,V6,CHR)
# 
# total <- 0
# 
# for(i in 1:22){
#   print(i)
#   data <-fread(paste0("/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_mfi_chr",i,"_v2.txt"))
#   temp <- nrow(data)
#   # rs_id[total+(1:temp)] <- data[,1]
#   # position[total+(1:temp)] <- data[,2]
#   # allele1[total+(1:temp)] <- data[,3]
#   # allele2[total+(1:temp)] <- data[,4]
#   # MAF[total+(1:temp)] <- data[,5]
#   # V6[total+(1:temp)] <- data[,6]
#   snp.info[total+(1:temp),1:6] <- data
#   snp.info[total+(1:temp),7] <- rep(i,temp)
#   total <- temp + total
#  # rm(data)
#   #gc()
# }
# #rm(data)
# #gc()





library(data.table)

####get the total number of SNPs in the ukbiobank data
total <- 0

for(i in 1:22){
  print(i)
  data <-fread(paste0("/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_mfi_chr",i,"_v2.txt"))
  temp <- nrow(data)
  total <- temp + total
}

###create the snp information file

rs_id <- rep("c",total)
position <- rep(0,total)
allele2 <- allele1 <- rep("c",total)
MAF <- rep(0,total)
V6 <- rep(0,total)
CHR <- rep(0,total)


total <- 0

for(i in 1:22){
  print(i)
  data <-fread(paste0("/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_mfi_chr",i,"_v2.txt"))
  temp <- nrow(data)
  rs_id[total+(1:temp)] <- data[,1]
  position[total+(1:temp)] <- data[,2]
  allele1[total+(1:temp)] <- data[,3]
  allele2[total+(1:temp)] <- data[,4]
  MAF[total+(1:temp)] <- data[,5]
  V6[total+(1:temp)] <- data[,6]
  CHR[total+(1:temp)] <- rep(i,temp)
  total <- temp + total
 # rm(data)
  #gc()
}
#rm(data)
#gc()
snp.info <- data.frame(rs_id,position,allele1,allele2,MAF,V6,CHR)
save(snp.info,file="/dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/snp_info.Rdata")
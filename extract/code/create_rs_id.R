load("/dcl01/chatterj/data/UKBiobank_pipeline/extract/result/snp_info.Rdata")
setwd('/dcl01/chatterj/data/UKBiobank_pipeline/extract/result')
#rs_id <- read.csv("rs_id.txt",header=F,stringsAsFactors = F)


#rs_id_temp <- rep("c",179)
#for(i in 1:179){
# rs_id_temp[i] <- rs_id[i,1]
#}
known_snps <- read.csv("known_snps.csv",header=F,stringsAsFactors = F)
rs_id_temp <- known_snps[,1]
idx <- which((rs_id_temp%in%snp_info$rs_id)==F)



###update their names based on ukbiobank chr and position
updated_names <- NULL
for(i in 1:length(idx)){
  print(i)
  temp <- known_snps[idx[i],]
  CHR <- temp[,2]
  position <- temp[,3]
  jdx <- which(snp_info$CHR==CHR&snp_info$position==position)
  updated_names <- c(updated_names,snp_info[jdx,1])
}

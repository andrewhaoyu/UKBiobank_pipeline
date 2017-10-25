#this file is used to merge the extract files from different chrome
#test the total number of extracted snps
total <- 0

for(i in 1:22){
  print(i)
  temp <- system(paste0("wc -l /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_",i),intern=T)
  temp <- as.integer(gsub(paste0(" /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_",i),"",temp))
  ###wc -l always count 3 more lines than the normal line number
  total <- temp+total-3
}

#merge all the seperate extraction files as one file
library(data.table)
i <- 1
data <- fread(paste0("/dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_",i),header=T)

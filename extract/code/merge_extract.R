#this file is used to merge the extract files from different chrome
#test the total number of extracted snps
total <- 0

for(i in 1:22){
  print(i)
  temp <- system(paste0("wc -l /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_",i,".gen"),intern=T)
  temp <- as.integer(gsub(paste0(" /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_",i,".gen"),"",temp))
  total <- temp+total
  print(total)
}



##merge all the extract files together
##read the first one to decide the format
# i <- 1
# 
# 
# 
# text <- '/dcl01/chatterj/data/tools/qctool/build/default/qctool_v2.0-rc5'
# for(i in 1:22){
#   text <- paste0(text,' -g /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_',i,'.gen')
# }
# text <- paste0(text,' -og /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/merge.gen')
# system(text)

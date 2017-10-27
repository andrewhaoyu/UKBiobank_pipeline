#install.packages("gtools")
library(gtools)
result=NULL
dir_result <- "/dcl01/chatterj/data/UKBiobank_pipeline/standard_anlysis/result"
files_result <- list.files(path=dir_result, pattern=".out")
files_result <- mixedsort(files_result)
for(i in 1:length(files_result)){
  result <-rbind(result, read.table(paste0(dir_result,"/",files_result[i]), header=T))
}  

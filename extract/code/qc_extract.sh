###qc tool command to extract snps
###-g represents the whole imputed data
###-og represents the output imputed data
###-incl-rsids represents the targetted snps
###


/dcl01/chatterj/data/tools/qctool/build/default/qctool_v2.0-rc5 -g /dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb_imp_chr$1_v2.bgen -og /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/extract_$1.gen -s /dcl01/chatterj/data/ukbiobank/genetic_v2/imputed_data/ukb1771_imp_chr1_v2_s487398.sample -excl-samples /dcl01/chatterj/data/UKBiobank_pipeline/pheno/result/exclusion_id.txt -incl-rsids /dcl01/chatterj/data/UKBiobank_pipeline/extract/result/rs_id.txt

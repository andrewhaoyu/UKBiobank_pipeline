for i in `seq 1 22`
do
qsub -l mem_free=5G,h_vmem=6G qc_extract.sh $i
done
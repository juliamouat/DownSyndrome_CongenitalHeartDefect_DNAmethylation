#identify DMRs for individuals with Down Syndrome and a Major Heart Defect (DS MHD) compared with individuals with Down Syndrome and no Major Heart Defect (DS non-MHD)
#Sex Combined and Sex Stratified (Males Only and Females Only) analyses
#developed by Ben Laufer: https://github.com/ben-laufer/DMRichR

cd /share/lasallelab/Jules/DS_NDBS/cytosine_reports

module load R/4.1.0
module load homer

call="nohup \
Rscript \
--vanilla \
/share/lasallelab/programs/DMRichR/DM.R \
--genome hg38 \
--coverage 1 \
--perGroup '0.75' \
--minCpGs 5 \
--maxPerms 10 \
--maxBlockPerms 10 \
--cutoff '0.05' \
--testCovariate MajorHeartDefect \
--adjustCovariate 'Sex;AgeBloodCollection;CD8T;CD4T;NK;Bcell;Mono;Gran;nRBC' \
--sexCheck TRUE \
--GOfuncR TRUE \
--cores 20 \
--EnsDb FALSE \
> DMRichR.log 2>&1 &"

echo $call
eval $call 
echo $! > save_pid.txt

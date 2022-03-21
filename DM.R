#identify DMRs for individuals with Down Syndrome based on whether they have a major heart defect or not 
#Ben Laufer pipeline

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
--testCovariate Major_heart_defect \
--adjustCovariate 'Sex' \
--sexCheck TRUE \
--GOfuncR TRUE \
--cores 20 \
--EnsDb FALSE \
> DMRichR.log 2>&1 &"

echo $call
eval $call 
echo $! > save_pid.txt

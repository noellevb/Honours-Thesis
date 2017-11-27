#!/bin/bash
#PBS -N lofreq_H_E
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/lofreq/

${lofreq} call-parallel --pp-threads 8 -f ${REF}ucsc.hg19.fasta \
--call-indels \
-o ${out}EUR_11_highcov_final.lofreq.vcf ${FIX}EUR_11_final.calmd.bam \
-S ${dbsnp}

#--call-indels \

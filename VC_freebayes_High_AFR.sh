#!/bin/bash
#PBS -N freebayes_H_A
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/freebayes/

${freebaye} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta ${FIX}AFR_11_final.calmd.bam > ${out}AFR_11_highcov_final.freebayes.vcf


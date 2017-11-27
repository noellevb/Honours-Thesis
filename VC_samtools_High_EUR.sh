#!/bin/bash
#PBS -N samtools_H_E
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

#EUR -High Cov

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/samtools/

${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
${FIX}EUR_11_final.calmd.bam | ${EXE_BCFTOOL} call -mv - > ${out}EUR_11_highcov_final.samtools.vcf


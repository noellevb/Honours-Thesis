#!/bin/bash
#PBS -N bcftools_H_A
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/BCF/

${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
${FIX}AFR_11_sim_reads_golden.bam | ${bcftools} call -vmO z -o ${out}AFR_11_highcov.bcftools.vcf.gz

${bcftools} filter -O z -o ${out}AFR_11_highcov_final.bcftools.vcf.gz -s LOWQUAL -i'%QUAL >10' ${out}AFR_11_highcov.bcftools.vcf.gz


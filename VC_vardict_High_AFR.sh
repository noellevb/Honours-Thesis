#!/bin/bash
#PBS -N VarDict_H_A
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt
OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}

vardict=${soft}VarDict/
AF_THR="0.01" # minimum allele frequency

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/VarDict/

${vardict}vardict -G ${REF}ucsc.hg19.fasta -f $AF_THR -N 10_GTCAATTT \
-b ${bam}AFR_11_final.calmd.bam \
-F 0 -c 1 -s 2 -e 3 /mnt/lustre/groups/CBBI0818/NOELLE/SHELL/BED_CHR/CHR${CHR}.vardic.bed | ${vardict}teststrandbias.R | ${vardict}var2vcf_valid.pl -N 10_GTCAATTT -E -f $AF_THR > ${out}AFR_11_highcov_final.${CHR}.vardict.vcf


#!/bin/bash
#PBS -N Platypus.E.H
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

source /apps/user/CBBI0818/venv.python2_7/bin/activate

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/Platypus/

python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
--bamFiles=${FIX}EUR_11_final.calmd.bam \
--nCPU=8 \
--output=${out}EUR_11_highcov_final.Platypus.vcf

python ${platypus} continueCalling --vcfFile=${out}EUR_11_highcov_final.Platypus.vcf



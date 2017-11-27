#!/bin/bash
#PBS -N BAM_sim_bam
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


BAM=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
#${ANC}_11_sim_reads_golden.bam
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/${ANC}_11_final

${samtool} view -H ${BAM}${ANC}_11_sim_reads_golden.bam | sed -e 's/SM:/SM:'"${SAM}"'_/g' | ${samtool} reheader - ${BAM}${ANC}_11_sim_reads_golden.bam > ${out}.bam

${samtool} calmd -Erb ${out}.bam ${REF}ucsc.hg19.fasta > ${out}.calmd.bam
${samtool} index ${out}.calmd.bam


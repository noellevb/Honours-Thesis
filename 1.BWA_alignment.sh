#!/bin/bash
#PBS -N algn
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt



${BWA} mem -M -t 32 ${REF}ucsc.hg19.fasta ${outsim}${ANC}/${ANC}_${CHR}_sim_reads_altcov_read1.fq  ${outsim}${ANC}/${ANC}_${CHR_sim_reads_altcov_read2.fq > ${BAM}${ANC}_${CHR}.sam


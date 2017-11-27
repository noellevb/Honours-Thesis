#!/bin/bash
#PBS -N fix_bam_RG
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00


. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

SUB_JOBS=""

for ANC in AFR EUR
   do
       echo Processing on chromosome ${CHR}
       # read in file with chunk boundary definitions
	SUB_JOBS="${SUB_JOBS}
${ANC}"
done
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt;ANC={1}; . /mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/fixed_RG_bam2.sh'

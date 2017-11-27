#!/bin/bash
#PBS -N Sort_SAM_BAM
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


tmp=${wkd}TEMP/	

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}SortSam.jar \
SO=coordinate \
INPUT=${BAM}${ANC}_${CHR}.sam \
OUTPUT=${BAM}${ANC}_${CHR}.sorted.sam \
VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true



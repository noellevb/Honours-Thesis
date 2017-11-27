#!/bin/bash
#PBS -N Dupl_Index
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


#HAPMAPVCF=${hapmap}
OMNIVCF=${omni}
KGVCF=${Conf}
DBSNPVCF=${dbsnp}
#GINDSNPVCF=${Mills}
INDSNPVCF=${Indel}


out=${BAM}
tmp=${wkd}TEMP/

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} \
-jar ${picard}FixMateInformation.jar \
INPUT=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked2.bam  \
OUTPUT=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.fixed.bam \
SO=coordinate VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true

#INPUT=${BAM}${ANC}_${CHR}.realign.bam \
# -Djava.io.tmpdir=${tmp}flx-auswerter \

#!/bin/bash
#PBS -N BAM_recal
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

	
${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T BaseRecalibrator -l INFO \
-I ${BAM}${ANC}_${CHR}_altcov.realign.fixed.bam  \
-R ${REF}ucsc.hg19.fasta \
--knownSites $INDSNPVCF \
--knownSites $GINDSNPVCF \
--knownSites $DBSNPVCF \
-nt 1 \
-nct 8 \
-o ${tmp}recalibration_${ANC}_${CHR}_altcov.grp
#-o ${tmp}recalibration_H3Aass.grp

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-l INFO \
-T PrintReads \
-R ${REF}ucsc.hg19.fasta \
-I ${BAM}${ANC}_${CHR}_altcov.realign.fixed.bam \
-BQSR ${tmp}recalibration_${ANC}_${CHR}_altcov.grp \
-o ${BAM}${ANC}_${CHR}_altcov.realign.final.bam


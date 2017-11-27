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

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}AddOrReplaceReadGroups.jar \
#I=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked.bam \
#O=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov..marked2.bam \
#VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true \
#SO=queryname ID=sample1 LB=FCC007KABXX PU=GTCAATTT PL=illumina SM=GTCAATTT 

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}BuildBamIndex.jar \
#INPUT=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked2.bam 


#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}SortSam.jar \
#SO=coordinate \
#INPUT=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked2.bam \
#OUTPUT=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked.sorted.bam \
#VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true


#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T RealignerTargetCreator \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.marked.sorted.bam \
#-nt 4 \
#-nct 1 \
#-fixMisencodedQuals \
#-o ${tmp}${ANC}_${CHR}_altcov.bam.list

#echo $"Starting realignment and QC"

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} -T IndelRealigner \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov..marked.sorted.bam \
#--knownAlleles $INDSNPVCF \
#--knownAlleles $GINDSNPVCF \
#--knownAlleles $DBSNPVCF \
#--targetIntervals ${tmp}${ANC}_${CHR}_altcov.bam.list \
#-o ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.bam \
#-fixMisencodedQuals \
#--consensusDeterminationModel USE_READS -LOD 0.4


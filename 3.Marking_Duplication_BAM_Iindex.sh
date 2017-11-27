#!/bin/bash
#PBS -N Dupl_Index
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


HAPMAPVCF=${hapmap}
OMNIVCF=${omni}
KGVCF=${1000GConf}
DBSNPVCF=${dbsnp}

vcf1=${out}${DATA_PREFIX}.UGeno_recalibrated_snps_raw.snp.vcf
GINDSNPVCF=${1000GMills}
INDSNPVCF=${1000GIndel}


	
out=${BAM}
tmp=${wkd}TEMP/

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}MarkDuplicates.jar \
INPUT=${BAM}${ANC}_${CHR}.sorted.sam \
OUTPUT=${BAM}${ANC}_${CHR}.marked.bam \
METRICS_FILE=${tmp}{ANC}_${CHR}.metric CREATE_INDEX=true VALIDATION_STRINGENCY=LENIENT

echo $"Creating the bam index"

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}BuildBamIndex.jar \
INPUT=${BAM}${ANC}_${CHR}.marked.bam


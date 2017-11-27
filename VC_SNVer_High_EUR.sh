#!/bin/bash
#PBS -N SNVer_H_E
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}
pool=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/EUR_HighCov.pool.txt

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/SNVer/

${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
-i ${FIX} \
-r ${REF}ucsc.hg19.fasta \
-c ${pool} \
-o ${out}EUR_11_highcov.SNVer



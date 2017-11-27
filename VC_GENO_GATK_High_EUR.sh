#!/bin/bash
#PBS -N Ggatk_H_E
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

module add chpc/gnu/parallel-20160422

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/GATK/

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T GenotypeGVCFs \
-R ${REF}ucsc.hg19.fasta \
-stand_call_conf 50.0 \
-stand_emit_conf 10.0 \
--dbsnp $DBSNPVCF \
--variant ${out}EUR_11_highcov_final.GATK.g.vcf \
-nt 1 \
-nct 1 \
-o ${VCF}EUR_11_highcov.final.gatk.vcf

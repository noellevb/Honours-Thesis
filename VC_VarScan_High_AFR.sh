#!/bin/bash
#PBS -N VarScan_H_A
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

sample=/mnt/lustre/groups/CBBI0818/NOELLE/script_sample/AFR_H.sample.txt

FIX=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/
out=/mnt/lustre/groups/CBBI0818/NOELLE/FinalAttempt/VCF/VarScan/

${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
${FIX}AFR_11_final.calmd.bam  | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
--vcf-sample-list ${sample} --output-vcf ${out}AFR_11_highcov_final.VarScan.vcf > ${out}AFR_11_highcov_final.VarScan.log.vcf

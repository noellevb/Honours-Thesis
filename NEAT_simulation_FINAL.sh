#!/bin/bash
#PBS -N Simaltcov
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=10:ncpus=24
#PBS -l walltime=96:00:00

#NEAT simulation script

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


var=`shuf -i 100-150 -n 1`

mean=`shuf -i 180-220 -n 1`
sd=`shuf -i 15-20 -n 1`


#LowCov
v=$[100 + (RANDOM % 100)]$[1000 + (RANDOM % 1000)]
cov=$[RANDOM % (50 - 10 + 1) + 10 ].${v:1:2}${v:4:3}

#HighCov
#v=$[100 + (RANDOM % 100)]$[1000 + (RANDOM % 1000)]
#cov=$[RANDOM % (85 - 60 + 1) + 60 ].${v:1:2}${v:4:3}


python ${genRead}genReads.py -r \
/mnt/lustre/groups/CBBI0818/REF/ucsc.hg19.fasta \
-R ${var} \
-v ${refvcf}${ANC}${CHR}.vcf \
-c ${cov} \
-m ${sim}${ANC}_mutation_models.p
-o ${outsim}${ANC}/${ANC}_${CHR}_sim_reads \
--bam --vcf --pe ${mean} ${sd} -M 0.1





#if [ ${ANC} == "EUR" ]
#then
#	v=$[100 + (RANDOM % 100)]$[1000 + (RANDOM % 1000)]
#	cov=$[RANDOM % (50 - 10 + 1) + 10 ].${v:1:2}${v:4:3}
#else
#	v=$[100 + (RANDOM % 100)]$[1000 + (RANDOM % 1000)]
#        cov=$[RANDOM % (85 - 60 + 1) + 60 ].${v:1:2}${v:4:3}
#fi


#whole genome simulation

python ${genRead}genReads.py -r \
/mnt/lustre/groups/CBBI0818/REF/ucsc.hg19.fasta \
-R ${var} \
-v ${refvcf}${ANC}${CHR}.vcf \
-c ${cov} \
-m ${sim}${ANC}_mutation_models.p
-o ${outsim}${ANC}/${ANC}_${CHR}_sim_reads \
--bam --vcf --pe ${mean} ${sd} -M 0.1

#python ${genRead}genReads.py -v /mnt/lustre/groups/CBBI0818/NOELLE/Simulation/REFDATA/chr${CHR}.AFR.phase3.v5.vcf -R 35 
#-o ${wkd}Simulation/AFR_sim_reads --bam --vcf --pe 200 20 -M 0 
#-v /mnt/lustre/groups/CBBI0818/NOELLE/Simulation/MT_ref.vcf
#python ${genRead}genReads.py -v /mnt/lustre/groups/CBBI0818/NOELLE/Simulation/REFDATA/chr${CHR}.EUR.phase3.v5.vcf -R 35 -o ${wkd}Simulation/EUR_sim_reads --bam --vcf --pe 200 20 -M 0 -v /mnt/lustre/groups/CBBI0818/NOELLE/Simulation/MT_ref.vcf


#whole genome simulation
#python ${genRead}genReads.py                  \
#        -v /mnt/lustre/groups/CBBI0818/NOELLE/Simulation/REFDATA/chr${CHR}.AFR.phase3.v5.vcf                  \    #VCF reference
#        -R 35                      \	 #Read length
#        -o ${wkd}Simulation/OUTPUT/sim_reads_AFR\	 #Output prefix
#        --bam                       \
#        --vcf                       \	 #paired end fragment length mean and std dev
#        --pe 200 20


#targetted region simulation
#python genReads.py                  \
#        -v hg19.fa                  \
#        -R 126                      \
#        -o /home/me/simulated_reads \
#        --bam                       \
#        --vcf                       \
#        --pe 300 30                 \
#        -t hg19_exome.bed			#bedfile with targetted regions


#inserting specific variants
#python genReads.py                  \
#        -v hg19.fa                  \
#        -R 126                      \
#        -o /home/me/simulated_reads \
#        --bam                       \
#        --vcf                       \
#        --pe 300 30                 \
#        -v NA12878.vcf              \   #Input VCF file. Variants from this VCF will be inserted into the simulated sequence with 100% certainty.
#        -M 0					#Average mutation rate

#parallelizing simulation
#python genReads.py  -v hg19.fa -R 126 -o /home/me/simulated_reads --bam --vcf --job 1 4
#python genReads.py  -v hg19.fa -R 126 -o /home/me/simulated_reads --bam --vcf --job 2 4
#python genReads.py  -v hg19.fa -R 126 -o /home/me/simulated_reads --bam --vcf --job 3 4
#python genReads.py  -v hg19.fa -R 126 -o /home/me/simulated_reads --bam --vcf --job 4 4

#python mergeJobs.py -i /home/me/simulated_reads -o /home/me/simulated_reads_merged -s /path/to/samtools


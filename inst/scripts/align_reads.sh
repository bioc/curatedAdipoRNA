#!/bin/bash

# align single and paired end reads to mm10 using hisat2
# transform the output .sam files to .bam
# sort and index the output .bam files

# define variables
INDEX='mm10/mm10'

# make directory of the alignment output
test ! -d bam && mkdir bam || echo 'Already exists'

# make sample runs file for single end
tail -n+2 runs.csv \
  | grep SINGLE \
  | awk -F, '{print "bam/"$1".bam" "," "fastq/"$2".fastq.gz"}' \
  > samples_runs_singles.csv

# processing single end reads
while read l; do
  OUT=`echo $l | cut -d ',' -f1`
  IN=`echo $l | cut -d ',' -f2`
  if [ ! -f $OUT ]; then
    hisat2 \
      --no-unal \
      -p 8 \
      -x $INDEX \
      -U $IN \
      | samtools view -Sb - \
      | samtools sort -o - > $OUT
    samtools index $OUT
    echo $out was created.
  fi
done < samples_runs_singles.csv

# make sample runs file for paired-end
tail -n+2 runs.csv \
  | grep PAIRED \
  | awk -F, '{print "bam/"$1".bam" "," "fastq/"$2"_1.fastq.gz" " " "fastq/"$2"_2.fastq.gz"}' \
  > samples_runs_paired.csv

# processing paired end reads
while read l; do
  OUT=`echo $l | cut -d ',' -f1`
  IN=`echo $l | cut -d ',' -f2`
  IN1=`echo $IN | cut -d ' ' -f1`
  IN2=`echo $IN | cut -d ' ' -f2`
  if [ ! -f $OUT ]; then
    hisat2 \
      --no-unal \
      -p 8 \
      -x $INDEX \
      -1 $IN1 -2 $IN2 \
      | samtools view -Sb - \
      | samtools sort -o - > $OUT
    samtools index $OUT
    echo $out was created.
  fi
done < samples_runs_paired.csv

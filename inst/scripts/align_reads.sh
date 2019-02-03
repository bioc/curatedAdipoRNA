#!/bin/bash
# define variables
INDEX='mm10/mm10'

# make directory of the alignment output
test ! -d bam && mkdir bam || echo 'Already exists'

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

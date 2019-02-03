#!/bin/bash
# define variables
FASTQ=$(ls fastq | cut -d '.' -f1)

# make qc fastq output
test ! -d qc.fastq && mkdir qc.fastq || echo 'Already exists'

for i in $FASTQ; do
  F=$(printf "qc.fastq/%s_fastqc.zip" "$i")
  if [ ! -f $F ]; then
    fastqc \
      -t 16 \
      -o qc.fastq/ \
      -f fastq \
      fastq/$i.fastq.gz
  fi
done

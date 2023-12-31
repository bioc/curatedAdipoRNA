#!/bin/bash

# run fastqc on all fastq files
# make a list of fastqc output using R package fastqcr

# the output 'qc.rds' goes into `inst/extdata/qc.rds`

# define variables
FASTQ=$(ls fastq | cut -d '.' -f1)

# make directory for fastqc output
test ! -d qc.fastq && mkdir qc.fastq || echo 'Already exists'

# run fastqc on all files
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

# load fastqc output and write list to R object
Rscript --default-packages=tidyverse,fastqcr \
  -e "qc <- map(list.files('qc.fastq', '*.zip', full.names = TRUE), qc_read)" \
  -e "nms <- str_split(list.files('qc.fastq', '*.zip'), '_fastqc.zip', simplify = TRUE)[, 1]" \
  -e "qc <- set_names(qc, mns)" \
  -e "write_rds(qc, 'qc.rds')"



#!/bin/bash

# make directory of counts
test ! -d counts && mkdir counts || echo 'Already exists'

# count reads in gene body
if [ ! -f "counts/gene_body.txt" ]; then
    featureCounts \
    -T 8 \
    -F GTF \
    -t exon \
    -g gene_id \
    -a ./mm10/annotation.gtf \
    -o ./counts/gene_body.txt \
    ./bam/*.bam
    echo "counts/gene_body.txt was created."
fi

# count reads in gene body
if [ ! -f "counts/transcript_level.txt" ]; then
    featureCounts \
    -T 8 \
    -F GTF \
    -t exon \
    -f \
    -O \
    -g transcript_id \
    -a ./mm10/annotation.gtf \
    -o ./counts/transcript_level.txt \
    ./bam/*.bam
    echo "counts/transcript_level.txt was created."
fi
#!/bin/bash

test ! -d fastq && mkdir fastq || echo 'fastq/ is already there.'

cat runs.csv | cut -d ',' -f7 | tail -n +2 | xargs -P100 -n 1 wget -nv -c -P fastq/

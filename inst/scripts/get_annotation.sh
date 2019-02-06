#!/bin/bash

# download mm10 annotations in gtf formate using wget
# make a TxDb object of the annotations using R package GenomicFeatures

# the output 'genes.rds' goes into `inst/extdata/genes.rds`

# download mm10 annotations in gtf
if [ ! -f "mm10/annotation.gtf" ]; then
    wget -o annotation.gtf \
    https://usegalaxy.org/datasets/bbd44e69cb8906b56d4e74ff932f9c50/display?to_ext=gtf
fi

# load gtf and write TxDb to R object
Rscript --default-packages=GenomicFeatures,tidyverse \
  -e "gtf <- makeTxDbFromGFF('mm10/annotation.gtf')" \
  -e "gns <- genes(gtf)" \
  -e "write_rds(gns, 'gene.rds')"

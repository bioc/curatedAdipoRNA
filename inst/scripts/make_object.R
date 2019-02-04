# load required libraries
library(tidyverse)
library(SummarizedExperiment)
library(bib2df)
library(usethis)

# loading data
count <- read_tsv(system.file('extdata', 'gene_body.txt', package = 'curatedAdipoRNA'), skip = 1)
samples <- read_csv(system.file('extdata', 'samples.csv', package = 'curatedAdipoRNA'))
runs <- read_csv(system.file('extdata', 'runs.csv', package = 'curatedAdipoRNA'))
row_ranges <- read_rds(system.file('extdata', 'genes.rds', package = 'curatedAdipoRNA'))
studies <- bib2df(system.file('extdata', 'studies.bib', package = 'curatedAdipoRNA'))
qc <- read_rds(system.file('extdata', 'qc.rds', package = 'curatedAdipoRNA'))

## make counts matrix
ind <- grepl('./bam/GSM*', colnames(count))

mat <- as.matrix(count[, ind])
colnames(mat) <- str_split(colnames(mat), '/|\\.', simplify = TRUE)[ , 4]
rownames(mat) <- count$Geneid

## make colData
pd <- full_join(samples, runs) %>%
  dplyr::select(-ftp) %>%
  unique() %>%
  arrange(id) %>%
  as.data.frame()

rownames(pd) <- pd$id

## make row ranges
ind <- intersect(row_ranges$gene_id, rownames(mat))
row_ranges <- row_ranges[match(row_ranges$gene_id, ind)]

## subset matrix to knowngenes
mat <- mat[row_ranges$gene_id,]

## test objects
all(rownames(mat) == row_ranges$gene_id)

## make a SummarizedExperiment object
gene_counts <- SummarizedExperiment(assays = list(gene_counts = mat),
                                    colData = pd,
                                    rowRanges = row_ranges,
                                    metadata = list(studies = studies,
                                                    qc = qc))

# save object to data/
use_data(gene_counts, overwrite = TRUE)
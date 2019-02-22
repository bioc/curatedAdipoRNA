context("test-data")

# load required libraries
library(SummarizedExperiment)
library(fastqcr)
library(bib2df)
library(readr)

# load object
data("adipo_counts")

# load pre-processed data
count <- read_tsv(system.file('extdata', 'gene_body.txt', package = 'curatedAdipoRNA'), skip = 1, n_max = 10)
samples <- read_csv(system.file('extdata', 'samples.csv', package = 'curatedAdipoRNA'))
runs <- read_csv(system.file('extdata', 'runs.csv', package = 'curatedAdipoRNA'))
row_ranges <- read_rds(system.file('extdata', 'genes.rds', package = 'curatedAdipoRNA'))
studies <- bib2df(system.file('extdata', 'studies.bib', package = 'curatedAdipoRNA'))
qc <- read_rds(system.file('extdata', 'qc.rds', package = 'curatedAdipoRNA'))

test_that("object has the correct class", {
  expect_s4_class(adipo_counts, 'RangedSummarizedExperiment')
})

test_that("the count matrix has the correct format", {
  mat <- assay(adipo_counts)

  expect_true(is.matrix(mat))
  expect_equal(ncol(mat), sum(grepl('GSM*', colnames(count))))
  expect_equal(min(mat), 0)
  expect_equal(sum(is.na(mat)), 0)
})

test_that("colData has essential sample data", {
  cd <- colData(adipo_counts)

  expect_true(all(cd$time %in% samples$time))
  expect_true(all(cd$stage %in% samples$stage))
  expect_true(all(cd$run %in% runs$run))
})

test_that("rowRanges is formated correcly", {
  rr <- rowRanges(adipo_counts)
  expect_true(all(rr$gene_id %in% row_ranges$gene_id))
  expect_equal(sum(duplicated(rr$gene_id)), 0)
})

test_that("metadata is available for all samples", {
  md <- metadata(adipo_counts)
  expect_true(all(sapply(strsplit(names(md$qc), '_'), `[`, 1) %in% runs$run))

  expect_equal(md$studies$BIBTEXKEY, studies$BIBTEXKEY)
  expect_true(all(colData(adipo_counts)$bibtexkey %in% md$studies$BIBTEXKEY))
})

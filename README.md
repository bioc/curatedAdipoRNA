[![Travis build status](https://travis-ci.org/MahShaaban/curatedAdipoRNA.svg?branch=master)](https://travis-ci.org/MahShaaban/curatedAdipoRNA)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/MahShaaban/curatedAdipoRNA?branch=master&svg=true)](https://ci.appveyor.com/project/MahShaaban/curatedAdipoRNA)

# curatedAdipoRNA

A Curated RNA-Seq Dataset of MDI-induced Differentiated Adipocytes (3T3-L1)

A curated dataset of publicly available RNA-sequencing of the 3T3-L1 pre-adipocyte cell line. The package document the data collection, pre-processing and processing of the data.

# Overview

In this document, we introduce the purpose of the `curatedAdipoRNA` package, its contents and its potential use cases. This package is a curated dataset of RNA-Seq samples. The samples are MDI-induced pre-adipocytes (3T3-L1) at different time points/stage of differentiation. The package document the data collection, pre-processing and processing. In addition to the documentation, the package contains the scripts that was used to generated the data in `inst/scripts/`, the processed data in `inst/extdata/` and the final `RangedSummarizedExperiment` object in `data/`.

# Introduction

## What is `curatedAdipoRNA`?

It is an R package for documenting and distributing a curated dataset. The package doesn't contain any R functions.

## What is contained in `curatedAdipoRNA`?

The package contains three differnt things:

1. Scripts for documenting/reproducing the data in `inst/scripts`
2. Pre-processed data in `inst/extdata`
3. Final `RangedSummarizedExperiment` object in `data/`

## What is `curatedAdipoRNA` for?

The `RangedSummarizedExperiment` object contains the `gene_counts`, `colData`, `rowRanges` and `metadata` which can be used for the purposes of conducting differential expression or gene set enrichment analysis on the cell line model.

# Installation

The source code of the pacakge is hosted on GitHub and can be installed using `devtools`.

```r
# install package from github
devtools::install_github('MahShaaban/curatedAdipoRNA')
```

# Docker image

The pre-processing and processing of the data setup environment is available as a `docker` image. This image is also suitable for reproducing this document. The `docker` image can be obtained using the `docker` CLI client.

```
$ docker pull bcmslab/adiporeg_rna:latest
```

# Citing `curatedAdipoRNA`

For citing the package use:

```{r citation, warning=FALSE}
# citing the package
citation("curatedAdipoRNA")
```

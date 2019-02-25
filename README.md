[![Travis build status](https://travis-ci.org/MahShaaban/curatedAdipoRNA.svg?branch=master)](https://travis-ci.org/MahShaaban/curatedAdipoRNA)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/MahShaaban/curatedAdipoRNA?branch=master&svg=true)](https://ci.appveyor.com/project/MahShaaban/curatedAdipoRNA)

# curatedAdipoRNA

A Curated RNA-Seq Dataset of MDI-induced Differentiated Adipocytes (3T3-L1)

# Overview

In this document, we introduce the purpose of the `curatedAdipoRNA` package, 
its contents and its potential use cases. This package is a curated dataset of
RNA-Seq samples. The samples are MDI-induced pre-phagocytes (3T3-L1) at 
different time points/stage of differentiation. The package document the data 
collection, pre-processing and processing. In addition to the documentation, 
the package contains the scripts that was used to generated the data in 
`inst/scripts/` and the final `RangedSummarizedExperiment` object in `data/`.

# Introduction

## What is `curatedAdipoRNA`?

It is an R package for documenting and distributing a curated dataset. The 
package doesn't contain any R functions.

## What is contained in `curatedAdipoRNA`?

The package contains two different things:

1. Scripts for documenting/reproducing the data in `inst/scripts`
2. Final `RangedSummarizedExperiment` object in `data/`

## What is `curatedAdipoRNA` for?

The `RangedSummarizedExperiment` object contains the `adipo_counts`, `colData`,
`rowRanges` and `metadata` which can be used for the purposes of conducting 
differential expression or gene set enrichment analysis on the cell line model.

# Installation

The `curatedAdipoRNA` package can be installed from Bioconductor using 
`BiocManager`.

```{r install_biocmanager,eval=FALSE}
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("curatedAdipoRNA")
```

# Docker image

The pre-processing and processing of the data setup environment is available as
a `docker` image. This image is also suitable for reproducing this document. 
The `docker` image can be obtained using the `docker` CLI client.

```
$ docker pull bcmslab/adiporeg_rna:latest
```

# Citing `curatedAdipoRNA`

For citing the package use:

```{r citation, warning=FALSE}
# citing the package
citation("curatedAdipoRNA")
```

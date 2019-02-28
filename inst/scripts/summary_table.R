# loading required libraries
library(curatedAdipoRNA)
library(tidyverse)

# loading dataset
data("adipo_counts")

# get phenotype data
pd <- colData(adipo_counts)

# make table
as.data.frame(pd) %>%
  group_by(study_name) %>%
  summarise(pmid = unique(pmid),
            nsamples = n(),
            time = paste(unique(time), collapse = '/'),
            stages = paste(unique(stage), collapse = '/'),
            instrument_model = unique(instrument_model)) %>%
  setNames(c('GEO series ID', 'PubMed ID', 'Num. of Samples', 'Time (hr)', 'Differentiation Stage', 'Instrument Model')) %>%
  write_csv('inst/extdata/summary_table.csv')

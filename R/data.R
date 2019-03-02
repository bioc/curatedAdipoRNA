#' Gene counts in differentiating adipocytes
#'
#' @format A \code{RangedSummarizedExperiment} object
#' contains:
#'
#' \describe{
#' \item{assay}{The gene counts \code{matrix}.}
#' \item{colData}{The phenotype data and quality control data of the samples.}
#' \item{rowRanges}{The feature data at gene level.}
#' \item{metadata}{The study level metadata which contains one object called
#' \code{studies}. This is a \code{data.frame} of bibliography information of
#' the studies from which the samples were collected.}
#' }
#'
#' @examples
#' # load the data object
#' data('adipo_counts')
#'
#' # print the object
#' adipo_counts
"adipo_counts"

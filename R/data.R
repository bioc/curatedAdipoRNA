#' Gene counts of differentiating adipocytes
#'
#' @format A \code{\link[SummarizedExperiment]{SummarizedExperiment}} object
#' contains:
#'
#' \describe{
#' \item{gene_counts}{The gene counts \code{matrix}.}
#' \item{colData}{The phenotype data.}
#' \item{rowRanges}{The feature data}
#' \item{metadata}{The metadata \code{metadata} which contain two objects;
#' \code{qc} A \code{list} of \code{\link[fastqcr]{qc_read}} objects of
#' each \code{fastq} file and a \code{data.frame} of the studies from which
#' the samples were collected.}
#' }
"gene_counts"

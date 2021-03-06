% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check-query-sensitivity-to-drug.R
\name{check_query_sensitivity_to_drug}
\alias{check_query_sensitivity_to_drug}
\title{Check if the overall growth on the plates is too low, indicative of a too high concentration of the drug for
this query biological replicate}
\usage{
check_query_sensitivity_to_drug(dir, normalized = TRUE)
}
\arguments{
\item{dir}{A directory containing the screenmill data}

\item{spatial_normalized}{Logical. Should the sensitivity check be done on spatially normalized data ? default is TRUE (see\link[rothSGA:apply_spatial_effect_normalization]{rothSGA::apply_spatial_effect_normalization})}
}
\description{
Creates 'WARNING_too_sick.csv' as an easy to read automated report of the problematic plates.
Creates 'Query_sensitivity.csv' as an easy to read automated report of the effect of the highest drug treatment.
Sweet spot for the differential epistasis map is defined as a drug+mutant specific 30% fitness defect, with a 40-50% maximum
fitness defect compared to the untreated WT strain.
}

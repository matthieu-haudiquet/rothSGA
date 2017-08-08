#' Check for growth of the self-cross. Query strains and array strains K.O. at the same locus should not grow,
#' because geneX::KanMX and geneX::NatMX cannot be both present in an haploid double mutant.
#'
#' Adds WARNING_self_crossing as a logical variable in a screenmill dataset and creates 'WARNING_self_crossing.csv'
#' as an easy to read automated report of the problematic crosses.
#'
#' @param dir A directory containing the screenmill data
#' @param untreated The name of the untreated condition under the column treatment_id (see [screenmill::read_screenmill]) (as a string)
#'
#' @details This will only be applied to the untreated plates.
#'
#' @md
#' @export


check_self_crosses <- function(dir, untreated = 'CisPt-0uM'){

  data <- screenmill::read_screenmill(dir)

  data %>%
    filter(treatment_id == untreated) %>%
    group_by(query_name, bio_replicate) %>%
    summarise(mean_growth_self_cross = mean(size[strain_name == query_name]),
              n_tech_rep = n()) %>%
    filter(mean_growth_self_cross > 25) %>% # Self-cross definition
    write_csv('dir/WARNING_self_crossing.csv')

}

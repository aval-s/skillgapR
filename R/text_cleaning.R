#' Clean job description text
#'
#' Internal helper to normalize job description text by lowercasing,
#' removing punctuation, and collapsing excess whitespace.
#'
#' @param jobs A tibble or data frame containing a \code{job_description} column.
#'
#' @return The input data frame with a cleaned \code{job_description} column.
#'
#' @keywords internal
clean_job_text <- function(jobs) {
  
  if (!"job_description" %in% names(jobs)) {
    stop(
      "`jobs` must contain a `job_description` column.",
      call. = FALSE
    )
  }
  
  jobs %>%
    dplyr::mutate(
      job_description = job_description %>%
        tolower() %>%
        stringr::str_replace_all("[^a-z\\s]", " ") %>%
        stringr::str_squish()
    )
}

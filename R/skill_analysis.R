#' Analyze skill demand from job descriptions
#'
#' Computes the market demand for canonical skills based on
#' job descriptions returned from the JSearch API.
#'
#' @param jobs A tibble containing a column named \code{job_description}.
#'
#' @return A tibble with columns:
#' \describe{
#'   \item{skill}{Canonical skill name}
#'   \item{mentions}{Number of job postings mentioning the skill}
#'   \item{demand_pct}{Percentage of postings mentioning the skill}
#' }
#'
#' @export
analyze_skills <- function(jobs) {
  
  if (!"job_description" %in% names(jobs)) {
    stop(
      "`jobs` must contain a `job_description` column.",
      call. = FALSE
    )
  }
  
  if (nrow(jobs) == 0) {
    stop(
      "No job descriptions provided.",
      call. = FALSE
    )
  }
  
  cleaned_jobs <- clean_job_text(jobs)
  
  count_skill_mentions(cleaned_jobs)
}


# -------------------------
# Internal helper
# -------------------------
count_skill_mentions <- function(cleaned_jobs) {
  
  total_jobs <- nrow(cleaned_jobs)
  
  purrr::map_df(names(canonical_skills), function(skill) {
    
    patterns <- canonical_skills[[skill]]
    
    mentions <- cleaned_jobs %>%
      dplyr::filter(
        stringr::str_detect(
          job_description,
          paste(patterns, collapse = "|")
        )
      ) %>%
      nrow()
    
    tibble::tibble(
      skill = skill,
      mentions = mentions,
      demand_pct = round((mentions / total_jobs) * 100, 1)
    )
  }) %>%
    dplyr::filter(mentions > 0) %>%
    dplyr::arrange(desc(mentions))
}

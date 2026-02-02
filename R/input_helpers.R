#' Print top skills
#'
#' Convenience helper to print the top N skills from a skill demand table.
#'
#' @param skill_df Tibble returned by analyze_skills().
#' @param n Integer. Number of skills to print.
#'
#' @return Invisibly returns the printed tibble.
#' @export
print_top_skills <- function(skill_df, n = 10) {
  
  out <- skill_df %>%
    dplyr::slice_head(n = n)
  
  print(out)
  invisible(out)
}


#' Parse job titles and location
#'
#' Helper function to standardize job titles and location input.
#' Accepts multiple job titles as a character vector.
#'
#' @param job_titles Character vector of job titles.
#' @param location Character string specifying location.
#'
#' @return A list with elements \code{job_titles} and \code{location}.
#' @export
parse_user_input <- function(
    job_titles = "Data Scientist",
    location = "Canada"
) {
  
  if (length(job_titles) == 0 || all(job_titles == "")) {
    job_titles <- "Data Scientist"
  }
  
  if (location == "") {
    location <- "Canada"
  }
  
  job_titles <- trimws(job_titles)
  
  list(
    job_titles = job_titles,
    location = location
  )
}

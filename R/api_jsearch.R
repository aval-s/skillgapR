#' Search job postings via the JSearch API
#'
#' This function queries the JSearch REST API and returns job descriptions
#' for a given job title and location.
#'
#' @param query Character string. Job title to search for.
#' @param location Character string. Location to search in.
#' @param num_pages Integer. Number of pages to fetch (default: 1).
#'
#' @details
#' This function requires a RapidAPI key to be set as an environment variable:
#' \code{RAPIDAPI_KEY}.
#'
#' You can set it using:
#' \preformatted{
#' Sys.setenv(RAPIDAPI_KEY = "your_api_key_here")
#' }
#'
#' @return A tibble with a single column \code{job_description}.
#'
#' @export
fetch_job_descriptions <- function(query, location, num_pages = 1) {
  
  api_key <- Sys.getenv("RAPIDAPI_KEY")
  if (api_key == "") {
    stop(
      "API key not set. Please set RAPIDAPI_KEY using Sys.setenv().",
      call. = FALSE
    )
  }
  
  base_url <- "https://jsearch.p.rapidapi.com/search"
  
  headers <- httr::add_headers(
    "X-RapidAPI-Key" = api_key,
    "X-RapidAPI-Host" = "jsearch.p.rapidapi.com"
  )
  
  responses <- purrr::map(seq_len(num_pages), function(page) {
    
    resp <- httr::GET(
      url = base_url,
      headers,
      query = list(
        query = query,
        location = location,
        page = page
      )
    )
    
    if (httr::status_code(resp) != 200) {
      stop(
        "JSearch API request failed with status ",
        httr::status_code(resp),
        call. = FALSE
      )
    }
    
    resp
  })
  
  responses %>%
    purrr::map(httr::content, as = "text", encoding = "UTF-8") %>%
    purrr::map(jsonlite::fromJSON, flatten = TRUE) %>%
    purrr::map_df(~ .x$data) %>%
    dplyr::transmute(job_description) %>%
    dplyr::filter(!is.na(job_description))
}

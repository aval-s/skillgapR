test_that("fetch_job_descriptions errors when API key is missing", {
  
  old_key <- Sys.getenv("RAPIDAPI_KEY")
  Sys.setenv(RAPIDAPI_KEY = "")
  
  expect_error(
    fetch_job_descriptions(
      query = "Data Scientist",
      location = "Canada"
    ),
    "API key not set"
  )
  
  Sys.setenv(RAPIDAPI_KEY = old_key)
})

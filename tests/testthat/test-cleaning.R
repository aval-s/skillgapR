test_that("clean_job_text normalizes job descriptions", {
  
  df <- tibble::tibble(
    job_description = "Python, SQL & Machine Learning!"
  )
  
  out <- clean_job_text(df)
  
  expect_equal(
    out$job_description,
    "python sql machine learning"
  )
})

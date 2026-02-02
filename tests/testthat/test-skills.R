test_that("analyze_skills returns expected structure", {
  
  df <- tibble::tibble(
    job_description = c(
      "python sql machine learning",
      "statistics python data analysis"
    )
  )
  
  out <- analyze_skills(df)
  
  expect_s3_class(out, "tbl_df")
  expect_true(
    all(c("skill", "mentions", "demand_pct") %in% names(out))
  )
  expect_true(nrow(out) > 0)
})

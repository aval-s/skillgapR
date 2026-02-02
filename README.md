# skillgapR

`skillgapR` is an R package that wraps the JSearch REST API and provides tools
to analyze and visualize job-market skill demand from job descriptions.

The package is designed to help users understand which skills are most commonly
requested across job postings for a given role and location.

---

## Installation

Install the development version from GitHub:

```r
# install.packages("devtools")
devtools::install_github("https://github.com/aval-s/skillgapR")
```
---

## Setup
This package requires a RapidAPI key for the JSearch API.
Set your API key as an environment variable:

```r
Sys.setenv(RAPIDAPI_KEY = "your_api_key_here")
```

---

## Example

```r
library(skillgapR)

# Fetch job postings
jobs <- fetch_job_descriptions(
  query = "Data Scientist",
  location = "Canada"
)

# Analyze skill demand
skills <- analyze_skills(jobs)

# View top skills
print_top_skills(skills)

# Visualize skill demand
plot_skill_demand(skills)
```

This workflow demonstrates how to go from raw job postings to a visualization
of in-demand skills.

---

## License
MIT License
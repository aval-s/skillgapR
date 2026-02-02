#' Plot skill demand
#'
#' Creates a bar chart showing the market demand for skills based on
#' the output of \code{analyze_skills()}.
#'
#' @param skill_df A tibble returned by \code{analyze_skills()}.
#' @param top_n Integer. Number of top skills to display.
#' @param title Character string. Plot title.
#'
#' @return A ggplot object.
#'
#' @export
plot_skill_demand <- function(
    skill_df,
    top_n = 10,
    title = "Top In-Demand Skills"
) {
  
  required_cols <- c("skill", "demand_pct")
  
  if (!all(required_cols %in% names(skill_df))) {
    stop(
      "`skill_df` must contain columns: skill, demand_pct.",
      call. = FALSE
    )
  }
  
  if (!is.numeric(top_n) || top_n <= 0) {
    stop("`top_n` must be a positive integer.", call. = FALSE)
  }
  
  skill_df %>%
    dplyr::slice_head(n = top_n) %>%
    dplyr::mutate(skill = factor(skill, levels = rev(skill))) %>%
    ggplot2::ggplot(
      ggplot2::aes(x = skill, y = demand_pct)
    ) +
    ggplot2::geom_col(fill = "#2C7BE5") +
    ggplot2::coord_flip() +
    ggplot2::labs(
      title = title,
      x = "Skill",
      y = "Market Demand (%)"
    ) +
    ggplot2::theme_minimal(base_size = 13)
}

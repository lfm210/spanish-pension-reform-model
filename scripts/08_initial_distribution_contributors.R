# 08_initial_distribution_contributors.R

# Load required library
library(ggplot2)
library(scales)

# Data: estimated share of active contributors by cohort
cohorts <- c("G2 (35–49)", "G3 (21–34)", "G4 (<21)")
shares <- c(0.36, 0.26, 0.17)  # stylized proportions (totaling 79%)

# Create data frame
cohort_df <- data.frame(Cohort = cohorts, Share = shares)

# Plot
ggplot(cohort_df, aes(x = Cohort, y = Share, fill = Cohort)) +
  geom_col(width = 0.6) +
  labs(
    title = "Initial Distribution of Contributors by Cohort (2025)",
    subtitle = "Share of Active Workforce Entering the ICS",
    x = "Cohort",
    y = "Share of Active Contributors"
  ) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  scale_fill_viridis_d(option = "D", begin = 0.2, end = 0.8) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")

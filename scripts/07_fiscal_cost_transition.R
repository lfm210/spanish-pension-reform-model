# 07_fiscal_cost_transition

# Load required library
library(ggplot2)
library(scales)

# Data: stylized fiscal cost (% of GDP) from 2025 to 2035
transition_years <- 2025:2035
fiscal_cost <- c(0.5, 1.0, 1.8, 2.5, 2.2, 1.9, 1.4, 1.0, 0.7, 0.4, 0.3)

# Create data frame
fiscal_df <- data.frame(Year = transition_years, Cost = fiscal_cost)

# Plot
ggplot(fiscal_df, aes(x = Year, y = Cost)) +
  geom_col(fill = "#1f77b4") +
  labs(
    title = "Fiscal Cost of Transition to ICS (2025–2035)",
    subtitle = "Seed Capital Transfers to G2 and G3 – As % of GDP",
    x = "Year",
    y = "Cost (% of GDP)"
  ) +
  scale_y_continuous(labels = percent_format(scale = 1)) +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

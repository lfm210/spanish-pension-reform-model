# 06_accumulated_pension_capital

# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

# Base parameters
annual_salary <- 30000                     # Gross annual salary (€)
contribution_rate <- 0.07                  # Contribution rate (7%)
annual_contribution <- annual_salary * contribution_rate
contribution_years <- 40                   # Contribution period: 40 years
return_rates <- c(0.035, 0.045, 0.055, 0.065, 0.075)  # Real return scenarios (±2pp from base)

# Create data frame to store results
results <- data.frame(Year = 1:contribution_years)

# Compute accumulated capital for each return scenario
for (r in return_rates) {
  capital <- numeric(contribution_years)
  for (i in 1:contribution_years) {
    capital[i] <- annual_contribution * ((1 + r)^(contribution_years - i))
  }
  results[[paste0("Return_", r * 100)]] <- cumsum(capital)
}

# Reshape for ggplot2
plot_data <- results %>%
  pivot_longer(cols = starts_with("Return_"), names_to = "ReturnRate", values_to = "Capital") %>%
  mutate(ReturnRate = gsub("Return_", "", ReturnRate),
         ReturnRate = paste0(ReturnRate, "%"))

# Plot capital accumulation
ggplot(plot_data, aes(x = Year, y = Capital, color = ReturnRate)) +
  geom_line(linewidth = 1.2) +
  labs(
    title = "Accumulated Pension Capital (2025–2065)",
    subtitle = "Under Different Real Rates of Return (No Guarantee, No Public Transfers)",
    x = "Years of Contribution",
    y = "Total Accumulated Capital (€)",
    color = "Real Return"
  ) +
  theme_minimal(base_size = 14) +
  scale_y_continuous(labels = comma) +
  theme(legend.position = "bottom")

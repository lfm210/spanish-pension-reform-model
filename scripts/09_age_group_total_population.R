# 09_age_group_total_population.R

# Step 1: Remove NA group just in case
population_grouped <- population_grouped %>%
  filter(!is.na(AgeGroup))

# Step 2: Calculate total population per year
population_percent <- population_grouped %>%
  group_by(Periodo) %>%
  mutate(YearTotal = sum(Population)) %>%
  ungroup() %>%
  mutate(Percentage = Population / YearTotal * 100)

# Step 3: Plot as percentage lines
ggplot(population_percent, aes(x = Periodo, y = Percentage, color = AgeGroup)) +
  geom_line(linewidth = 1.2) +
  labs(
    title = "Age Group Share of Total Population (2025–2065)",
    x = "Year",
    y = "Percentage of Population",
    color = "Age Group"
  ) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal()

# 10_projected_population_age_group.R

# ===============================
# Load and process INE population data (Spain)
# ===============================

# Load necessary packages
library(readr)
library(dplyr)
library(ggplot2)

# Step 1: Load CSV file (semicolon-separated)
population_raw <- read_delim(file.choose(), delim = ";")

# Step 2: Filter only 'Total' sex and convert numeric column
population_clean <- population_raw %>%
  filter(Sexo == "Total") %>%
  filter(Edad != "Todas las edades") %>%
  mutate(
    # Extract numeric age from 'Edad' column (e.g., "65 años" -> 65)
    Age = as.integer(gsub(" años", "", Edad)),
    
    # Fix European format: "52.886.369,80" -> "52886369.80"
    Total = as.numeric(gsub(",", ".", gsub("\\.", "", Total)))
  )

# Step 3: Filter the period you need
population_filtered <- population_clean %>%
  filter(Periodo >= 2025 & Periodo <= 2065)

# Step 4: Group by age categories
population_grouped <- population_filtered %>%
  mutate(AgeGroup = case_when(
    Age >= 50 ~ "G1 (50+)",
    Age >= 35 & Age <= 49 ~ "G2 (35–49)",
    Age >= 21 & Age <= 34 ~ "G3 (21–34)",
    Age < 21 ~ "G4 (<21)"
  )) %>%
  group_by(Periodo, AgeGroup) %>%
  summarise(Population = sum(Total, na.rm = TRUE), .groups = "drop")
population_grouped <- population_grouped %>%
  filter(!is.na(AgeGroup))

# Step 5: Plot the population by age group
ggplot(population_grouped, aes(x = Periodo, y = Population, color = AgeGroup)) +
  geom_line(linewidth = 1.2) +
  labs(
    title = "Projected Population by Age Group in Spain (2025–2065)",
    x = "Year",
    y = "Population",
    color = "Age Group"
  ) +
  theme_minimal()

head(population_grouped, 10)

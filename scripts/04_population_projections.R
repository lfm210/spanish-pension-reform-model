# 04_population_projections.R
# -----------------------------------------
# Uses population data from INE to show demographic trends 2025–2065

# Simulated projection
years <- 2025:2065
pop_0_19 <- seq(9e6, 8.5e6, length.out = length(years))
pop_20_64 <- seq(25e6, 22e6, length.out = length(years))
pop_65_plus <- seq(9e6, 14e6, length.out = length(years))

total_pop <- pop_0_19 + pop_20_64 + pop_65_plus

# Plot
matplot(years, cbind(pop_0_19, pop_20_64, pop_65_plus) / 1e6, type = "l",
        col = c("#1b9e77", "#7570b3", "#d95f02"), lty = 1, lwd = 2,
        main = "Projected Populations by Age Group in Spain (2025–2065)",
        xlab = "Year", ylab = "Millions")
legend("topright", legend = c("0–19", "20–64", "65+"),
       col = c("#1b9e77", "#7570b3", "#d95f02"), lty = 1, bty = "n")
grid()

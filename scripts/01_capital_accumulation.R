# 01_capital_accumulation.R
# -----------------------------------------
# Simulates capital accumulation in the ICS over 40 years
# Author: Luis Morandé
# Date: 2025-05
#
# Parameters: annual contribution rate, salary, real return rate
# Output: vector of accumulated capital per year

# Parameters
salary <- 30000                     # Annual salary in EUR
contribution_rate <- 0.07          # 7% contribution
return_rate <- 0.055               # 5.5% real return
years <- 40

annual_contribution <- salary * contribution_rate
capital <- numeric(years)

# Simulation loop
for (i in 2:years) {
  capital[i] <- (capital[i - 1] + annual_contribution) * (1 + return_rate)
}

# Plot
plot(1:years, capital, type = "l", lwd = 2, col = "blue",
     main = "Capital Accumulated in the ICS (5.5% Real Return)",
     xlab = "Years of Contribution", ylab = "Total Capital (€)")
grid()

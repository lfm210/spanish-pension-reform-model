# 02_fiscal_cost_transition.R
# -----------------------------------------
# Estimates the net fiscal cost of transitioning to ICS
# Includes: legacy PAYG spending, new ICS subsidies, projected savings

# Parameters (stylized)
years <- 2025:2065
length_years <- length(years)
payg_cost <- seq(120e9, 160e9, length.out = length_years)  # Growing PAYG cost
ics_subsidy <- seq(2e9, 10e9, length.out = length_years)   # Initial ICS support
long_term_savings <- seq(0, -20e9, length.out = length_years) # Net savings

net_cost <- payg_cost + ics_subsidy + long_term_savings

# Plot
plot(years, net_cost / 1e9, type = "l", col = "red", lwd = 2,
     main = "Net Fiscal Cost of Transition to ICS",
     xlab = "Year", ylab = "Cost in Billion Euros")
grid()

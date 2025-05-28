# 05_sensitivity_analysis.R
# -----------------------------------------
# Compares accumulation under 4%, 5.5%, and 7% real returns

rates <- c(0.04, 0.055, 0.07)
capital_matrix <- matrix(0, nrow = years, ncol = length(rates))

for (j in 1:length(rates)) {
  for (i in 2:years) {
    capital_matrix[i, j] <- (capital_matrix[i - 1, j] + annual_contribution) * (1 + rates[j])
  }
}

matplot(1:years, capital_matrix, type = "l", lty = 1, lwd = 2,
        col = c("blue", "darkgreen", "darkred"),
        main = "Capital Accumulation Under Different Real Returns",
        xlab = "Years", ylab = "Total Capital (€)")
legend("topleft", legend = paste0(rates * 100, "%"), col = c("blue", "darkgreen", "darkred"),
       lty = 1, bty = "n")
grid()

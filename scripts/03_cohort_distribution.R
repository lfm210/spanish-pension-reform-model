# 03_cohort_distribution.R
# -----------------------------------------
# Distributes population cohorts G2, G3, G4
# G2: Full ICS, G3: Partial transition, G4: Retirees with PAYG

# Assumptions
cohorts <- data.frame(
  Group = c("G2", "G3", "G4"),
  AgeRange = c("<35", "35–50", ">50"),
  Share = c(0.33, 0.34, 0.33),
  TransitionFactor = c(1.00, 0.50, 0.00)
)

print(cohorts)

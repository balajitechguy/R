# ------------------------------------------------------------------------------
# Program Name: TRTEMFL Flag Derivation.R
# Author: Balaji
# Date: 24-Feb-2025
# Purpose: Treatment emergent analysis flag derivation
# ------------------------------------------------------------------------------

# Sample data
data <- data.frame(
  USUBJID = c("1001-001", "1001-002", "1001-003", "1001-004", "1001-005", "1001-006"),
  TRTSDT = as.Date(c("2025-01-01", "2025-06-01", "2025-01-05", "2025-07-01", "2025-01-10", "2025-08-01")),
  TRTEDT = as.Date(c("2025-03-31", "2025-08-31", "2025-03-15", "2025-09-30", "2025-04-10", "2025-10-31")),
  AESTDTC = as.Date(c("2025-02-02", "2025-07-15", "2025-01-10", "2025-08-15", "2025-03-15", "2025-11-01")),
  AETERM = c("Headache", "Nausea", "Fatigue", "Dizziness", "Cough", "Fever"),
  AESEV = c("Mild", "Severe", "Moderate", "Mild", "Severe", "Moderate")
)

# TRTEMFL flag
derive_trtemfl <- function(trtsdt, trtedt, aestdtc) {
  # Add 30-day washout period to each treatment end date
  trtedt_washout <- trtedt + 30
  
  # Check if the adverse event date falls within the treatment period or washout period
  # Flag as 'Y' if the adverse event date (AESTDTC) is between the treatment start date (TRTSDT)
  # and the treatment end date with washout period (TRTEDT + 30 days)
  if (aestdtc >= trtsdt & aestdtc <= trtedt_washout) {
    return("Y")
  } else {
    return("N")
  }
}

# Derive the TRTEMFL flag for each row
data$TRTEMFL <- mapply(derive_trtemfl, data$TRTSDT, data$TRTEDT, data$AESTDTC)

# Check
print(data)

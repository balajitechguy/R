# ------------------------------------------------------------------------------
# Program Name: EPOCH Derivation.R
# Author: Balaji
# Date: 24-Feb-2025
# Purpose: Mapping EPOCH
# ------------------------------------------------------------------------------


# Sample data 
data <- data.frame(
  USUBJID = c("1001-001", "1001-002", "1001-003", "1001-004", "1001-005"),
  TRTSDT = as.Date(c("2025-01-01", "2025-01-15", "2025-02-01", "2025-02-15", "2025-03-01")),
  TRTEDT = as.Date(c("2025-03-31", "2025-04-15", "2025-05-01", "2025-05-15", "2025-06-01")),
  VISITDT = as.Date(c("2024-12-20", "2025-02-10", "2025-03-15", "2025-07-10", "2025-11-15")),
  stringsAsFactors = FALSE
)

### Derive EPOCH
epoch <- function(trtsdt, trtedt, visitdt) {
  # Calculate the days between treatment start and visit date
  days_since_treatment_start <- as.numeric(difftime(visitdt, trtsdt, units = "days"))
  
  # EPOCH rules:
  # - Screening: Visit date is before treatment start date
  # - Treatment: Visit date is between treatment start date and treatment end date
  # - Follow-Up: Visit date is after treatment end date
  if (visitdt < trtsdt) {
    return("Screening")
  } else if (visitdt >= trtsdt & visitdt <= trtedt) {
    return("Treatment")
  } else if (visitdt > trtedt) {
    return("Follow-Up")
  }
}

data$EPOCH <- mapply(epoch, data$TRTSDT, data$TRTEDT, data$VISITDT)

# Check
print(data)

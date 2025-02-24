# ------------------------------------------------------------------------------
# Program Name: Partial Date Imputation.R
# Author: Balaji
# Date: 24-Feb-2025
# Purpose: Impute partial dates based on rules
# ------------------------------------------------------------------------------

# Create Dataframe
usubjid <- c("SUBJ01", "SUBJ02", "SUBJ03", "SUBJ04", "SUBJ05", "SUBJ06", "SUBJ07", "SUBJ08", "SUBJ09", "SUBJ10")
dates <- c("2025-02", "2024", "2023-01-05", "2025-05", "2022-12", "2022", "2024-07", "2023-06-15", "2025", "2022-09")
dataframe <- data.frame(usubjid, dates, stringsAsFactors = FALSE)
print(dataframe)

# Impute partial dates
impute_dates <- function(date_vector) {
  imputed_dates <- sapply(date_vector, function(date) {
    if (nchar(date) == 7) {          # Year and month only
      imputed_date <- paste0(date, "-01")
    } else if (nchar(date) == 4) {   # Year only
      imputed_date <- paste0(date, "-01-01")
    } else {                         # Complete date
      imputed_date <- date
    }
    return(imputed_date)
  })
  return(imputed_dates)
}

# Apply the imputation rules
dataframe$dates <- impute_dates(dataframe$dates)

# Check 
print(dataframe)

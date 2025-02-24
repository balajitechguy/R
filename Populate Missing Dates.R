# ------------------------------------------------------------------------------
# Program Name: Populate Missing Dates.R
# Author: Balaji
# Date: 11-Feb-2025
# Purpose: Fill intermediate missing dates
# ------------------------------------------------------------------------------

# Sample Data
df <- data.frame(date = as.Date(c("2023-01-01", "2023-01-05", "2023-03-01")))

# Function to fill in missing intermediate dates
fill_missing_dates <- function(df, date_col) {
  # Get the start and end dates from the data
  start_date <- min(df[[date_col]])
  end_date <- max(df[[date_col]])
  
  # Create a sequence of all dates between the start and end dates
  all_dates <- seq.Date(from = start_date, to = end_date, by = "day")
  
  # Create a new dataframe with all dates
  complete_df <- data.frame(date = all_dates)
  
  return(complete_df)
}

# Example usage
filled_df <- fill_missing_dates(df, "date")

print(filled_df)

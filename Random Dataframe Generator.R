# ------------------------------------------------------------------------------
# Program Name: Random dataframe generator.R
# Author: Balaji
# Date: 11-Feb-2025
# Purpose: Random dataframe generator for testing purpose
# ------------------------------------------------------------------------------

# Function to generate a random data frame using numbers 1 to 9
generate_random_df <- function(nrows, ncols) {
  # Generate a matrix with random numbers between 1 and 9
  random_matrix <- matrix(sample(1:9, nrows * ncols, replace = TRUE), nrow = nrows, ncol = ncols)
  
  # Convert the matrix to a data frame
  df <- data.frame(random_matrix)
  
  # Assign column names to the data frame
  names(df) <- paste0("Var", 1:ncols)
  
  # Return the data frame
  return(df)
}

# Example usage
random_df <- generate_random_df(5, 3)
print(random_df)

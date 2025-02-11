# Function to detect outliers using the IQR method
detect_outliers <- function(x) {
  # Calculate the first quartile (Q1)
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  
  # Calculate the third quartile (Q3)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  
  # Calculate the Interquartile Range (IQR)
  IQR <- Q3 - Q1
  
  # Determine the lower bound for outliers
  lower_bound <- Q1 - 1.5 * IQR
  
  # Determine the upper bound for outliers
  upper_bound <- Q3 + 1.5 * IQR
  
  # Identify the outliers
  outliers <- x[x < lower_bound | x > upper_bound]
  
  # Return the outliers
  return(outliers)
}

# Example usage
data <- c(1, 2, 3, 4, 8989, 6, 7, 8)
detect_outliers(data)


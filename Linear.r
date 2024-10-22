if (!require(ggplot2)) 
  install.packages("ggplot2") 
library(ggplot2) 

# Sample data
linear_data <- data.frame(
  x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  y = c(3, 5, 7, 9, 12, 10, 13, 15, 17, 20)
)

# Build the linear model
linear_model <- lm(y ~ x, data = linear_data)

# Print the summary of the linear regression model
print("Linear Regression Model Summary:")
print(summary(linear_model))

# Create the plot using ggplot2
linear_plot <- ggplot(linear_data, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression", x = "x", y = "y") +
  theme_minimal()

# Print the plot
print(linear_plot)



#Multiple Linear Regression
if (!require(ggplot2)) 
  install.packages("ggplot2") 
library(ggplot2) 
if(!require(gridExtra)) install.packages("gridExtra")

# Sample data
Multiple_data <- data.frame(
  x1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  x2 = c(2, 3, 4, 5, 6, 8, 9, 11, 12, 14),
  y = c(3, 5, 7, 9, 12, 10, 13, 15, 17, 20)
)

# Build the linear model
multiple_model <- lm(y ~ x1+x2, data = Multiple_data)
print("Multiple Regression Model Summary:")
print(summary(multiple_model))

# Create the plot using ggplot2
p1 <- ggplot(Multiple_data, aes(x = x1, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "y vs x1", x = "x1", y = "y") +
  theme_minimal()

p2 <- ggplot(Multiple_data, aes(x = x2, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "y vs x2", x = "x2", y = "y") +
  theme_minimal()

grid.arrange(p1,p2,nrow=1)
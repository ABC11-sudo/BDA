library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Create data
data <- data.frame(
  x = seq(-10, 10, length.out = 100)
)

# True probabilities using logistic function
data$true_prob <- 1 / (1 + exp(-(-2 + 0.5 * data$x)))

# Outcome based on true probability
data$outcome <- ifelse(data$true_prob > 0.5, 1, 0)

# Fit logistic regression model
model <- glm(outcome ~ x, data = data, family = binomial)

# Predict probabilities from the model
data$predicted_prob <- predict(model, type = "response")

# Plot true probabilities and predicted probabilities
ggplot(data, aes(x = x, y = true_prob)) +
  geom_point(color = 'green', size = 2) +
  geom_line(aes(y = predicted_prob), color = 'blue', linewidth = 1) +
  labs(
    title = "S-Shaped Curve of Logistic Regression with Data Points",
    x = "Predictor (x)",
    y = "Probability"
  ) +
  theme_minimal()

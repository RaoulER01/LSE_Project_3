# Assignment Activity 6


# Import required libraries for analysis:
library(caret)
library(tidyverse)

# Import games_sales.csv files:
games_sales <- read.csv("games_sales.csv")

# View the data:
view(games_sales)

# Apply Multiple linear regression model:
sales_model <- lm(Global_Sales ~ NA_Sales + EU_Sales, data = games_sales )
summary(sales_model)

# From the summary of the regression model we can detect and know:
    # P-value for both is lower than 0.5, meaning NA and EU sales have significant impact on predicting global sales.
    # Coefficient estimates state that unit increase in NA and EU lead to increase in global sales
    # R2 value of 0.9648 shows our model is accurate and good in making predictions
    # To predict optimal sales both NA and EU should be included in any model
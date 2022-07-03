# Assignment Activity 5


# Import games_sales.csv files:
games_sales <- read.csv("games_sales.csv")

# Import required libraries for analysis:
library(ggplot2)
library(tidyverse)

# View data:
view(games_sales)

# Summarize the data:
summary(games_sales)

# Check for missing values:
is.na(games_sales)
# No missing values, result of test is "FALSE"

# Convert all values to lowercase under genre for consistency:
games_sales$Genre <- tolower(games_sales$Genre)

# Merge values for the variables Genre_platform
games_sales["Genre_platform"] <- paste(games_sales$Platform, games_sales$Genre)

# Visualize data to understand trends

# How to evaluate the skewness of data:
ggplot(games_sales, aes(Global_Sales))+
  geom_bar(position = "dodge", col = "blue")+
  labs(title = "Global_Sales Distribution", x = "Sales", y = "Count")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_x_continuous(limits = c(0, 20))+
  scale_y_continuous(limits = c(0,500))
# Clearly right skewed as peak of graph is to the left and decreases to right

# What is the correlation between NA_Sales and EU_Sales:
ggplot(games_sales, aes(x = NA_Sales, y = EU_Sales, col = "green"))+
  geom_point()+
  labs(title = "NA Sales & EU Sales", x = "NA Sales", y = "EU Sales")+
  theme(plot.title = element_text(hjust = 0.5))
# Generally positive relationship, as EU sales increase so do NA sales

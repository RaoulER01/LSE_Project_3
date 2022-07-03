# Assignment Activity 4


# Import lego.csv files:
lego <- read.csv("lego.csv")

# Import required libraries for analysis:
library(ggplot2)
library(tidyverse)

# View data:
view(lego)

# To identify which age group submits most reviews use a boxplot chart

# Observe the number of reviews per age, just to get a general sense:
lego_reviews_every_age = lego %>%
  group_by(ages) %>%
  summarise(
    total_reviews = sum(num_reviews)
  )

# Group age into two different sets, under and over 18:
lego <- lego %>%
  mutate(age_group = case_when(
    ages <= 18 ~ "18 and under",
    ages >= 19 ~ "over 18"
  ))

# Comute reviews per age group:
lego_reviews_two_segments = lego %>%
  group_by(age_group) %>%
  summarise(
    total_reviews = sum(num_reviews)
  )

# Plot chart to see review distribution regarding age:
qplot(age_group, total_reviews, data = lego_reviews, fill = age_group,
      geom = "boxplot", xlab = "Age group", ylab = "Number of Reviews",
      main = "Total Reviews per Age group", label = rownames(total_reviews))+
      geom_text(aes(label = total_reviews))

# Creating new dataframe:
data_age25 <- lego[lego$ages >= 25,]

# To help identify prices, its best to visualize through a scatter plot

# Plot scatter plot:
qplot(ages, list_price, data = data_age25, col = list_price,
      geom = c("point"), xlab = "Age", ylab = "Price", main = "Lego price pruchased by customers who are 25 or older")


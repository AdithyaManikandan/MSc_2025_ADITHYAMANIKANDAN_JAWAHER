
library(tidyverse)
library(lubridate)
library(zoo)
library(brms)

# 1. Load COVID-19 Case Data
data <- read_csv("~/Downloads/final project/covid_data.csv")
# Process for India
india <- data %>%
  filter(location == "India") %>%
  dplyr::select(date, new_cases) %>%
  mutate(
    date = as.Date(date),
    new_cases = replace_na(new_cases, 0)
  ) %>%
  arrange(date) %>%
  mutate(
    smoothed = rollmean(new_cases, k = 7, fill = NA, align = "right")
  )


# If the following libarary command does not find a ressult install it first
# comment in the following line
# install.packages("Hmisc")
# install.packages("funModeling")
# install.packages("DataExplorer")
# install.packages("janitor")
# install.packages("here")
# install.packages("DT")


#  Initialize packages

library(tidyverse)
library(Hmisc)
library(funModeling) 
library(DataExplorer)
library(janitor)

# identify where is the current working directory
getwd()

setwd("./individual-assignment-2-ammar-faifi")

# read and load the data into variable
wine_data <- read_csv("./data/winequality-red.csv")

wine_data
# 12 categoricals
# 1,599 observations

# NOTE: the bas naming that will cause us trouble 
# let's use janiter to clean them up
# cleaning the header names
wine_data %>%
    clean_names() -> wine_data


#  Aquick look at the data
glimpse(wine_data)


status(wine_data)
# no NA value
# in `citric acid` 132 zero values


# plot the frequency of each categorical
freq(wine_data)


# plot count of each cat
plot_num(wine_data, path_out = '.')



# find descriptive statistics 
profiling_num(wine_data)

# `total sulfur dioxide` has high sdandard deviation.
describe(wine_data$total_sulfur_dioxide)
# > lowest :   6   7   8   9  10, highest: 155 160 165 278 289

# `chlorides` has large skewness.
describe(wine_data$chlorides)
# mean = 0.08747
# highest = 0.611
# lwoest = 0.012


# `citric acid` might have outliers.
describe(wine_data$citric_acid)


# create a report using DataExplorer
create_report(
    wine_data,
    output_file = "report.html",
    output_dir = ".",
)


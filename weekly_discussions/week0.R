packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "spDataLarge", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

#load libs
library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)

# load data and clean names to consistent format
gdw_df <- read_csv('weekly_discussions/data/Archive/gdw.csv') |> 
  clean_names()

# show first 10 lines of data
head(gdw_df, 10)
# show last 10
tail(gdw_df, 10)

# how many cols?
ncol(x = gdw_df)
# how many rows?
nrow(x = gdw_df)

# make df for country names -- indexing
countries_df <- gdw_df[, "country"]
country_vec <- gdw_df[["country"]]
typeof(country_vec)


# Use group_by() and summarise() to find the number of dams by dam type in gdw_df
gdw_df |> 
  group_by(dam_type) |> 
  summarise(count = n()) |> 
  ungroup()

sub_dam <- gdw_df |> 
  filter(dam_type == "Dam")
sub_dam

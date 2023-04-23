

install.packages('readr')
install.packages('dplyr')
install.packages('jsonlite')
install.packages('janitor')
install.packages('lubridate')



library(readr)
library(dplyr)
library(jsonlite)
library(janitor)
library(lubridate)

# setwd("projects/spill-tracker")
# getwd()

# https://dec.alaska.gov/Applications/SPAR/PublicMVC/PERP/GetSearchedSpills?spillDateStart=01%2F01%2F2023%2000%3A00%3A00&spillDateEnd=04%2F22%2F2023%2000%3A00%3A00


url <- "https://dec.alaska.gov/Applications/SPAR/PublicMVC/PERP/GetSearchedSpills?spillDateStart=01%2F01%2F2023%2000%3A00%3A00&spillDateEnd=12%231%2F2023%2000%3A00%3A00"


data_raw <- read_csv(url)

data <- data_raw %>% clean_names()
  
  
today <- today()
now <- now()

data <- data %>% mutate (time_downloaded = now)
data <- data %>% mutate (date_downloaded = today)
    
write_json(data, paste0("data/spill_data_",today,".json"))
write_json(data, paste0("spill-data.json"))






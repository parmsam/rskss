## code to prepare `DATASET` dataset goes here

# read in keyboard shortcut csv from github repo
data_url <- "https://raw.githubusercontent.com/parmsam/keyboard-shortcuts-rstudio-ide/main/rstudio-keyboard-shortcuts.csv"
raw_ks <- readr::read_csv(data_url)

#define keyboard table for r markdown as a tribble
shortcuts_table <- raw_ks %>%
  janitor::clean_names()

usethis::use_data(shortcuts_table, overwrite = TRUE)

## code to prepare `cards` dataset goes here
library("dplyr")
library("tidyr")
library("readr")
library("forcats")

d = read_csv("cards.csv",
             col_types = cols(
               title = col_character(),
               n1 = col_integer(),
               n2 = col_integer(),
               n3 = col_integer(),
               n4 = col_integer(),
               n5 = col_integer(),
               slot1 = col_character(),
               slot2 = col_character(),
               slot3 = col_character(),
               slot4 = col_character(),
               slot5 = col_character(),
               slot6 = col_character(),
               slot7 = col_character(),
               slot8 = col_character(),
               slot9 = col_character(),
               slot10 = col_character(),
               file = col_character()
             )) %>%
  mutate(type = gsub("[^a-zA-Z]", "", title),
         number = gsub("[^0-9]", "", title),
         number = as.numeric(number)) %>%
  arrange(type, number)


tiles <- d %>%
  select(type, number, starts_with("slot")) %>%
  tidyr::pivot_longer(cols = starts_with("slot"),
                      names_to = "slot",
                      values_to = "color") %>%
  mutate(slot = as.numeric(gsub("slot", "", slot)),
         tile = fct_recode(color,
                           `split`      = "blue",
                           `cross-over` = "pink",
                           `right exit` = "orange",
                           `left exit`  = "yellow")) %>%
  arrange(type, number, slot) %>%
  select(-color)


targets <- d %>%
  select(type, number, n1:n5) %>%
  tidyr::pivot_longer(cols = n1:n5,
                      names_to = "target",
                      values_to = "count") %>%
  mutate(target = as.numeric(gsub("n", "", target))) %>%
  arrange(type, number, target)


usethis::use_data(tiles,   overwrite = TRUE)
usethis::use_data(targets, overwrite = TRUE)

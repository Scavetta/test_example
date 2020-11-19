library(vroom)

# The target is to...

myf <- vroom(, header = FALSE)


myFiles <- list.files("data/", full.names = TRUE)

library(tidyverse)
myFiles %>%
 map_df(~ read.delim(.,
                     header = F,
                     colClasses = c("character", "character", "numeric", "character")),
        .id = "ID") -> fullData

fullData %>%
 as_tibble() %>%
 mutate(value = as.numeric(V4),
        type = as.factor(V3),
        type = fct_recode(type,
                           "Regular insulin dose" = "33",
                           "NPH insulin dose" = "34",
                           "UltraLente insulin dose" = "35",
                           "Unspecified blood glucose measurement" = "48",
                           "Unspecified blood glucose measurement" = "57",
                           "Pre-breakfast blood glucose measurement" = "58",
                           "Post-breakfast blood glucose measurement" = "59",
                           "Pre-lunch blood glucose measurement" = "60",
                           "Post-lunch blood glucose measurement" = "61",
                           "Pre-supper blood glucose measurement" = "62",
                           "Post-supper blood glucose measurement" = "63",
                           "Pre-snack blood glucose measurement" = "64",
                           "Hypoglycemic symptoms" = "65",
                           "Typical meal ingestion" = "66",
                           "More-than-usual meal ingestion" = "67",
                           "Less-than-usual meal ingestion" = "68",
                           "Typical exercise activity" = "69",
                           "More-than-usual exercise activity" = "70",
                           "Less-than-usual exercise activity" = "71",
                           "Unspecified special event" = "72"),
        time = mdy_hm(paste(V1, V2))) %>%
 select(-starts_with("V")) -> fullData

fullData %>%
 ggplot(aes(time, ))

library(lubridate)



"33" = "Regular insulin dose",
"34" = "NPH insulin dose",
"35" = "UltraLente insulin dose",
"48" = "Unspecified blood glucose measurement",
"57" = "Unspecified blood glucose measurement",
"58" = "Pre-breakfast blood glucose measurement",
"59" = "Post-breakfast blood glucose measurement",
"60" = "Pre-lunch blood glucose measurement",
"61" = "Post-lunch blood glucose measurement",
"62" = "Pre-supper blood glucose measurement",
"63" = "Post-supper blood glucose measurement",
"64" = "Pre-snack blood glucose measurement",
"65" = "Hypoglycemic symptoms",
"66" = "Typical meal ingestion",
"67" = "More-than-usual meal ingestion",
"68" = "Less-than-usual meal ingestion",
"69" = "Typical exercise activity",
"70" = "More-than-usual exercise activity",
"71" = "Less-than-usual exercise activity",
"72" = "Unspecified special event"

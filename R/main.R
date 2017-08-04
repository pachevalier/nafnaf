
library("readxl")
library("dplyr")
library("tricky")

tbl_allnaf <- read_excel(path = "data-raw/int_courts_naf_rev_2.xls") %>%
  set_standard_names() %>%
  select(
    code = code, 
    libelle_complet = intitules_de_la_naf_rev_2_version_finale, 
    libelle_65caracteres = intitules_naf_rev_2_en_65_caracteres, 
    libelle_40caracteres = intitules_naf_rev_2_en_40_caracteres
    ) %>%
  filter(is.na(code) == FALSE) %>%
  mutate_all(.funs = stringr::str_to_title) 

tbl_allnaf %>% 
  mutate_all(.funs = stringr::str_length)

tbl_allnaf

tbl_naf_niveau1 <- tbl_allnaf %>% 
  filter(
    grepl(pattern = "^Section", x = code)
    ) 
tbl_allnaf %>% 
  filter(
    grepl(pattern = "^[[:digit:]]{2}$", x = code)
  ) 

library(devtools)
library(tidyverse)
library(roxygen2)
use_git()
use_r("Funkcja1")
document()
check()
use_mit_license("KKrasicki")

use_r("data.R")

check()
load_all()

Funkcja1() -> nowy
nowy %>% glimpse()

nowy %>%
  group_by(Segment) %>%
  summarise(emis = sum(Emisja))

Funkcja1()

install()

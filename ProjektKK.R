library(devtools)
library(tidyverse)
library(roxygen2)
library(dplyr)
library(ProjektK-K)
use_git()
use_r("Funkcja1")
document()
check()
use_mit_license("KKrasicki")

use_package("ggplot2")

use_r("data.R")

check()
load_all()

Funkcja1() -> nowy
nowy %>% glimpse()

nowy %>%
  group_by(Segment) %>%
  summarise(emis = sum(Emisja))

Funkcja1()
?Funkcja1

use_r("Funkcja2")

Funkcja2()




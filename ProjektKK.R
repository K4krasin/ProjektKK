library(devtools)
library(tidyverse)
library(roxygen2)
library(dplyr)
library(ProjektKK)
use_git()
use_r("Funkcja1")
document()
check()
use_mit_license("KKrasicki")

use_package("ggplot2")

use_r("data.R")
use_r("ProjektKK")
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

?Funkcja1
Funkcja1()

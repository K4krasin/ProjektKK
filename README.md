
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ProjektKK

Celem powstałego pakietu jest obliczenie natężenia emisji dowolnego
paliwa. Pakiet ten został stworzony na potrzeby przedmiotu Metody
Inwentaryzacji i Szacowania Emisji.  
Funkcje zawarte w pakiecie tworzą plikową bazę danych na dysku lokalnym.
Cała baza nie jest duża i nie zabiera dużo miejsca na dysku. Dane
zawarte w tym pakiecie nie są aktualizowane więc wystarczy je pobrać
wyłącznie raz.

# Instalacja bez winiety

``` r
# Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

# Instalujesz i wczytujesz
install_github("K4krasin/ProjektKK")
library(ProjektKK)
```

# Instalacja wraz z winietą

``` r
 Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

 Instalujesz i wczytujesz
install_github("K4krasin/ProjektKK", force = T, build_vignettes = T)
library(ProjektKK)
library(ggplot2)
library(dplyr)
```

Winieta jakas, ale rowniez jest dostepna w tym pakiecie.

``` r
Podgląd winiety w przeglądarce
browseVignettes("ProjektKK")

# przejrzyj w oknie pomocy
vignette("ProjektKK")

 wyswietli tylko kod
edit(vignette("ProjektKK"))
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# ProjektKK

Celem powstałego pakietu jest obliczenie natężenia emisji dowolnego
paliwa. Pakiet ten został stworzony na potrzeby przedmiotu Metody
Inwentaryzacji i Szacowania Emisji.  
Funkcje zawarte w pakiecie tworzą plikową bazę danych na dysku lokalnym.
Cała baza nie jest duża i nie zabiera dużo miejsca na dysku. Dane
zawarte w tym pakiecie nie są aktualizowane więc wystarczy je pobrać
wyłącznie raz.

# Instalacja (szybka)

``` r
# Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

# Instalujesz i wczytujesz
install_github("K4krasin/ProjektKK")
library(ProjektKK)
```

Teraz możesz zapoznaź się z samouczkiem w celu skorzystania z pakietu
`ProjektKK`

``` r
#browseURL("https://rpubs.com/rzeszut/giosimport")
```

Możesz skorzysta z pomocy projektu.

``` r
?"ProjektKK"
```

# Instalacja wraz z winietą (wolna)

``` r
 Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

 Instalujesz i wczytujesz
install_github("K4krasin/ProjektKK", force = T, build_vignettes = T)
library(ProjektKK)
```

Ciesz się winietą w systemie pomocy.

``` r
Podgląd winiety w przeglądarce
browseVignettes("ProjektKK")

# przejrzyj w oknie pomocy
vignette("ProjektKK")

 wyswietli tylko kod
edit(vignette("ProjektKK"))
```


#' Obliczanie emisji
#'
#' @param dane
#' @param kategoria
#' @param euro
#' @param mode
#' @param substancja
#'
#' @return
#' @export
#'
#' @examples Funkcja1() -> nowy
#'    nowy %>% glimpse()
#'
#' nowy %>%
#'   group_by(Segment) %>%
#'   summarise(emis = sum(Emisja))
#'
#'
Funkcja1 <- function(dane = input,
                     kategoria = "Passenger Cars",
                     paliwo = "Diesel",
                     #segment = "Mini",
                     euro = "Euro 4",
                     technologia = "DPF",
                     mode = "",
                     substancja = c("EC", "CO")) {

  # Zabezpieczenia argumentĂłw funkcji i danych wejscioweych.

  colnames(wskazniki)[15:17] <- c("Reduction", "Bio", "Procent")

  out <- wskazniki %>%
    filter(Category %in% kategoria) %>%
    filter(Fuel %in% paliwo) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Technology %in% technologia) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)



  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out %>%
    group_by(Segment) %>%
    summarise(emis = sum(Emisja)) -> out

  return(out)


}




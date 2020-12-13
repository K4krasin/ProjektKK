
#' Funkcja oblicza emisje dla aut osobowych poruszajacych sie na diesel, z technologia DPF.
#' Pod uwage brane sa zanieczyszczenia EC oraz CO.
#'
#' @param dane dane wejsciowe
#' @param kategoria rodzaj auta
#' @param euro euro
#' @param mode mode
#' @param substancja zanieczyszczenie
#' @param paliwo rodzaj paliwa
#'
#' @return
#' @export
#'
#'
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




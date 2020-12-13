#' Wykres
#' Przedstawia on zależnosc emisji od natezenia ruchu
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
#' @examples Funkcja2()

Funkcja2 <- function(dane = input,
                     kategoria = "Passenger Cars",
                     paliwo = "Diesel",
                     #segment = "Mini",
                     euro = "Euro 4",
                     technologia ="DPF",
                     mode = "",
                     substancja = c("EC", "CO")) {

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

  gg <- ggplot(out, aes(x=Nat, y=Emisja)) +
    geom_point(aes(col=Pollutant, size=Nat)) +
    geom_smooth(method="loess", se=F) +
    xlim(c(100, 210))
  labs(y="Emisja",
       x="Natezenie",
       title="Wykres przedstawiajcy zależnosc emisji od natezenia ruchu",
       caption = "Source: midwest")



  return(gg)

}


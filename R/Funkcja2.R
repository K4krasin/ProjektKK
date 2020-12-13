#' Title
#'
#' @param dane
#' @param kategoria
#' @param paliwo
#' @param euro
#' @param technologia
#' @param mode
#' @param substancja
#'
#' @return
#' @export
#'
#' @examples

Funkcja2 <- function(dane = input,
                     kategoria = c("Passenger Cars","Light Commercial Vehicles", "Heavy Duty Trucks", "Buses"),
                     paliwo = c("Petrol", "Diesel", "Biodiesel", "Petrol Hybrid", "CNG"),
                     #segment = "Mini",
                     euro = c("Euro 5", "Euro 4"),
                     technologia = c("PFI", "GDI","DPF + SCR","EGR", "DPF" ),
                     mode = "",
                     substancja = c("EC", "CO", "NOx", "CH4", "NH3")) {

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

  plot(gg)

  return(gg)

}


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
                     kategoria = "Passenger Cars",
                     paliwo = "Petrol",
                     #segment = "Mini",
                     euro = "Euro 5",
                     technologia = "GDI",
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

  g <- ggplot(out, aes(segment, emisja, size = pop, frame = year)) +
    geom_point() +
    geom_smooth(aes(group = segment),
                method = "lm",
                show.legend = FALSE) +
    facet_wrap(~continent, scales = "free") +
    scale_x_log10()  # convert to log scale

  animate(g, interval=0.2)

}


library(dplyr)
library(ggplot2)
library(forcats)


decennie_a_partir_annee <- function(annee) {
  return(annee - annee %% 10)
}



#' Statistiques principales
#'
#' @param x vecteur numérique
#' @param statistique string mean by default
#' @param ... 
#'
#' @return A number
#' @export
#'
#' @examples
#' stat_agregee(rnorm(10))
#' stat_agregee(rnorm(10), "ecart-type")
#' stat_agregee(rnorm(10), "variance")
#' 

stat_agregee <- function(x, statistique = "moyenne", ...) {
  if (statistique == "moyenne") {
    res <- mean(x, na.rm = TRUE, ...)
  } else if (statistique == "ecart-type" || statistique == "sd") {
    res <- sd(x, na.rm = TRUE, ...)
  } else if (statistique == "variance") {
    res <- var(x, na.rm = TRUE, ...)
  }
  return(res)
}



read_yaml_secret <- function(path, key) {
  return(yaml::read_yaml(path)[[key]])
}

read_from_parquet <- function(path) {
  df <- arrow::read_parquet(
    path,
    col_select  = c(
      "region", "aemm", "aged", "anai", "catl", "cs1", "cs2", "cs3",
      "couple", "na38", "naf08", "pnai12", "sexe", "surf", "tp",
      "trans", "ur"
    )
  )
  return(df)
}
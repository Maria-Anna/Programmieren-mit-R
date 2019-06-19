#' \code{Assignment} package
#' Please do not touch anything above the TEST_EX_X Lines!
#'
#' @docType package
#' @name Assignment
#' @import dplyr
#' @import ggplot2
#' @import tidyr
#' @import checkmate
#' @import nycflights13
#' @import forcats
NULL

globVars = c(".", "type", "air_time", "distance", "flights", "manufacturer", "model", "planes", "seats", "tailnum")
if(getRversion() >= "2.15.1")  utils::globalVariables(globVars)

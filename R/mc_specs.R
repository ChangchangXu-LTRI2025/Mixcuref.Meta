
#' Specify a mixture cure model for use with Mixcuref.Meta
#'
#' Creates a specification object describing the model structure and engine
#' to be used. The object is later passed to \code{mc_fit()}.
#'
#' @param incidence A formula for the cure probability model.
#' @param latency A formula for the latency (time-to-event) model.
#' @param data A data.frame or a \code{mids} object (for multiple imputation).
#' @param time Character string specifying the time variable.
#' @param status Character string specifying the event indicator (1 = event).
#' @param engine Character string selecting the engine package:
#'   \code{"mixcuref"}, \code{"ClipMixcure"}, or \code{"mixcuref.cr"}.
#'
#' @return An object of class \code{"mc_spec"}.
#'
#' @details
#' The specification object standardises inputs across engines while
#' delegating model fitting to the selected engine package.
#'
#' See \code{vignette("Using Mixcuref.Meta with Real Breast Cancer Datasets")}
#' for worked examples using:
#' \itemize{
#'   \item ANNbcBMdat1
#'   \item ANNbcBMdat2
#'   \item ANNbcBMdat5
#'   \item ANNbcBMdat5_miss
#' }
#'
#' @examples
#' data(ANNbcBMdat1)
#' spec <- mc_spec(
#'   incidence = ~ Her2,
#'   latency   = ~ Her2,
#'   data      = ANNbcBMdat1,
#'   time      = "Time",
#'   status    = "CENS",
#'   engine    = "mixcuref"
#' )

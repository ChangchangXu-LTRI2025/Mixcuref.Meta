#' Create a mixture cure model specification
#'
#' @param incidence Formula for cure probability
#' @param latency Formula for susceptible survival
#' @param data Data frame
#' @param time Name of time variable
#' @param status Name of event indicator (1=event, 0=censored)
#' @param engine One of "mixcuref", "ClipMixcure", "mixcuref.cr"
#' @export
mc_spec <- function(incidence, latency, data,
                      time = "time", status = "status",
                      engine = c("mixcuref", "ClipMixcure", "mixcuref.cr"),
                      ...) {

  engine <- match.arg(engine)

  stopifnot(inherits(incidence, "formula"))
  stopifnot(inherits(latency, "formula"))
  stopifnot(is.data.frame(data))

  structure(
    list(
      incidence = incidence,
      latency = latency,
      data = data,
      time = time,
      status = status,
      engine = engine,
      extras = list(...)
    ),
    class = "mc_spec"
  )
}

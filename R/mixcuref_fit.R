#' Internal adapter for meta-layer
#' @export
mixcuref_fit <- function(spec, control = list()) {

  dat <- spec$data

  mixcuref::fit_mixture_cure(
    incidence = spec$incidence,
    latency = spec$latency,
    time = dat[[spec$time]],
    status = dat[[spec$status]],
    data = dat,
    control = control
  )
}

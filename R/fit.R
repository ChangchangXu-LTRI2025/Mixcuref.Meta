#' Fit a mixture cure model
#'
#' @param spec A mc_spec object
#' @param control Engine-specific control list
#' @export
mc_fit <- function(spec, control = list()) {

  stopifnot(inherits(spec, "mc_spec"))

  fit <- switch(
    spec$engine,

    "mixcuref" = mixcuref::mixcuref_fit(
      spec = spec,
      control = control
    ),

    "ClipMixcure" = ClipMixcure::clipmixcure_fit(
      spec = spec,
      control = control
    ),

    "mixcuref.cr" = mixcuref.cr::mixcurefcr_fit(
      spec = spec,
      control = control
    )
  )

  structure(
    list(
      call = match.call(),
      engine = spec$engine,
      engine_version = utils::packageVersion(spec$engine),
      engine_fit = fit,
      spec = spec
    ),
    class = "mc_fit"
  )
}

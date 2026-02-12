#' Mixcuref.Meta: a meta-layer interface for mixture cure model engines
#'
#' `Mixcuref.Meta` provides a thin, unified front-end for specifying and fitting
#' mixture cure models while delegating all estimation to specialised engine
#' packages.
#'
#' The meta-layer does **not** re-implement likelihoods or optimisation routines.
#' Instead, it standardises model specification, engine selection, and storage of
#' the resulting fitted object.
#'
#' ## Main functions
#' - [mc_spec()] creates a model specification.
#' - [mc_fit()] fits the model using the selected engine.
#'
#' ## Engines
#' Supported engines are:
#' - `mixcuref` (penalised likelihood estimation)
#' - `ClipMixcure` (multiple-imputation workflows and CLIP inference)
#' - `mixcuref.cr` (PLCR confidence region edge points and derived summaries)
#'
#' Each engine package can still be installed and used independently. The
#' meta-layer simply provides a consistent front-end.
#'
#' ## Object model
#' - An `mc_spec` object stores formulas, data, time/status column names, and the
#'   chosen engine.
#' - An `mc_fit` object stores:
#'   - `engine` and `engine_version`
#'   - `engine_fit` (the fitted object returned by the engine)
#'   - `spec` (the original model specification)
#'
#' ## Getting started
#' See `vignette("mixcure-meta", package = "Mixcuref.Meta")` for an end-to-end
#' introduction.
#'
#' @section Minimal example:
#' \donttest{
#' set.seed(1)
#' dat <- data.frame(
#'   time   = rexp(80, 0.2),
#'   status = rbinom(80, 1, 0.6),
#'   x1     = rnorm(80),
#'   x2     = rbinom(80, 1, 0.5)
#' )
#'
#' spec <- mc_spec(
#'   incidence = ~ x1 + x2,
#'   latency   = ~ x1 + x2,
#'   data      = dat,
#'   time      = "time",
#'   status    = "status",
#'   engine    = "mixcuref"
#' )
#'
#' fit <- mc_fit(spec)
#' fit$engine
#' }
#'
#' @seealso [mc_spec()], [mc_fit()]
"_PACKAGE"

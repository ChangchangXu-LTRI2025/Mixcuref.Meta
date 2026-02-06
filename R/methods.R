#' @export
print.mc_fit <- function(x, ...) {
  cat("Mixture cure model\n")
  cat("Engine:", x$engine, "\n")
  cat("Engine version:", as.character(x$engine_version), "\n")
  invisible(x)
}

#' @export
summary.mc_fit <- function(object, ...) {
  summary(object$engine_fit, ...)
}

#' @export
coef.mc_fit <- function(object, ...) {
  stats::coef(object$engine_fit)
}

#' @export
predict.mc_fit <- function(object, newdata = NULL,
                             type = c("survival", "incidence", "latency"), ...) {
  type <- match.arg(type)
  stats::predict(object$engine_fit, newdata = newdata, type = type, ...)
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boxplot.R
\name{boxplot.prettyB}
\alias{boxplot.prettyB}
\alias{boxplot_p}
\title{PrettyB boxplot.default function}
\usage{
\method{boxplot}{prettyB}(
  x,
  ...,
  range = 1.5,
  width = NULL,
  varwidth = FALSE,
  notch = FALSE,
  outline = TRUE,
  names,
  plot = TRUE,
  border = par("fg"),
  col = NULL,
  log = "",
  pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
  horizontal = FALSE,
  add = FALSE,
  at = NULL
)

boxplot_p(
  x,
  ...,
  range = 1.5,
  width = NULL,
  varwidth = FALSE,
  notch = FALSE,
  outline = TRUE,
  names,
  plot = TRUE,
  border = par("fg"),
  col = NULL,
  log = "",
  pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
  horizontal = FALSE,
  add = FALSE,
  at = NULL
)
}
\arguments{
\item{x, ..., range, width}{See \code{?graphics::boxplot.default}}

\item{varwidth, notch, outline}{See \code{?graphics::boxplot.default}}

\item{names, plot, border}{See \code{?graphics::boxplot.default}}

\item{col, log, pars}{See \code{?graphics::boxplot.default}}

\item{horizontal, add, at}{See \code{?graphics::boxplot.default}}
}
\description{
This function overrides the default arguments. See
\code{?graphics::boxplot.default}
}

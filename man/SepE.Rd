% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SEP_cp.R
\name{SepE}
\alias{SepE}
\title{An Unsupervised Adaptive Approach for Causal Inference in Competing Risks Data Using Separable Effects}
\usage{
SepE(
  data,
  tt,
  B1 = NA,
  B2 = NA,
  r1 = NA,
  r2 = NA,
  rr = NA,
  knots = NA,
  M = "LT",
  con = "median",
  level = NULL,
  type = "right"
)
}
\arguments{
\item{data}{A data frame containing the following columns:
\itemize{
  \item \code{X}: Observation time
  \item \code{D}: Censoring indicator (1 = event, 0 = censored)
  \item \code{K}: Competing risk indicator (1 = T1 event, 0 = T2 event)
  \item \code{Z}: Exposure and confounders (exposure should be the first column)
}}

\item{tt}{A numeric vector of time points at which the user is interested in calculating the effects, e.g., \code{c(12, 24, 36)}.}

\item{B1}{Initial value for beta1. Numeric vector. Default is estimated from \code{coxph()}.}

\item{B2}{Initial value for beta2. Numeric vector. Default is estimated from \code{coxph()}.}

\item{r1}{Transformation tuning parameter for event time T1. Numeric. Default is chosen by model selection.}

\item{r2}{Transformation tuning parameter for event time T2. Numeric. Default is chosen by model selection.}

\item{rr}{A numeric vector specifying the candidate range for the transformation tuning parameters \code{r1} and \code{r2}; e.g., \code{seq(0, 2, by = 0.01)}.}

\item{knots}{A numeric vector specifying the internal knots for cubic splines; e.g., \code{seq(0, 2, by = 0.5)}.}

\item{M}{A character string indicating transformation class: \code{"LT"} for logarithmic transformation, \code{"BCT"} for Box-Cox transformation. Default is \code{"LT"}.}

\item{con}{A character string to specify confounder adjustment method: \code{"user"}, \code{"median"}, or \code{"mean"}. Default is \code{"median"}.}

\item{level}{A numeric vector specifying specific levels for confounder adjustment. Default is \code{NULL}.}
}
\value{
An object of class "SepE" containing the following components:
\itemize{
  \item \code{r1}: Selected transformation tuning parameter for T1.
  \item \code{r2}: Selected transformation tuning parameter for T2.
  \item \code{coef.B1}: Estimated regression coefficients for T1 under specified transformation model.
  \item \code{coef.B2}: Estimated regression coefficients for T2 under specified transformation model.
  \item \code{base.R1}: Estimated baseline function for T1 under specified transformation model.
  \item \code{base.R2}: Estimated baseline function for T2 under specified transformation model.
  \item \code{DE}: Estimated separable direct effects.
  \item \code{IE}: Estimated separable indirect effects.
  \item \code{DE.sd}: Standard deviation of \code{DE}.
  \item \code{IE.sd}: Standard deviation of \code{IE}.
  \item \code{LG1}: Log-likelihood curve for T1 across the specified range of transformation tuning parameter.
  \item \code{LG2}: Log-likelihood curve for T2 across the specified range of transformation tuning parameter.
}
}
\description{
This package implements the methods proposed in the paper "An Unsupervised Adaptive Approach for Causal Inference in Competing Risks Data Using Separable Effects". It provides a semiparametric maximum likelihood estimator (SPMLE) under a full-likelihood and separable effects framework, and includes an unsupervised, AIC-based model selection procedure for semiparametric transformation models—specifically, generalized logarithmic and Box-Cox transformations—under competing risks settings.
}

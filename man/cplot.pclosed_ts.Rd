% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cplot.R
\name{cplot.pclosed_ts}
\alias{cplot.pclosed_ts}
\title{Plot Time Series (ts) of P(Closed).}
\usage{
cplot.pclosed_ts(bursts, main = "P(Closed) Time Series", xlim = NULL)
}
\arguments{
\item{bursts}{List of multiple segments}

\item{main}{The title of the plot.}

\item{xlim}{Pass xlim argument to plot() to focus on window of time series}
}
\description{
Plot Time Series (ts) of P(Closed).
}
\examples{

infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")
bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

cplot.pclosed_ts(bursts, "P(Closed) Time Series, 2018-09-20")

}

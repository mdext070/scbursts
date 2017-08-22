% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bursts.R
\name{bursts.start_times_update}
\alias{bursts.start_times_update}
\title{Take an ORDERED list of bursts, and find the starting
time of every 
into multiple -shorter- bursts.}
\usage{
bursts.start_times_update(chunks, breaks)
}
\arguments{
\item{segment}{Segment with $states and $dwells}

\item{t_crit}{Critical time (us) at which to divide bursts}
}
\value{
A list of segments, one per burst.
}
\description{
Take an ORDERED list of bursts, and find the starting
time of every 
into multiple -shorter- bursts.
}
\examples{

# Note that lists are accessed with [[i]], not [i].

chunks <- bursts.separate_tcrit(segment, 14.77155587)
head(chunks[[1]])
>     states      dwells
> 427      0 15.16625000
> 428      1  0.31105000
> 429      0  0.01289401
> 430      1  0.04823000
> 431      0  0.04160000
> 432      1  0.14415000

}
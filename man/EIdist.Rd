\name{EIdist}
\alias{EIdist}
\title{Plot the empirical and exponential distributions of values}
\description{Plot the empirical distribution of a set of values.}
\usage{
 EIdist(event_times,nbreaks=10,main="",xlab="",ylab="",
 xaxticks=NA,xaxlabs=NA)
}
\arguments{
 \item{event_times}{A numeric vector of times of occurrence of events.}
 \item{nbreaks}{The number of breaks desired (but not always delivered).}
 \item{main}{Title for the plot.}
 \item{xlab}{X axis label for the plot.}
 \item{ylab}{Y axis label for the plot.}
 \item{xaxticks}{Optional X tick mark positions.}
 \item{xaxlabs}{Optional X tick labels.}
}
\details{
 \samp{EIdist} calculates the intervals between the times passed in 
 \samp{event_times} and plots a histogram of their distribution. It adds
 a smoothed line based on the \samp{mids} and \samp{counts}. It then
 calls \samp{fitdistr} from \pkg{MASS} to get an estimated rate for a
 model exponential distribution. A second line is added to the plot for
 comparison with the smoothed empirical distribution.
}
\value{nil}
\author{Jim Lemon}
\examples{
 \dontrun{
  # won't pass check due to the call to fitdistr
  data(florida_hurr20)
  fh_dates<-
   as.Date(paste(florida_hurr20$day,florida_hurr20$month,
   florida_hurr20$year,sep="-"),"\%d-\%b-\%Y")
  fh_days<-as.numeric(fh_dates)
  fh_ints<-diff(fh_days)
  fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
  require(MASS)
  EIdist(fh_days,main="Empirical distribution of hurricanes",
   xlab="Intervals in days",ylab="Frequencies")
 }
}
\keyword{misc}

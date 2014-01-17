\name{EIplot}
\alias{EIplot}
\title{Plot the intervals between times against the times}
\description{Plot the intervals between times against the times.}
\usage{
 EIplot(event_times,main="",xlab="",ylab="",xaxticks=NA,xaxlabs=NA)
}
\arguments{
 \item{event_times}{A numeric vector of times of occurrence of events.}
 \item{main}{Title for the plot.}
 \item{xlab}{X axis label for the plot.}
 \item{ylab}{Y axis label for the plot.}
 \item{xaxticks}{Optional X tick mark positions.}
 \item{xaxlabs}{Optional X tick labels.}
}
\details{
 \samp{EIplot} calculates the intervals between the times passed in 
 \samp{event_times} and plots a scattergram of intervals against times. 
 It adds a smoothed line and a "rug" of the event times to allow visual
 inspection for trend.
}
\value{nil}
\author{Jim Lemon}
\examples{
 # Florida hurricane analysis (20th century)
 data(florida_hurr20)
 oldloc<-Sys.setlocale("LC_TIME", "C")
 fh_dates<-
  as.Date(paste(florida_hurr20$day,florida_hurr20$month,
  florida_hurr20$year,sep="-"),"\%d-\%B-\%Y")
 fh_days<-as.numeric(fh_dates)
 fh_ints<-diff(fh_days)
 fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
 EIplot(fh_days,main="Florida hurricanes, 1900-1999",
  xlab="Year",ylab="Interval between hurricanes (days)",
  xaxticks=as.Date(as.character(seq(1900,2000,by=20)),"\%Y"),
  xaxlabs=seq(1900,2000,by=20))
 Sys.setlocale("LC_TIME", oldloc)
}
\keyword{misc}

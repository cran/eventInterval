\name{EIglm}
\alias{EIglm}
\title{Perform a GLM on times of events}
\description{Perform a GLM with the intervals between events as the response 
 and the times of the events as a predictor.}
\usage{
 EIglm(event_times,event_vars=list(),formula=NULL)
}
\arguments{
 \item{event_times}{A numeric vector of times of occurrence of events.}
 \item{event_vars}{Optional predictors to include in the GLM.}
 \item{formula}{A optional string that can be coerced to a valid formula.}
}
\details{
 \samp{EIglm} calculates the intervals between the times passed in 
 \samp{event_times} and calls \samp{glm} with \samp{family="Gamma"}.
 If the times are not in increasing order, they will be sorted. If there are
 any zero length intervals, the events that occur in the same time increment
 are spread out over that time increment. 

 If more predictors are passed in \samp{event_vars} these will be added to
 the formula passed to \samp{glm}. When passing predictors based on the events,
 remember to discard the first value as the intervals are calculated between
 events. This means that the interval is unknown for the first event.

 \samp{EIglm} only tests the effects of the variables specified and does not
 test interactions. If a more complex model is to be tested, the user must
 directly call \samp{glm} and compose a formula for the model. Note that
 because there is no \samp{data} argument, each term in the model must be
 specified explicitly.
}
\value{An object of class \samp{glm}.}
\author{Jim Lemon}
\references{
 Blake, E.S., Rappaport, E.N. & Landsea, C.W. (2007)
 The deadliest, costliest, and most intense United States tropical
 cyclones from 1851 to 2006 (and other frequently requested hurricane facts).
 NOAA Technical Memorandum NWS TPC-5, Miami: National Weather Service.

 Florida Climate Center (2013)
 Florida statewide averaged temperature data (in degrees Fahrenheit).
 URL: http://climatecenter.fsu.edu/products-services/data/statewide-averages/temperature
 accessed 28/5/2013
}
\examples{
 \dontrun{
  # Florida hurricane analysis (20th century)
  data(florida_hurr20)
  oldloc<-Sys.setlocale("LC_TIME", "C")
  fh_dates<-
   as.Date(paste(florida_hurr20$day,florida_hurr20$month,
   florida_hurr20$year,sep="-"),"\%d-\%B-\%Y")
  fh_days<-as.numeric(fh_dates)
  fh_ints<-diff(fh_days)
  fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
  # run a Poisson analysis on the counts
  print(summary(glm(fh_counts~I(1900:1999),family="poisson")))
  EIglm(fh_days)
  data(florida_temp20)
  plot(florida_temp20$year,florida_temp20$Annual,type="b",
    main="Average temperature in Florida",xlab="Year",ylab="degrees F")
  lines(supsmu(florida_temp20$year,florida_temp20$Annual),lwd=2)
  # define a function to match values
  findval<-
   function(x,set) return(which(set \%in\% x))
  ftemp_years<-florida_temp20$Annual[unlist(sapply(florida_hurr20$year,
   FUN=findval,florida_temp20$year))]
  EIglm(fh_days,list(ft=ftemp_years[-1]))
  Sys.setlocale("LC_TIME", oldloc)
 }
}
\keyword{misc}

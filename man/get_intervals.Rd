\name{get_intervals}
\alias{get_intervals}
\title{Calculate the intervals between events}
\description{Calculate the intervals between a series of times, spreading
 out equal times in one unit of time.}
\usage{
 get_intervals(event_times)
}
\arguments{
 \item{event_times}{A numeric vector of times of occurrence of events.}
}
\details{
 \samp{get_intervals} calculates the intervals between the times passed
 in \samp{event_times}, adding increments to spread out times that are exactly
 the same. This can be a problem when the times are integers, as in days. The
 spreading out of events avoids zero intervals. The rationale for this is that
 even if more than event occurred on the same day, it is extremely unlikely 
 that the events occurred at exactly the same time of day. The best estimate
 of the times of day is a uniform distribution over one day.
}
\value{a vector of intervals between the vector of times passed}
\author{Jim Lemon}
\examples{
 event_times<-c(1,3,5,5,7,9,10,10,10,12)
 get_intervals(event_times)
}
\keyword{misc}

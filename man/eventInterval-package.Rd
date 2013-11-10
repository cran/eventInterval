\name{eventInterval-package}
\alias{eventInterval-package}
\alias{eventInterval}
\docType{package}
\title{
Sequential event interval analysis
}
\description{
Functions for analysis of rate changes in sequential events. Appropriate data
are the times of observation of well defined events, such as equipment
failures or deaths.
}
\details{
\tabular{ll}{
Package: \tab eventInterval\cr
Version: \tab 1.0\cr
Date: \tab 2013-05-28\cr
Depends: \tab MASS\cr
License: \tab GPL (>=2)\cr
Packaged: \tab 2013-05-28 11:12:16 UTC; root\cr
Built: \tab R 3.0.0; ; 2013-05-28 11:12:19 UTC; unix\cr
}

Index:
\preformatted{
EIglm		Perform a GLM with intervals as response variable
EIdensity	Plot the empirical and theoretical densities of intervals
EIplot		Plot the intervals against the occurrence of the events
rescale		scale numeric values into a new range
}
The basic model is of events that are independent and uniformly distributed
in time. This assumption underlies the use of the exponential distribution
in the generalized linear models produced by \samp{EIglm}. In general, it is
expected that deviations from uniformly distributed intervals follow a 
function that is expressed in one or more of the predictors. A predictor that 
is included by default is the times of the occurrence of the events. This will 
reveal linear changes in the rate. Other predictors may test for non-linear or 
cyclic changes in rate.

Event interval analysis can be a useful alternative to Poisson based analysis
when few events occur in the counting intervals. Its advantage in power to
detect changes in rate diminishes as the number of events increases.

This type of analysis was known as event history analysis, but the phrase is
now usually applied to the analysis of the antecedents of events, whether
sequential or not.
}
\author{
Jim Lemon <jim@bitwrit.com.au>,
Maintainer: Jim Lemon <jim@bitwrit.com.au>
}
\references{
Maguire, B.A., Pearson, E.S. & Wynn, A.H.A. (1952)
The time intervals between industrial accidents.
Biometrika, 39(1/2): 168-180.

Whitworth, W.A. (1901) Choice and chance. (3rd ed.) Cambridge: Deighton Bell.
}
\keyword{ package }

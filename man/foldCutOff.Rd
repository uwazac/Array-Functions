\name{foldCutOff}
\alias{foldCutOff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to help with basic array functionality
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
foldCutOff(arrayData, cutofflevel = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arrayData}{
%%     ~~Describe \code{arrayData} here~~
}
  \item{cutofflevel}{
%%     ~~Describe \code{cutofflevel} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (arrayData, cutofflevel = 2) 
{
    cutoff <- arrayData[arrayData$Fold_Change > cutofflevel, 
        ]
    return(cutoff)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

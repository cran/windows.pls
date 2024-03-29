% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cv.wpls.R
\name{cv.wpls}
\alias{cv.wpls}
\title{Cross-validation for segmented spectral regions of the original spectra.}
\usage{
cv.wpls(
  xblock = NULL,
  yblock = NULL,
  windows = 3,
  window.size = 30,
  increment = 10,
  cv = 10,
  scale = FALSE,
  ncp = 10,
  mode = "wpls"
)
}
\arguments{
\item{xblock}{A matrix containing one spectra for each observation.}

\item{yblock}{A vector containing the concentration associated to each spectra in the \emph{xblock} matrix.}

\item{windows}{Parameter used when either ‘wpls’ or ‘ewpls’ is chosen. Points out how many windows the user wants to divide the spectra in.}

\item{window.size}{Parameter used when ‘swpls’ is chosen. Indicates the width of the window that slides along the spectra.}

\item{increment}{Parameter used when ‘swpls’ is chosen. Indicates how many steps the window slides forward.}

\item{cv}{Number of segments used for cross-validation.}

\item{scale}{logical, asks to perform standardization.}

\item{ncp}{Maximum number of principal components to be computed for each model.}

\item{mode}{'wpls','ewpls' or 'swpls', see \strong{Details} for more.}
}
\value{
Returns a list containing:

\item{xblock}{Matrix containing spectra used to train the model.}
\item{yblock}{Vector containing values of the dependent variable.}
\item{cal}{List containing RMSE and R2 of calibratrion.}
\item{cv}{List containing RMSE and R2 of cross-validation.}
\item{ncp}{Number of components used to compute the model.}
\item{scale}{Contains logical condition used for standardization.}
\item{cv.segment}{ Number of segments used for cross-validation.}
}
\description{
Computes and stores cross-validation metrics for one of the three possible modes ‘wpls’, ‘epls’, ‘swpls’.
}
\details{
NIR and Vis-NIR technologies are used to obtain spectra which might
contain helpful information about the content of the samples the user is investigating.
Since this method has been combined with multivariate statistical methods, researchers have
been questioning the importance of using spectra in its entirety or if it might be a better
solution to divide it in smaller regions which can guarantee higher performance in terms of predictions.
Several methods have been proposed, from selecting only some regions to selecting combinations of those which are performing the best.
This function provides three possibilities:
\enumerate{
\item \strong{‘wpls’}, which stands for \emph{Window PLS}, divides the original spectra into several windows, computes PLS and stores metrics of interest such as RMSE and R2 for calibration and cross-validation both.
\item \strong{‘ewpls’}, which stands for \emph{Evolving Window PLS}, divides the original spectra into several windows, but each new window incorporates the previous ones, so that we are comparing smaller windows with the entire spectra.
\item \strong{’swpls’}, which stands for \emph{Sliding Window Window PLS}, ,asks the width of the window that will be used to compute the model and the step that the window will make forward in the spectra so that a new model is calculated. In this way the window slides along spectra and computes several models, which will be compared with metrics.
}

This function proposes a simpler version of \strong{iPLS}, that can be found in the \strong{mdatools} package, which divides the spectra in smaller segments and tries to find the combination with the lowest RMSE in cross-validation.
}
\examples{
data(beer)
conc=beer[,1]
sp=beer[,2:ncol(beer)]
names(sp)=convert.names.wl(1100,2250,2)
conc=unlist(conc)
mywpls=cv.wpls(sp, conc,mode='wpls', windows = 5)
}
\references{
\enumerate{
\item Chen, J., Yin, Z., Tang, Y. et al. Vis-NIR spectroscopy with moving-window PLS method applied to rapid analysis of whole blood viscosity. Anal Bioanal Chem 409, 2737–2745 (2017).
\item Y.P. Du, Y.Z. Liang, J.H. Jiang, R.J. Berry, Y. Ozaki, Spectral regions selection to improve prediction ability of PLS models by changeable size moving window partial least squares and searching combination moving window partial least squares, Analytica Chimica Acta, Volume 501, Issue 2, 2004, Pages 183-191,
\item \strong{mdatools} package, https://github.com/svkucheryavski/mdatools
}
}

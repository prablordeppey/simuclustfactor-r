% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tandem.R
\name{fit.twcfta}
\alias{fit.twcfta}
\alias{fit.twcfta,tandem-method}
\title{TWCFTA model}
\usage{
fit.twcfta(model, X_i_jk, full_tensor_shape, reduced_tensor_shape)

\S4method{fit.twcfta}{tandem}(model, X_i_jk, full_tensor_shape, reduced_tensor_shape)
}
\arguments{
\item{model}{Initialized tandem model.}

\item{X_i_jk}{Matricized tensor along mode-1 (I objects).}

\item{full_tensor_shape}{Dimensions of the tensor in full space.}

\item{reduced_tensor_shape}{Dimensions of tensor in the reduced space.}
}
\value{
Output attributes accessible via the '@' operator.
\itemize{
  \item U_i_g0 - Initial object membership function matrix.
  \item B_j_q0 - Initial factor/component matrix for the variables.
  \item C_k_r0 - Initial factor/component matrix for the occasions.
  \item U_i_g - Final/updated object membership function matrix.
  \item B_j_q - Final/updated factor/component matrix for the variables.
  \item C_k_r - Final/updated factor/component matrix for the occasions.
  \item Y_g_qr - Derived centroids in the reduced space (data matrix).
  \item X_i_jk_scaled - Standardized dataset matrix.
  \item BestTimeElapsed - Execution time for the best iterate.
  \item BestLoop - Loop that obtained the best iterate.
  \item BestKmIteration - Number of iteration until best iterate for the K-means.
  \item BestFaIteration - Number of iteration until best iterate for the FA.
  \item FaConverged - Flag to check if algorithm converged for the K-means.
  \item KmConverged - Flag to check if algorithm converged for the Factor Decomposition.
  \item nKmConverges - Number of loops that converged for the K-means.
  \item nFaConverges - Number of loops that converged for the Factor decomposition.
  \item TSS_full - Total deviance in the full-space.
  \item BSS_full - Between deviance in the reduced-space.
  \item RSS_full - Residual deviance in the reduced-space.
  \item PF_full - PseudoF in the full-space.
  \item TSS_reduced - Total deviance in the reduced-space.
  \item BSS_reduced - Between deviance in the reduced-space.
  \item RSS_reduced - Residual deviance in the reduced-space.
  \item PF_reduced - PseudoF in the reduced-space.
  \item PF - Actual PseudoF value to obtain best loop.
  \item Labels - Object cluster assignments.
  \item FsKM - Objective function values for the KM best iterate.
  \item FsFA - Objective function values for the FA best iterate.
  \item Enorm - Average l2 norm of the residual norm.
}
}
\description{
Implements K-means clustering and afterwards factorial reduction
in a sequential fashion.
}
\details{
{
   The procedure requires sequential clustering and factorial decomposition.
   \itemize{
      \item The K-means clustering algorithm is initially applied to the
      matricized tensor X_i_jk to obtain the centroids matrix X_g_jk and the
      membership matrix U_i_g.
      \item The Tucker2 decomposition technique is then implemented on the
      centroids matrix X_g_jk to yield the core centroids matrix Y_g_qr and
      the component weights matrices B_j_q and C_k_r.
   }
}
}
\note{
{
   \itemize{
      \item This procedure is useful to further interpret the between clusters
      variability of the data and to understand the variables and/or occasions
      that most contribute to discriminate the clusters. However, the application
      of this technique could lead to the masking of variables that are not
      informative of the clustering structure.
      \item since the Tucker2 model is applied after the clustering, this
      cannot help select the most relevant information for the clustering in
      the dataset.
   }
}
}
\examples{
X_i_jk = generate_dataset()$X_i_jk
model = tandem()
twcfta = fit.twcfta(model, X_i_jk, c(8,5,4), c(3,3,2))

}
\references{
\insertRef{tandemModels}{simuclustfactor}
\insertRef{tucker1966}{simuclustfactor}
}
\seealso{
{
 \code{\link{fit.twfcta}} \code{\link{tandem}}
}
}

#'@export
#'@useDynLib fortranMatrix, .registration = TRUE
fill_my_matrix <- function(N=10, K=5, ncores=4) {
  A <- .Fortran("fill_matrix", A = matrix(nrow = N, ncol = K),
                N = as.integer(N),
                K = as.integer(K),
                ncores = as.integer(ncores))
  return(A$A)
}

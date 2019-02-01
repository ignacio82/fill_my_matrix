#'@export
#'@useDynLib fortranMatrix, .registration = TRUE
fill_my_matrix <- function(N=10, K=5, ncores=4) {
  A <- .Fortran("fill",
                N = as.integer(N),
                K = as.integer(K),
                A = matrix(1982,nrow = N, ncol = K),
                ncores = as.integer(ncores))
  return(A$A)
}

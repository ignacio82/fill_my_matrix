#'@export
#'@useDynLib fortranMatrix, .registration = TRUE
fill_my_matrix <- function(N=10, K=5, nthreads=4) {
  (OpenMPController::omp_set_num_threads(nthreads))
  A <- .Fortran("fill",
                N = as.integer(N),
                K = as.integer(K),
                A = matrix(1982,nrow = N, ncol = K),
                nthreads = as.integer(nthreads))
  return(A$A)
}

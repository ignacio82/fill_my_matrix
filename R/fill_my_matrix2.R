fillmatrix_f2 <- function(N, K, nthreads) {
  if (!is.integer(N)) {storage.mode(N) <- 'integer'}
  if (!is.integer(K)) {storage.mode(K) <- 'integer'}
  if (!is.integer(nthreads)) {storage.mode(nthreads) <- 'integer'}
  .Call(c_fill_f, N, K, nthreads)
}

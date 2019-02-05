#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <Rmath.h>
#include <R_ext/Rdynload.h>

void F77_NAME(fill)(int N, int K, int nthreads, double *ret[N][K]); /// Am I doing this right??

extern SEXP c_fill_f(SEXP N, SEXP K, SEXP nthreads){
  //const int NK = asInteger(N*K); /// How do i do this?
  SEXP ret;
  //PROTECT(ret = allocVector(REALSXP, NK)); /// How do i do this?
  F77_CALL(fill)(N, K, nthreads, REAL(ret));
  //UNPROTECT(NK); /// How do i do this?
  return(ret);
}

static const R_CallMethodDef CallEntries[] = {
  {"c_fill_f",   (DL_FUNC) &c_fill_f,   3},
  {NULL,         NULL,                0}
};

void R_init_fortranMatrix (DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}

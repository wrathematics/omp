/* Automatically generated. Do not edit by hand. */

#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <stdlib.h>

extern SEXP R_omp_avail();
extern SEXP R_omp_get_max_threads();
extern SEXP R_omp_get_num_procs();
extern SEXP R_omp_get_wtick();
extern SEXP R_omp_get_wtime();
extern SEXP R_omp_set_num_threads(SEXP num_threads);

static const R_CallMethodDef CallEntries[] = {
  {"R_omp_avail", (DL_FUNC) &R_omp_avail, 0},
  {"R_omp_get_max_threads", (DL_FUNC) &R_omp_get_max_threads, 0},
  {"R_omp_get_num_procs", (DL_FUNC) &R_omp_get_num_procs, 0},
  {"R_omp_get_wtick", (DL_FUNC) &R_omp_get_wtick, 0},
  {"R_omp_get_wtime", (DL_FUNC) &R_omp_get_wtime, 0},
  {"R_omp_set_num_threads", (DL_FUNC) &R_omp_set_num_threads, 1},
  {NULL, NULL, 0}
};

void R_init_omp(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}

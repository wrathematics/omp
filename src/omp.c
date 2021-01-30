#include <R.h>
#include <Rinternals.h>

#ifdef _OPENMP
#include <omp.h>
#endif

#define INT(x) INTEGER(x)[0]
#define DBL(x) REAL(x)[0]


SEXP R_omp_get_max_threads()
{
  SEXP ret;
  PROTECT(ret = allocVector(INTSXP, 1));
  
#ifdef _OPENMP
  INT(ret) = omp_get_max_threads();
#else
  INT(ret) = 1;
#endif
  
  UNPROTECT(1);
  return ret;
}



SEXP R_omp_get_num_procs()
{
  SEXP ret;
  PROTECT(ret = allocVector(INTSXP, 1));
  
#ifdef _OPENMP
  INT(ret) = omp_get_num_procs();
#else
  INT(ret) = 1;
#endif
  
  UNPROTECT(1);
  return ret;
}



SEXP R_omp_get_wtick()
{
  SEXP ret;
  PROTECT(ret = allocVector(REALSXP, 1));
  
#ifdef _OPENMP
  DBL(ret) = omp_get_wtick();
#else
  INT(ret) = 0.0;
#endif
  
  UNPROTECT(1);
  return ret;
}



SEXP R_omp_get_wtime()
{
  SEXP ret;
  PROTECT(ret = allocVector(REALSXP, 1));
  
#ifdef _OPENMP
  DBL(ret) = omp_get_wtime();
#else
  INT(ret) = 0.0;
#endif
  
  UNPROTECT(1);
  return ret;
}



SEXP R_omp_set_num_threads(SEXP num_threads)
{
#ifdef _OPENMP
  omp_set_num_threads(INT(num_threads));
#endif
  return R_NilValue;
}

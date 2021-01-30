#include <R.h>
#include <Rinternals.h>

#ifdef _OPENMP
#include <omp.h>
#endif


SEXP R_omp_avail()
{
  SEXP ret;
  PROTECT(ret = allocVector(LGLSXP, 1));
  
#ifdef _OPENMP
  LOGICAL(ret)[0] = 1;
#else
  LOGICAL(ret)[0] = 0;
#endif
  
  UNPROTECT(1);
  return ret;
}

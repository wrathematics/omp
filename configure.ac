AC_PREREQ([2.69])
AC_INIT(DESCRIPTION)

# Get C compiler from R
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi
CC=`"${R_HOME}/bin/R" CMD config CC`

AC_PROG_CC_C99
AC_OPENMP
if test -n "${OPENMP_CFLAGS}"; then
  have_omp="yes"
  OMP_FLAGS="\$(SHLIB_OPENMP_CFLAGS)"
else
  have_omp="no"
  OMP_FLAGS=""
fi

echo " "
echo "******************** Results of omp package configure ********************"
echo "* OpenMP Report"
echo "*   >> Compiler support: ${have_omp}"
echo "*   >> FLAGS = ${OMP_FLAGS}"
echo "**************************************************************************"
echo " "

AC_SUBST(OMP_FLAGS)
AC_OUTPUT(src/Makevars)

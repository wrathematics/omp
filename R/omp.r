#' get_max_threads
#' 
#' Get the number of threads OpenMP is using.
#' 
#' @details
#' This is equivalent to calling \code{omp_get_num_threads()} from a parallel
#' region where the number of threads is unset inside the pragma.
#' 
#' @return
#' An integer.
#' 
#' @examples
#' omp::get_max_threads()
#' 
#' @seealso \code{\link{get_num_procs}}
#' @references \url{https://www.openmp.org/spec-html/5.1/openmpsu161.html#x205-2380003.7.1}
#' 
#' @useDynLib omp R_omp_get_max_threads
#' @export
get_max_threads = function()
{
  .Call(R_omp_get_max_threads)
}



#' get_num_procs
#' 
#' Returns the number of processors available.
#' 
#' @details
#' This number may change from . See the link in the references.
#' 
#' @return
#' An integer.
#' 
#' @examples
#' omp::get_num_procs()
#' 
#' @seealso \code{\link{get_max_threads}}
#' @references \url{https://www.openmp.org/spec-html/5.1/openmpsu161.html#x205-2380003.7.1}
#' 
#' @useDynLib omp R_omp_get_num_procs
#' @export
get_num_procs = function()
{
  .Call(R_omp_get_num_procs)
}



#' get_wtick
#' 
#' Returns the precision of the timer used by \code{get_wtime()}.
#' 
#' @return
#' A double.
#' 
#' @examples
#' omp::get_wtick()
#' 
#' @seealso \code{\link{get_wtime}}
#' @references \url{https://www.openmp.org/spec-html/5.1/openmpsu186.html#x233-2660003.10.2}
#' 
#' @useDynLib omp R_omp_get_wtick
#' @export
get_wtick = function()
{
  .Call(R_omp_get_wtick)
}



#' get_wtime
#' 
#' Returns the the elapsed wall clock time since some arbitrary (but fixed) time
#' in the past. Therefore, a difference of two of these values gives the wall
#' clock execution time.
#' 
#' @return
#' A double.
#' 
#' @examples
#' t1 = omp::get_wtime()
#' t2 = omp::get_wtime()
#' t2 - t1
#' 
#' @seealso \code{\link{get_wtick}}
#' @references \url{https://www.openmp.org/spec-html/5.1/openmpsu185.html#x232-2650003.10.1}
#' 
#' @useDynLib omp R_omp_get_wtime
#' @export
get_wtime = function()
{
  .Call(R_omp_get_wtime)
}



#' set_num_threads
#' 
#' Set the number of threads for OpenMP to use. Operates via side-effects.
#' Affects \code{get_num_procs()} but not \code{get_max_threads()}.
#' 
#' @param num_threads
#' An integer number of threads to use.
#' 
#' @return
#' Returns the input \code{num_threads} invisibly.
#' 
#' @examples
#' omp::get_num_procs()
#' omp::set_num_threads(1)
#' omp::get_max_threads()
#' 
#' @seealso \code{\link{get_num_procs}}, \code{\link{get_max_threads}}
#' @references \url{https://www.openmp.org/spec-html/5.1/openmpsu120.html#x159-1920003.2.1}
#' 
#' @useDynLib omp R_omp_set_num_threads
#' @export
set_num_threads = function(num_threads)
{
  if (!is.numeric(num_threads) || length(num_threads) > 1L || is.na(num_threads))
    stop("argument 'num_threads' must be a single integer")
  
  .Call(R_omp_set_num_threads, as.integer(num_threads))
  invisible(num_threads)
}

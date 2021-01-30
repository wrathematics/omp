#' omp_avail
#' 
#' TODO
#' 
#' @return
#' TODO
#' 
#' @useDynLib omp R_omp_avail
#' @export
omp_avail = function()
{
  .Call(R_omp_avail)
}

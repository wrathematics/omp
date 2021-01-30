library(omp)

if (omp_avail())
{
  set_num_threads(1)
  nth = get_max_threads()
  stopifnot(nth == 1)
  
  set_num_threads(2)
  nth = get_max_threads()
  stopifnot(nth == 2)
}

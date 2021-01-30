# omp

* **Version:** 0.1-0
* **URL**: https://github.com/wrathematics/omp
* **License:** [BSD 2-Clause](https://opensource.org/licenses/BSD-2-Clause)
* **Author:** Drew Schmidt

Utilities for setting and reading the amount of compute resources available to 'OpenMP'. The package wraps all of the 'OpenMP' functions that would be useful to call from R.

One major utility is that this can be used to dynamically control the number of threads available to OpenMP in any compiled code called by R. It can also read the number of available threads available, which can be very useful for testing and validation, particularly in strange HPC environments. See also the [getcpu package](https://github.com/wrathematics/getcpu).

Setting the number of OpenMP threads dynamically from R can also be achieved by the [OpenMPController package](https://cran.r-project.org/web/packages/OpenMPController/index.html). However, at the time of writing it lacks all other functions we provide, and its naming is far more verbose.



## Installation

You can install the stable version from [the HPCRAN](https://hpcran.org) using the usual `install.packages()`:

```r
install.packages("omp", repos="https://hpcran.org")
```

The development version is maintained on GitHub:

```r
remotes::install_github("wrathematics/omp")
```

If *at compile time* your compiler does not support OpenMP, the package will be built without OpenMP support. Functions will still run, but they won't really work. Make sure to check the configure output of the package when compiling, or use the `omp::omp_avail()` function at runtime.



## API and Naming Conventions

The package contains a helper function which is not part of the OpenMP API, namely `omp_avail()`. This tells you if the omp package was built with OpenMP support or not (`TRUE` or `FALSE`). On Windows this *will* be true, on Linux this *should* be true, and on Mac this *may* be true.

All other functions are clones of OpenMP API functions. The naming scheme is that we drop the leading `omp_` from our clone functions.

| Function | Purpose |
|---|---|
| `get_max_threads()` | Max number of threads available ("the number of cores", kinda). |
| `get_num_procs()` | Number of threads available to spawn in OpenMP parallel regions. |
| `get_wtick()` | Precision of the `get_stime()` timer. |
| `get_wtime()` | Wall clock timer. |
| `set_num_threads(num_threads)` | Sets the number of threads for OpenMP parallel regions to use. |

We use `omp_avail()` to avoid potential conflicts with other packages which may have an `avail()` function.

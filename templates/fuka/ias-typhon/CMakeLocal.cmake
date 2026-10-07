set (GSL_LIBRARIES "$ENV{GSL_ROOT_DIR}/lib64/libgsl.so")
set (SCALAPACK_LIBRARIES
  "$ENV{MKLROOT}/lib/libmkl_scalapack_lp64.so"
  "$ENV{MKLROOT}/lib/libmkl_blacs_openmpi_lp64.so"
  "$ENV{MKLROOT}/lib/libmkl_intel_lp64.so"
  "$ENV{MKLROOT}/lib/libmkl_sequential.so"
  "$ENV{MKLROOT}/lib/libmkl_core.so"
  pthread
  m
  dl)
set (FFTW_LIBRARIES "$ENV{FFTW_PATH}/lib/libfftw3.so" "$ENV{FFTW_PATH}/lib/libfftw3_mpi.so")
set (BLAS_LIBRARIES "$ENV{MKLROOT}/lib/libmkl_blas95_ilp64.a")
set (LAPACK_LIBRARIES "$ENV{MKLROOT}/lib/libmkl_lapack95_ilp64.a")

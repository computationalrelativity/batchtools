cmake \
  -DAthena_ENABLE_MPI=ON \
  -DKokkos_ENABLE_CUDA=ON \
  -DKokkos_ENABLE_CUDA_LAMBDA=ON \
  -DKokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=OFF \
  -DCMAKE_CXX_COMPILER=$PWD/kokkos/bin/nvcc_wrapper \
  -DKokkos_ARCH_ARMV9_GRACE=ON \
  -DKokkos_ARCH_HOPPER90=ON \
  ../../

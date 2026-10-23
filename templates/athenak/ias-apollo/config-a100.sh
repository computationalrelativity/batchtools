cmake \
  -D Kokkos_ENABLE_CUDA=On \
  -D Kokkos_Arch_AMPERE80=On \
  -D CMAKE_CXX_COMPILER=$PWD/../kokkos/bin/nvcc_wrapper \
  -D Athena_ENABLE_MPI=On \
  -D Kokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=Off \
  $@ ../

cmake \
    -DKokkos_ENABLE_CUDA=ON \
    -DKokkos_ARCH_AMPERE80=ON \
    -DKokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=OFF \
    -DCMAKE_CXX_COMPILER=$PWD/../kokkos/bin/nvcc_wrapper \
    $@ ..

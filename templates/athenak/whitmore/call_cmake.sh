export CUDA_ROOT=/usr/local/cuda-12.6
echo cmake \
    -DKokkos_ENABLE_CUDA=ON \
    -DKokkos_ARCH_PASCAL61=ON \
    -DCMAKE_CXX_COMPILER=$PWD/../kokkos/bin/nvcc_wrapper \
    $* ..

cmake \
    -DKokkos_ENABLE_CUDA=ON \
    -DKokkos_ARCH_ADA89=ON \
    -DCMAKE_CXX_FLAGS='-Wno-deprecated-gpu-targets' \
    -DCMAKE_CXX_COMPILER=$PWD/../kokkos/bin/nvcc_wrapper \
    $@ ..

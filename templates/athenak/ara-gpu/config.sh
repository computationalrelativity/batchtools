#!/bin/bash

cmake \
  -DKokkos_ENABLE_CUDA=ON \
  -DKokkos_ARCH_AMPERE80=ON \
  -DCMAKE_CXX_COMPILER=/path/to/athenak/kokkos/bin/nvcc_wrapper \
  -DAthena_ENABLE_MPI=ON \
  -DKokkos_ENABLE_CUDA_LAMBDA=ON \
  -DKokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=OFF \
  ../


#!/usr/bin/env bash

cmake -D Athena_ENABLE_MPI=ON \
      -D Kokkos_ENABLE_CUDA=ON \
      -D Kokkos_ENABLE_CUDA_LAMBDA=ON \
      -D Kokkos_ARCH_HOPPER90=ON \
      -D Kokkos_ARCH_ARMV9_GRACE=ON \
      -D Kokkos_ENABLE_IMPL_CUDA_MALLOC_ASYNC=OFF \
      $@ ../

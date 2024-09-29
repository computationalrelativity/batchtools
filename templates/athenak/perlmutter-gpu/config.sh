#!/usr/bin/env bash

cmake -D Athena_ENABLE_MPI=ON \
      -D Kokkos_ENABLE_CUDA=ON \
      -D Kokkos_ENABLE_CUDA_CONSTEXPR=ON \
      -D Kokkos_ENABLE_CUDA_LAMBDA=ON \
      -D Kokkos_ARCH_AMPERE80=ON \
      -D Kokkos_ARCH_ZEN3=ON \
      $@ ../

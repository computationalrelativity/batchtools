#!/bin/bash

cmake .. \
	-DAthena_ENABLE_MPI=ON \
	-DCMAKE_EXE_LINKER_FLAGS='-Xsycl-target-backend "-device pvc -options -ftarget-register-alloc-mode=pvc:large" -fsycl-max-parallel-link-jobs=112 -fsycl-device-code-split=per_kernel' \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON

# Working Kokkos versions are: 4.6.02, 4.7.00, 4.7.04, 5.2.0, 5.2.1
# Failing Kokkos versions are: 4.7.02, 5.0.0, 5.0.2, 5.1.0, 5.1.1
# Kokkos 5.x requires C++20 in CMakeLists.txt.

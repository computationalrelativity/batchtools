#!/bin/bash

cmake .. \
	-DAthena_ENABLE_MPI=ON \
	-DCMAKE_EXE_LINKER_FLAGS='-Xsycl-target-backend "-device pvc -options -ze-opt-large-register-file" -fsycl-max-parallel-link-jobs=112 -fsycl-device-code-split=per_kernel' \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON

cmake   -DAthena_ENABLE_MPI=ON \
	-DCMAKE_EXE_LINKER_FLAGS='-fsycl-max-parallel-link-jobs=16 -fsycl-device-code-split=per_kernel' \
	-DCMAKE_BUILD_TYPE='Debug' \
	-DKokkos_ENABLE_DEBUG=ON \
	-DKokkos_ENABLE_DEBUG_BOUNDS_CHECK=ON \
	-DCMAKE_CXX_COMPILER=icpx \
	-DGSL_ROOT_DIR=`gsl-config --prefix` \
	-DKokkos_ENABLE_SERIAL=ON \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	$@ ../

cmake   -DAthena_ENABLE_MPI=ON \
	-DCMAKE_BUILD_TYPE='Debug' \
	-DCMAKE_CXX_COMPILER=icpx \
	-DGSL_ROOT_DIR=`gsl-config --prefix` \
	-DKokkos_ENABLE_SERIAL=ON \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	$@ ../

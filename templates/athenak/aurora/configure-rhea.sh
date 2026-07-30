: "${TORCH_PREFIX:?source environment-rhea.sh first (it sets TORCH_PREFIX)}"

cmake	-DAthena_ENABLE_MPI=ON \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	-DCMAKE_CXX_COMPILER=icpx \
	-DAthena_ENABLE_NURATES=ON \
	-DAthena_ENABLE_TORCH=ON \
	-DCMAKE_PREFIX_PATH=$TORCH_PREFIX/share/cmake \
	$@ ../

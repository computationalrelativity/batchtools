cmake   -DAthena_ENABLE_MPI=ON \
	-DKokkos_ARCH_ZEN3=ON \
	-DKokkos_ARCH_VEGA90A=ON \
	-DKokkos_ENABLE_HIP=ON \
	-DCMAKE_CXX_COMPILER=CC \
	-DCMAKE_EXE_LINKER_FLAGS="-L${ROCM_PATH}/lib -lamdhip64" \
	-DCMAKE_CXX_FLAGS=-I${ROCM_PATH}/include \
	$@ ../

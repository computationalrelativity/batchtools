# AthenaK with Rhea flavor mixing on the Kokkos evaluator: no LibTorch, so the production
# stack (environment.sh) is enough and TORCH_PREFIX is not needed.
#
# Athena_RHEA_DIR must name a Rhea checkout; the default is <athenak>/rhea, which is what a
# symlink to the sibling repos/Rhea gives.

cmake	-DAthena_ENABLE_MPI=ON \
	-DKokkos_ENABLE_SYCL=ON \
	-DKokkos_ENABLE_SYCL_RELOCATABLE_DEVICE_CODE=ON \
	-DKokkos_ARCH_INTEL_PVC=ON \
	-DCMAKE_CXX_COMPILER=icpx \
	-DAthena_ENABLE_NURATES=ON \
	-DAthena_ENABLE_RHEA=ON \
	$@ ../

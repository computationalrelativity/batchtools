Elliptica requires UMFPACK to run, which is part of SuiteSparse. Typhon/Apollo does not
include this by default.

Instructions:
1. Clone SuiteSparse:
```bash
git clone https://github.com/DrTimothyAldenDavis/SuiteSparse.git
```
2. Ensure that BLAS and other components are loaded:
```bash
source <path-to-batchtools>/templates/elliptica/typhon/environment.sh
```
3. Compile the necessary components: `SuiteSparse_config`, `AMD`, `CAMD`, `CCOLAMD`,
  `COLAMD`, `CHOLMOD`, and `UMFPACK`. In each directory, compile as follows:
```bash
make local
make install
```
`SuiteSparse_config` and `AMD` should be compiled first, and `UMFPACK` should be compiled
last. You may need to play around with the order of compilation for the middle components.

# Instructions

To install athenak on expanse-gpu:
- Start an interactive node session on gpu-debug:
```bash
$ srun --partition=gpu-debug --pty --account=<accountname> --nodes=1 --ntasks-per-node=2 --gpus=2 --mem=8G -t 00:30:00 --wait=0 --export=ALL /bin/bash
```
- Load the environment
- Download and compile cmake (this will take some time):
```bash
$ ./install_cmake /home/<user>/src/cmake_inst
```
- [optional] Download and compile gsl
```bash
$ ./install_gsl /home/<user>/src/gsl_inst
```

Then, proceed as usual.

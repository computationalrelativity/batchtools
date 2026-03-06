These patches are from the Einstein Toolkit project

# Lorene

To install Lorene correctly in any system is necessary to have the GSL library installed.
At this time we have tested it to work correctly on GSL_VERSION=2.7.1.

## Install Lorene in Aurora

To install Lorene in Aurora is necessary to unpack the GSL library correctly. In 
`batchtools/athenak/aurora` there is an script `install_gsl.sh` that requires 
an input directory to be set and executed as follows:
```
./install_gsl.sh <input_directory>
```
A good practice may be to define the `$HOME/local` directory as the input.
Furthermore, we need to add its binaries and libraries in the `PATH` and `LD_LIBRARY` 
libraries.
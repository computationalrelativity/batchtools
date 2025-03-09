#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Prevent errors in a pipeline from being masked
set -u  # Treat unset variables as an error

GSL_VERSION="2.5"  # Update this to the latest version if necessary
GSL_URL="https://ftp.gnu.org/gnu/gsl/gsl-${GSL_VERSION}.tar.gz"

if [ -z "${1:-}" ]; then
    echo "Usage: $0 <install_directory>"
    exit 1
fi

INSTALL_DIR=$1

echo "Downloading and installing GSL ${GSL_VERSION} to ${INSTALL_DIR}..."

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Download GSL
if ! wget --quiet --show-progress --progress=bar:force "$GSL_URL"; then
    echo "Error: Failed to download GSL from ${GSL_URL}"
    exit 1
fi

# Extract and build GSL
tar -zxvf "gsl-${GSL_VERSION}.tar.gz"
cd "gsl-${GSL_VERSION}"

./configure --prefix="$INSTALL_DIR"
make -j8
make install

echo "GSL ${GSL_VERSION} installed successfully in ${INSTALL_DIR}"

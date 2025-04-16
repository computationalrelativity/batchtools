#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Prevent errors in a pipeline from being masked
set -u  # Treat unset variables as an error

CMAKE_VERSION="3.28"  # Update this to the latest version if necessary
CMAKE_BUILD=1
CMAKE_URL="https://cmake.org/files/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.${CMAKE_BUILD}.tar.gz"

if [ -z "${1:-}" ]; then
    echo "Usage: $0 <install_directory>"
    exit 1
fi

INSTALL_DIR=$1
mkdir -p "$INSTALL_DIR"
INSTALL_DIR=$(cd $INSTALL_DIR ; pwd)

echo "Downloading and installing cmake ${CMAKE_VERSION} to ${INSTALL_DIR}..."

cd "$INSTALL_DIR"

# Download GSL
if ! wget --quiet --show-progress --progress=bar:force "$CMAKE_URL"; then
    echo "Error: Failed to download GSL from ${CMAKE_URL}"
    exit 1
fi

# Extract and build GSL
tar -zxvf "cmake-${CMAKE_VERSION}.${CMAKE_BUILD}.tar.gz"
mv cmake-${CMAKE_VERSION}.${CMAKE_BUILD} src
cd src

./bootstrap --prefix=${INSTALL_DIR}
make -j8
make install

echo "cmake ${CMAKE_VERSION} installed successfully in ${INSTALL_DIR}"

#!/bin/sh

# This is called inside the source directory
# Use --verbose for easier debugging
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIR=$DIR
patch --verbose < $DIR/boost_1_55_0_bootstrap.sh.patch

#!/bin/bash -e
SOURCE_FILE=$NAME-$VERSION.tar.gz
# Add the module for the CI environment
module load ci

# add dependencies
module load gmp/5.1.3

if [[ ! -e $SRC_DIR/$SOURCE_FILE ]] ; then
  echo "Seems we are building from scratch - preparing "
  mkdir -p $SRC_DIR
  wget http://mirror.ufs.ac.za/gnu/gnu/mpfr/$SOURCE_FILE -O $SRC_DIR/$SOURCE_FILE
fi
tar -xvzf $SRC_DIR/$SOURCE_FILE -C $WORKSPACE
cd $WORKSPACE/$NAME-$VERSION
./configure --prefix $SOFT_DIR --with-gmp=$GMP_DIR
make -j 8
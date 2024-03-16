# install dtc
# micromamba install device-tree-compiler
apt install device-tree-compiler
micromamba install bear

###############################################################################

mkdir -p build && pushd build

CC=/usr/bin/clang CXX=/usr/bin/clang++ \
  CFLAGS="-g -Og" CXXFLAGS="-g -Og" \
  ../configure \
  --without-boost-asio --without-boost-regex \
  --with-isa=RV64IMAFDC_zicntr_zihpm --with-varch=vlen:128,elen:64 \
  --with-target=riscv64-unknown-elf --prefix=$PWD/install

bear -- make -j$(nproc)
# make -j$(nproc)
make install

popd

###############################################################################

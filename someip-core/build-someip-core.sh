#!/bin/bash


cd vsomeip
git checkout 2.10.21
rm -rf build && mkdir -p build && cd build
cmake -D ENABLE_SIGNAL_HANDLING=1 -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd ../..

cd capicxx-core-runtime 
git checkout 3.1.12.4
rm -rf build && mkdir -p build && cd build
cmake -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd ../..

cd capicxx-someip-runtime 
git checkout 3.1.12.12
rm -rf build && mkdir -p build && cd build
cmake -D USE_INSTALLED_COMMONAPI=ON -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd ../..

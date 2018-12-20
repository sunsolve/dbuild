#!/bin/bash


cd vsomeip
git checkout 2.10.21
rm -rf build && mkdir -p build && cd build
cmake -D ENABLE_SIGNAL_HANDLING=1 -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd .. && rm -rf build
cd ..

cd capicxx-core-runtime 
git checkout 3.1.12.4
rm -rf build && mkdir -p build && cd build
cmake -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd ../..

cp core-tools.patch capicxx-core-tools/
cd capicxx-core-tools
git checkout org.genivi.commonapi.releng/pom.xml
git checkout 3.1.12.3
patch -p1 <core-tools.patch
cd org.genivi.commonapi.core.releng 
mvn -Dtarget.id=org.genivi.commonapi.core.target clean verify
cd ../..
mkdir -p /usr/local/bin/commonapi-generator
unzip -d /usr/local/bin/commonapi-generator  ./capicxx-core-tools/org.genivi.commonapi.core.cli.product/target/products/commonapi-generator.zip
chmod +x /usr/local/bin/commonapi-generator/commonapi-generator-linux-x86_64


cd capicxx-someip-runtime 
git checkout 3.1.12.12
rm -rf build && mkdir -p build && cd build
cmake -D USE_INSTALLED_COMMONAPI=ON -D CMAKE_INSTALL_PREFIX=/usr ..
make && make install
cd .. && rm -rf build
cd ..


cp someip-tools.patch capicxx-someip-tools/
cd capicxx-someip-tools
git checkout org.genivi.commonapi.releng/pom.xml
git checkout 3.1.12.1
patch -p1 <someip-tools.patch
cd org.genivi.commonapi.someip.releng
mvn clean verify -DCOREPATH=../../capicxx-core-tools -Dtarget.id=org.genivi.commonapi.someip.target
cd ../..
mkdir -p /usr/local/bin/commonapi-someip-generator
unzip -d /usr/local/bin/commonapi-someip-generator ./capicxx-someip-tools/org.genivi.commonapi.someip.cli.product/target/products/commonapi_someip_generator.zip
chmod +x /usr/local/bin/commonapi-someip-generator/commonapi-someip-generator-linux-x86_64



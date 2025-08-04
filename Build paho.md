First build OpenSSL for Lib 

# Build without OPENSSL
    $ git clone https://github.com/eclipse/paho.mqtt.c.git
    $ cd paho.mqtt.c
    $ git checkout v1.3.13

    $ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON -DPAHO_WITH_SSL=OFF -DPAHO_HIGH_PERFORMANCE=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/../installLib -DCMAKE_TOOLCHAIN_FILE=$(pwd)/../toolchain.cmake
## start build 
    $ cmake --build build/ --target install


# Build with SSL

## First Cross build cJSON as Lib 
    $ git clone https://github.com/DaveGamble/cJSON.git
    $ cmake -DCMAKE_TOOLCHAIN_FILE=$(pwd)/../../toolchain.cmake -DENABLE_CJSON_UTILS=On -DENABLE_CJSON_TEST=Off -DBUILD_SHARED_AND_STATIC_LIBS=On -DCMAKE_INSTALL_PREFIX=$(pwd)/../../libcJSON
    $  make & make install

## Second Cross build openSSL (version 1.1.1) as Lib 
    $ git clone https://github.com/openssl/openssl.git
    $ cd openssl
    $ git checkout OpenSSL_1_1_1-stable
    <!-- $ ./Configure linux-armv7 --cross-compile-prefix=arm-none-linux-gnueabihf- -PROCESSOR=ARM shared no-asm   -prefix=$(pwd)/../libOpenSSL -->
    $ ./Configure linux-armv4 --cross-compile-prefix=arm-none-linux-gnueabihf- shared no-asm no-docs --prefix=$(pwd)/../libOpenSSL
    $ make & make install

##  Build PahoMQTT C
    
    $ git clone https://github.com/eclipse/paho.mqtt.c.git
    $ cd paho.mqtt.c
    $ git checkout v1.3.13
    $ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/../libPahoMqttC -DCMAKE_TOOLCHAIN_FILE=$(pwd)/../toolchain.cmake
    $ cmake --build build/ --target install

##  Build PahoMQTT Cpp
    
Note Before build paho cpp we need to build paho c first.

    $ git clone https://github.com/eclipse/paho.mqtt.c.git
    $ cd paho.mqtt.cpp
    $ git checkout v1.3.x
    $ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/../libPahoMqttCpp -DCMAKE_TOOLCHAIN_FILE=$(pwd)/../toolchain.cmake
    $ cmake --build build/ --target install


# Build Mqtt App using pahoMqtt
    $ cd Example
    $ cmake -Bbuild
    $ cmake --build build/


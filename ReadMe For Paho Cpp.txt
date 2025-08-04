 This doc will demo how build  paho mqtt (cpp Lib) using cmake
 
 //Link refference : https://github.com/eclipse/paho.mqtt.cpp/blob/master/README.md
 // Paho Cpp mqtt
 // Building the Paho C++ library

$ git clone https://github.com/eclipse/paho.mqtt.cpp
$ cd paho.mqtt.cpp
$ git co v1.4.0
$ git submodule init
$ git submodule update

# DPAHO_BUILD_STATIC=ON ==> build with static library
# DCMAKE_INSTALL_PREFIX=$(pwd)/installLib ==> opt: set dir for install library after build success (Note: This path dir is importance for using in project)
											  if you this current to run project you can defuat path by no add this command and  DCMAKE_TOOLCHAIN_FILE
# DCMAKE_TOOLCHAIN_FILE=/home/builder/toolchain.cmake ==> opt: For cross compile purpose in this example I cross compile this lib for RV1106 chip run on linux 
														  Check toolchain file for more detail
														  (Note1: This toolchain file also include SSL lib build Mqtts in this example use SSL ver. 3.2.0)
														  (Note2: This toolchain file also include Paho mqtt c that build before if you not building paho mqtt c build it first)

builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.cpp$ cmake -Bbuild -H. -DPAHO_WITH_MQTT_C=ON -DPAHO_BUILD_STATIC=ON -DCMAKE_TOOLCHAIN_FILE=/home/builder/toolchain.cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/installLib
-- The C compiler identification is GNU 8.3.0
-- The CXX compiler identification is GNU 8.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/builder/rv1106_build/arm-rockchip830-linux-uclibcgnueabihf/bin//arm-rockchip830-linux-uclibcgnueabihf-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/builder/rv1106_build/arm-rockchip830-linux-uclibcgnueabihf/bin//arm-rockchip830-linux-uclibcgnueabihf-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found OpenSSL: /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libcrypto.so (found version "3.2.1")  
-- Paho C: Bundled
-- CMake version: 3.22.1
-- CMake system name: Linux
-- Timestamp is 2024-06-27T09:57:47Z
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE  
-- Configuring done
-- Generating done
-- Build files have been written to: /home/builder/mqttLibTest/paho.mqtt.cpp/build
builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.cpp$ cmake --build build/ --target install
[  1%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTTime.c.o
[  1%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTProtocolClient.c.o
[  2%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Clients.c.o
[  3%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/utf-8.c.o
[  3%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTPacket.c.o
[  4%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTPacketOut.c.o
[  5%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Messages.c.o
[  5%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Tree.c.o
[  6%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Socket.c.o
[  6%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Log.c.o
[  7%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTPersistence.c.o
[  8%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Thread.c.o
[  8%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTProtocolOut.c.o
[  9%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTPersistenceDefault.c.o
[ 10%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/SocketBuffer.c.o
[ 10%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/LinkedList.c.o
[ 11%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTProperties.c.o
[ 12%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/MQTTReasonCodes.c.o
[ 12%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Base64.c.o
[ 13%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/SHA1.c.o
[ 14%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/WebSocket.c.o
[ 14%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj.dir/Proxy.c.o
[ 14%] Built target common_obj
[ 15%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3a.dir/MQTTAsync.c.o
[ 15%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3a.dir/MQTTAsyncUtils.c.o
[ 16%] Linking C shared library libpaho-mqtt3a.so
[ 16%] Built target paho-mqtt3a
[ 17%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3c.dir/MQTTClient.c.o
[ 18%] Linking C shared library libpaho-mqtt3c.so
[ 18%] Built target paho-mqtt3c
[ 20%] Building C object externals/paho-mqtt-c/src/CMakeFiles/MQTTVersion.dir/MQTTVersion.c.o
[ 20%] Linking C executable MQTTVersion
[ 20%] Built target MQTTVersion
[ 21%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTTime.c.o
[ 22%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTProtocolClient.c.o
[ 22%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Clients.c.o
[ 23%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/utf-8.c.o
[ 24%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTPacket.c.o
[ 24%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTPacketOut.c.o
[ 25%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Messages.c.o
[ 25%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Tree.c.o
[ 26%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Socket.c.o
[ 27%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Log.c.o
[ 27%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTPersistence.c.o
[ 28%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Thread.c.o
[ 29%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTProtocolOut.c.o
[ 29%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTPersistenceDefault.c.o
[ 30%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/SocketBuffer.c.o
[ 31%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/LinkedList.c.o
[ 31%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTProperties.c.o
[ 32%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/MQTTReasonCodes.c.o
[ 33%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Base64.c.o
[ 33%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/SHA1.c.o
[ 34%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/WebSocket.c.o
[ 35%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_obj_static.dir/Proxy.c.o
[ 35%] Built target common_obj_static
[ 35%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3c-static.dir/MQTTClient.c.o
[ 36%] Linking C static library libpaho-mqtt3c.a
[ 36%] Built target paho-mqtt3c-static
[ 37%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3a-static.dir/MQTTAsync.c.o
[ 37%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3a-static.dir/MQTTAsyncUtils.c.o
[ 38%] Linking C static library libpaho-mqtt3a.a
[ 38%] Built target paho-mqtt3a-static
[ 38%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTTime.c.o
[ 40%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTProtocolClient.c.o
[ 41%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Clients.c.o
[ 41%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/utf-8.c.o
[ 42%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTPacket.c.o
[ 42%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTPacketOut.c.o
[ 43%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Messages.c.o
[ 44%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Tree.c.o
[ 44%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Socket.c.o
[ 45%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Log.c.o
[ 46%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTPersistence.c.o
[ 46%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Thread.c.o
[ 47%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTProtocolOut.c.o
[ 48%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTPersistenceDefault.c.o
[ 48%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/SocketBuffer.c.o
[ 49%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/LinkedList.c.o
[ 50%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTProperties.c.o
[ 50%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/MQTTReasonCodes.c.o
[ 51%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Base64.c.o
[ 52%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/SHA1.c.o
[ 52%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/WebSocket.c.o
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c: In function 'WebSocket_upgrade':
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1324:3: warning: 'SHA1_Init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Init( &ctx );
   ^~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:49:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Init(SHA_CTX *c);
                           ^~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1325:3: warning: 'SHA1_Update' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Update( &ctx, ws_key, strlen(ws_key));
   ^~~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:50:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Update(SHA_CTX *c, const void *data, size_t len);
                           ^~~~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1326:3: warning: 'SHA1_Final' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Final( sha_hash, &ctx );
   ^~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:51:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Final(unsigned char *md, SHA_CTX *c);
                           ^~~~~~~~~~
[ 53%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj.dir/Proxy.c.o
[ 53%] Built target common_ssl_obj
[ 53%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3cs.dir/MQTTClient.c.o
[ 54%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3cs.dir/SSLSocket.c.o
[ 55%] Linking C shared library libpaho-mqtt3cs.so
[ 55%] Built target paho-mqtt3cs
[ 56%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o
[ 56%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as.dir/MQTTAsyncUtils.c.o
[ 57%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o
[ 58%] Linking C shared library libpaho-mqtt3as.so
[ 58%] Built target paho-mqtt3as
[ 60%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTTime.c.o
[ 60%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTProtocolClient.c.o
[ 61%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Clients.c.o
[ 61%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/utf-8.c.o
[ 62%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTPacket.c.o
[ 63%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTPacketOut.c.o
[ 63%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Messages.c.o
[ 64%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Tree.c.o
[ 65%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Socket.c.o
[ 65%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Log.c.o
[ 66%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTPersistence.c.o
[ 67%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Thread.c.o
[ 67%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTProtocolOut.c.o
[ 68%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTPersistenceDefault.c.o
[ 69%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/SocketBuffer.c.o
[ 69%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/LinkedList.c.o
[ 70%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTProperties.c.o
[ 71%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/MQTTReasonCodes.c.o
[ 71%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Base64.c.o
[ 72%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/SHA1.c.o
[ 72%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/WebSocket.c.o
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c: In function 'WebSocket_upgrade':
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1324:3: warning: 'SHA1_Init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Init( &ctx );
   ^~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:49:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Init(SHA_CTX *c);
                           ^~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1325:3: warning: 'SHA1_Update' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Update( &ctx, ws_key, strlen(ws_key));
   ^~~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:50:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Update(SHA_CTX *c, const void *data, size_t len);
                           ^~~~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:1326:3: warning: 'SHA1_Final' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Final( sha_hash, &ctx );
   ^~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.cpp/externals/paho-mqtt-c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:51:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Final(unsigned char *md, SHA_CTX *c);
                           ^~~~~~~~~~
[ 73%] Building C object externals/paho-mqtt-c/src/CMakeFiles/common_ssl_obj_static.dir/Proxy.c.o
[ 73%] Built target common_ssl_obj_static
[ 73%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3cs-static.dir/MQTTClient.c.o
[ 74%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3cs-static.dir/SSLSocket.c.o
[ 75%] Linking C static library libpaho-mqtt3cs.a
[ 75%] Built target paho-mqtt3cs-static
[ 75%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as-static.dir/MQTTAsync.c.o
[ 76%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as-static.dir/MQTTAsyncUtils.c.o
[ 77%] Building C object externals/paho-mqtt-c/src/CMakeFiles/paho-mqtt3as-static.dir/SSLSocket.c.o
[ 77%] Linking C static library libpaho-mqtt3as.a
[ 77%] Built target paho-mqtt3as-static
[ 77%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/async_client.cpp.o
[ 78%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/client.cpp.o
[ 80%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/connect_options.cpp.o
[ 80%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/create_options.cpp.o
[ 81%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/disconnect_options.cpp.o
[ 82%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/iclient_persistence.cpp.o
[ 82%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/message.cpp.o
[ 83%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/properties.cpp.o
[ 84%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/response_options.cpp.o
[ 84%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/ssl_options.cpp.o
[ 85%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/string_collection.cpp.o
[ 86%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/subscribe_options.cpp.o
[ 86%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/token.cpp.o
[ 87%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/topic.cpp.o
[ 87%] Building CXX object src/CMakeFiles/paho-mqttpp3.dir/will_options.cpp.o
[ 88%] Linking CXX shared library libpaho-mqttpp3.so
[ 88%] Built target paho-mqttpp3
[ 89%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/async_client.cpp.o
[ 89%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/client.cpp.o
[ 90%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/connect_options.cpp.o
[ 91%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/create_options.cpp.o
[ 91%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/disconnect_options.cpp.o
[ 92%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/iclient_persistence.cpp.o
[ 93%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/message.cpp.o
[ 93%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/properties.cpp.o
[ 94%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/response_options.cpp.o
[ 95%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/ssl_options.cpp.o
[ 95%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/string_collection.cpp.o
[ 96%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/subscribe_options.cpp.o
[ 97%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/token.cpp.o
[ 97%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/topic.cpp.o
[ 98%] Building CXX object src/CMakeFiles/paho-mqttpp3-static.dir/will_options.cpp.o
[100%] Linking CXX static library libpaho-mqttpp3.a
[100%] Built target paho-mqttpp3-static
Install the project...
-- Install configuration: ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so.1
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so.1
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so.1.3.13" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_publish.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_publish_time.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_subscribe.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_publish.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_publish_async.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_subscribe.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/paho_c_pub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/paho_c_sub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/paho_cs_pub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/paho_cs_sub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/samples/pubsub_opts.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/CONTRIBUTING.md
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/epl-v20
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/edl-v10
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/README.md
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/share/doc/Eclipse Paho C/notice.html
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3c.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3c.so.1
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3c.so
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so.1.3.13
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so.1
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/bin/MQTTVersion
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.cpp/installLib/bin/MQTTVersion" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3c.a
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3a.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTAsync.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTClient.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTClientPersistence.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTProperties.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTReasonCodes.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTSubscribeOpts.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/MQTTExportDeclarations.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3cs.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3cs.so.1
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3cs.so.1.3.13" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3cs.so
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so.1.3.13
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so.1
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3cs.a
-- Up-to-date: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqtt3as.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig-noconfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfigVersion.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/async_client.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/buffer_ref.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/buffer_view.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/callback.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/client.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/connect_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/create_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/delivery_token.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/disconnect_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/exception.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/export.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/iaction_listener.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/iasync_client.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/iclient_persistence.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/message.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/platform.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/properties.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/response_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/server_response.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/ssl_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/string_collection.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/subscribe_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/thread_queue.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/token.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/topic_matcher.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/topic.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/types.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/include/mqtt/will_options.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqttpp3.so.1.4.0
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqttpp3.so.1
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqttpp3.so.1.4.0" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqttpp3.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/libpaho-mqttpp3.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/PahoMqttCpp/PahoMqttCppTargets.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/PahoMqttCpp/PahoMqttCppTargets-noconfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/PahoMqttCpp/PahoMqttCppConfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib/cmake/PahoMqttCpp/PahoMqttCppConfigVersion.cmake
builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.cpp$ 
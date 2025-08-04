 This doc will demo how build  paho mqtt (c and cpp Lib) using cmake
 
 //Link refference : https://github.com/eclipse/paho.mqtt.cpp/blob/master/README.md
 // Paho C mqtt
 

$ git clone https://github.com/eclipse/paho.mqtt.c.git
$ cd paho.mqtt.c
$ git checkout v1.3.13

# DPAHO_ENABLE_TESTING=OFF ==> No build testing app of this lib 
# DPAHO_BUILD_STATIC=ON ==> build with static library
# DPAHO_HIGH_PERFORMANCE=ON ==> Not sure
# DCMAKE_INSTALL_PREFIX=$(pwd)/installLib ==> opt: set dir for install library after build success (Note: This path dir is importance for using in project)
											  if you this current to run project you can defuat path by no add this command and  DCMAKE_TOOLCHAIN_FILE
# DCMAKE_TOOLCHAIN_FILE=/home/builder/toolchain.cmake ==> opt: For cross compile purpose in this example I cross compile this lib for RV1106 chip run on linux 
														  Check toolchain file for more detail
														  (Note: This toolchain file also include SSL lib build Mqtts in this example use SSL ver. 3.2.0)
builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.c$ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/installLib -DCMAKE_TOOLCHAIN_FILE=/home/builder/toolchain.cmake
-- The C compiler identification is GNU 8.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/builder/rv1106_build/arm-rockchip830-linux-uclibcgnueabihf/bin//arm-rockchip830-linux-uclibcgnueabihf-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- CMake version: 3.22.1
-- CMake system name: Linux
-- Timestamp is 2024-06-27T09:27:55Z
-- Found OpenSSL: /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libcrypto.so (found version "3.2.1")  
-- Configuring done
-- Generating done
-- Build files have been written to: /home/builder/mqttLibTest/paho.mqtt.c/build
builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.c$ cmake --build build/ --target install
[  1%] Building C object src/CMakeFiles/common_obj.dir/MQTTTime.c.o
[  1%] Building C object src/CMakeFiles/common_obj.dir/MQTTProtocolClient.c.o
[  2%] Building C object src/CMakeFiles/common_obj.dir/Clients.c.o
[  3%] Building C object src/CMakeFiles/common_obj.dir/utf-8.c.o
[  4%] Building C object src/CMakeFiles/common_obj.dir/MQTTPacket.c.o
[  5%] Building C object src/CMakeFiles/common_obj.dir/MQTTPacketOut.c.o
[  5%] Building C object src/CMakeFiles/common_obj.dir/Messages.c.o
[  6%] Building C object src/CMakeFiles/common_obj.dir/Tree.c.o
[  7%] Building C object src/CMakeFiles/common_obj.dir/Socket.c.o
[  8%] Building C object src/CMakeFiles/common_obj.dir/Log.c.o
[  9%] Building C object src/CMakeFiles/common_obj.dir/MQTTPersistence.c.o
[ 10%] Building C object src/CMakeFiles/common_obj.dir/Thread.c.o
[ 10%] Building C object src/CMakeFiles/common_obj.dir/MQTTProtocolOut.c.o
[ 11%] Building C object src/CMakeFiles/common_obj.dir/MQTTPersistenceDefault.c.o
[ 12%] Building C object src/CMakeFiles/common_obj.dir/SocketBuffer.c.o
[ 13%] Building C object src/CMakeFiles/common_obj.dir/LinkedList.c.o
[ 15%] Building C object src/CMakeFiles/common_obj.dir/MQTTProperties.c.o
[ 15%] Building C object src/CMakeFiles/common_obj.dir/MQTTReasonCodes.c.o
[ 16%] Building C object src/CMakeFiles/common_obj.dir/Base64.c.o
[ 17%] Building C object src/CMakeFiles/common_obj.dir/SHA1.c.o
[ 18%] Building C object src/CMakeFiles/common_obj.dir/WebSocket.c.o
[ 19%] Building C object src/CMakeFiles/common_obj.dir/Proxy.c.o
[ 19%] Built target common_obj
[ 20%] Building C object src/CMakeFiles/paho-mqtt3a.dir/MQTTAsync.c.o
[ 20%] Building C object src/CMakeFiles/paho-mqtt3a.dir/MQTTAsyncUtils.c.o
[ 21%] Linking C shared library libpaho-mqtt3a.so
[ 21%] Built target paho-mqtt3a
[ 22%] Building C object src/CMakeFiles/paho-mqtt3c.dir/MQTTClient.c.o
[ 23%] Linking C shared library libpaho-mqtt3c.so
[ 23%] Built target paho-mqtt3c
[ 24%] Building C object src/CMakeFiles/MQTTVersion.dir/MQTTVersion.c.o
[ 24%] Linking C executable MQTTVersion
[ 24%] Built target MQTTVersion
[ 25%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTTime.c.o
[ 25%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTProtocolClient.c.o
[ 26%] Building C object src/CMakeFiles/common_obj_static.dir/Clients.c.o
[ 27%] Building C object src/CMakeFiles/common_obj_static.dir/utf-8.c.o
[ 29%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTPacket.c.o
[ 30%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTPacketOut.c.o
[ 30%] Building C object src/CMakeFiles/common_obj_static.dir/Messages.c.o
[ 31%] Building C object src/CMakeFiles/common_obj_static.dir/Tree.c.o
[ 32%] Building C object src/CMakeFiles/common_obj_static.dir/Socket.c.o
[ 33%] Building C object src/CMakeFiles/common_obj_static.dir/Log.c.o
[ 34%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTPersistence.c.o
[ 35%] Building C object src/CMakeFiles/common_obj_static.dir/Thread.c.o
[ 35%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTProtocolOut.c.o
[ 36%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTPersistenceDefault.c.o
[ 37%] Building C object src/CMakeFiles/common_obj_static.dir/SocketBuffer.c.o
[ 38%] Building C object src/CMakeFiles/common_obj_static.dir/LinkedList.c.o
[ 39%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTProperties.c.o
[ 39%] Building C object src/CMakeFiles/common_obj_static.dir/MQTTReasonCodes.c.o
[ 40%] Building C object src/CMakeFiles/common_obj_static.dir/Base64.c.o
[ 41%] Building C object src/CMakeFiles/common_obj_static.dir/SHA1.c.o
[ 43%] Building C object src/CMakeFiles/common_obj_static.dir/WebSocket.c.o
[ 44%] Building C object src/CMakeFiles/common_obj_static.dir/Proxy.c.o
[ 44%] Built target common_obj_static
[ 45%] Building C object src/CMakeFiles/paho-mqtt3c-static.dir/MQTTClient.c.o
[ 46%] Linking C static library libpaho-mqtt3c.a
[ 46%] Built target paho-mqtt3c-static
[ 47%] Building C object src/CMakeFiles/paho-mqtt3a-static.dir/MQTTAsync.c.o
[ 48%] Building C object src/CMakeFiles/paho-mqtt3a-static.dir/MQTTAsyncUtils.c.o
[ 49%] Linking C static library libpaho-mqtt3a.a
[ 49%] Built target paho-mqtt3a-static
[ 50%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTTime.c.o
[ 50%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTProtocolClient.c.o
[ 51%] Building C object src/CMakeFiles/common_ssl_obj.dir/Clients.c.o
[ 52%] Building C object src/CMakeFiles/common_ssl_obj.dir/utf-8.c.o
[ 53%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTPacket.c.o
[ 54%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTPacketOut.c.o
[ 55%] Building C object src/CMakeFiles/common_ssl_obj.dir/Messages.c.o
[ 55%] Building C object src/CMakeFiles/common_ssl_obj.dir/Tree.c.o
[ 56%] Building C object src/CMakeFiles/common_ssl_obj.dir/Socket.c.o
[ 58%] Building C object src/CMakeFiles/common_ssl_obj.dir/Log.c.o
[ 59%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTPersistence.c.o
[ 60%] Building C object src/CMakeFiles/common_ssl_obj.dir/Thread.c.o
[ 60%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTProtocolOut.c.o
[ 61%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTPersistenceDefault.c.o
[ 62%] Building C object src/CMakeFiles/common_ssl_obj.dir/SocketBuffer.c.o
[ 63%] Building C object src/CMakeFiles/common_ssl_obj.dir/LinkedList.c.o
[ 64%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTProperties.c.o
[ 65%] Building C object src/CMakeFiles/common_ssl_obj.dir/MQTTReasonCodes.c.o
[ 65%] Building C object src/CMakeFiles/common_ssl_obj.dir/Base64.c.o
[ 66%] Building C object src/CMakeFiles/common_ssl_obj.dir/SHA1.c.o
[ 67%] Building C object src/CMakeFiles/common_ssl_obj.dir/WebSocket.c.o
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c: In function 'WebSocket_upgrade':
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1324:3: warning: 'SHA1_Init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Init( &ctx );
   ^~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:49:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Init(SHA_CTX *c);
                           ^~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1325:3: warning: 'SHA1_Update' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Update( &ctx, ws_key, strlen(ws_key));
   ^~~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:50:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Update(SHA_CTX *c, const void *data, size_t len);
                           ^~~~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1326:3: warning: 'SHA1_Final' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Final( sha_hash, &ctx );
   ^~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:51:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Final(unsigned char *md, SHA_CTX *c);
                           ^~~~~~~~~~
[ 68%] Building C object src/CMakeFiles/common_ssl_obj.dir/Proxy.c.o
[ 68%] Built target common_ssl_obj
[ 68%] Building C object src/CMakeFiles/paho-mqtt3cs.dir/MQTTClient.c.o
[ 69%] Building C object src/CMakeFiles/paho-mqtt3cs.dir/SSLSocket.c.o
[ 70%] Linking C shared library libpaho-mqtt3cs.so
[ 70%] Built target paho-mqtt3cs
[ 72%] Building C object src/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o
[ 72%] Building C object src/CMakeFiles/paho-mqtt3as.dir/MQTTAsyncUtils.c.o
[ 73%] Building C object src/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o
[ 74%] Linking C shared library libpaho-mqtt3as.so
[ 74%] Built target paho-mqtt3as
[ 75%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTTime.c.o
[ 75%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTProtocolClient.c.o
[ 76%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Clients.c.o
[ 77%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/utf-8.c.o
[ 78%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTPacket.c.o
[ 79%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTPacketOut.c.o
[ 80%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Messages.c.o
[ 80%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Tree.c.o
[ 81%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Socket.c.o
[ 82%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Log.c.o
[ 83%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTPersistence.c.o
[ 84%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Thread.c.o
[ 84%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTProtocolOut.c.o
[ 86%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTPersistenceDefault.c.o
[ 87%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/SocketBuffer.c.o
[ 88%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/LinkedList.c.o
[ 89%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTProperties.c.o
[ 90%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/MQTTReasonCodes.c.o
[ 90%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Base64.c.o
[ 91%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/SHA1.c.o
[ 92%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/WebSocket.c.o
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c: In function 'WebSocket_upgrade':
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1324:3: warning: 'SHA1_Init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Init( &ctx );
   ^~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:49:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Init(SHA_CTX *c);
                           ^~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1325:3: warning: 'SHA1_Update' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Update( &ctx, ws_key, strlen(ws_key));
   ^~~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:50:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Update(SHA_CTX *c, const void *data, size_t len);
                           ^~~~~~~~~~~
/home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:1326:3: warning: 'SHA1_Final' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
   SHA1_Final( sha_hash, &ctx );
   ^~~~~~~~~~
In file included from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/x509.h:41,
                 from /home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/ssl.h:32,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/SSLSocket.h:29,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/MQTTPacket.h:26,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.h:21,
                 from /home/builder/mqttLibTest/paho.mqtt.c/src/WebSocket.c:24:
/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/sha.h:51:27: note: declared here
 OSSL_DEPRECATEDIN_3_0 int SHA1_Final(unsigned char *md, SHA_CTX *c);
                           ^~~~~~~~~~
[ 93%] Building C object src/CMakeFiles/common_ssl_obj_static.dir/Proxy.c.o
[ 93%] Built target common_ssl_obj_static
[ 94%] Building C object src/CMakeFiles/paho-mqtt3cs-static.dir/MQTTClient.c.o
[ 95%] Building C object src/CMakeFiles/paho-mqtt3cs-static.dir/SSLSocket.c.o
[ 96%] Linking C static library libpaho-mqtt3cs.a
[ 96%] Built target paho-mqtt3cs-static
[ 97%] Building C object src/CMakeFiles/paho-mqtt3as-static.dir/MQTTAsync.c.o
[ 98%] Building C object src/CMakeFiles/paho-mqtt3as-static.dir/MQTTAsyncUtils.c.o
[ 98%] Building C object src/CMakeFiles/paho-mqtt3as-static.dir/SSLSocket.c.o
[100%] Linking C static library libpaho-mqtt3as.a
[100%] Built target paho-mqtt3as-static
Install the project...
-- Install configuration: ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_publish.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_publish_time.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTAsync_subscribe.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_publish.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_publish_async.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/MQTTClient_subscribe.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/paho_c_pub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/paho_c_sub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/paho_cs_pub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/paho_cs_sub.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/samples/pubsub_opts.c
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/CONTRIBUTING.md
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/epl-v20
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/edl-v10
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/README.md
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/share/doc/Eclipse Paho C/notice.html
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3c.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3c.so.1
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3c.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3a.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3a.so.1
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3a.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/bin/MQTTVersion
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.c/installLib/bin/MQTTVersion" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3c.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3a.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTAsync.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTClient.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTClientPersistence.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTProperties.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTReasonCodes.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTSubscribeOpts.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/include/MQTTExportDeclarations.h
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3cs.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3cs.so.1
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3cs.so.1.3.13" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3cs.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3as.so.1.3.13
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3as.so.1
-- Set runtime path of "/home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3as.so.1.3.13" to ""
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3as.so
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3cs.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/libpaho-mqtt3as.a
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig-noconfig.cmake
-- Installing: /home/builder/mqttLibTest/paho.mqtt.c/installLib/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfigVersion.cmake
builder@VPS-MCU-PC1:~/mqttLibTest/paho.mqtt.c$ 
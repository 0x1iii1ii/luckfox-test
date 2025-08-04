#toolchain.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
# compiler tools
set(tools_rockchip830 "/home/builder/rv1106_build/arm-rockchip830-linux-uclibcgnueabihf/bin" CACHE PATH "Cmake install prefix")
# set(tools_rockchip830 "/opt/arm-rockchip830-linux-uclibcgnueabihf/bin" CACHE PATH "Cmake install prefix")
 set(MY_CROSS_prefix "/arm-rockchip830-linux-uclibcgnueabihf-")
 set(CMAKE_C_COMPILER ${tools_rockchip830}/${MY_CROSS_prefix}gcc)
 set(CMAKE_CXX_COMPILER ${tools_rockchip830}/${MY_CROSS_prefix}g++)


 # Adjust the search paths
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


# Specify the paths to the toolchain utilities
set(CMAKE_FIND_ROOT_PATH 
				"/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr"
				"/home/builder/rv1106_build/buildroot/buildroot-2024.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin"
				"/home/builder/mqttLibTest/paho.mqtt.c/installLib"
				"/home/builder/mqttLibTest/paho.mqtt.c/installLib/lib"
				"/home/builder/mqttLibTest/paho.mqtt.cpp/installLib"
				"/home/builder/mqttLibTest/paho.mqtt.cpp/installLib/lib"
	)
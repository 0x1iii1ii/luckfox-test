cmake_minimum_required(VERSION 3.10)
# set toolchain for cross compile
 set(CMAKE_TOOLCHAIN_FILE toolchain.cmake)

project(testPahoC)


set(CMAKE_CXX_STANDARD 14)
SET(CMAKE_C_FLAGS -pthread)
SET(CMAKE_CXX_FLAGS -pthread)

## --- Library dependencies ---

set (THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

add_executable(${PROJECT_NAME}
        main.cpp)

find_package(PahoMqttCpp REQUIRED)
include_directories(${PAHO_MQTT_C_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PahoMqttCpp::paho-mqttpp3-static)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_SOURCE_DIR}/build/${PROJECT_NAME}
        ${CMAKE_CURRENT_SOURCE_DIR}/Output/${PROJECT_NAME})
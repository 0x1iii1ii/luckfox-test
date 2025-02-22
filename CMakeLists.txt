cmake_minimum_required(VERSION 3.20)
set(PROJECT_NAME "luckfox_test")
project(${PROJECT_NAME} C)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(tools /home/seng/arm-rockchip830-linux-uclibcgnueabihf/bin)
set(MY_CROSS_prefix "arm-rockchip830-linux-uclibcgnueabihf-")
set(CMAKE_C_COMPILER ${tools}/${MY_CROSS_prefix}gcc)
set(CMAKE_CXX_COMPILER ${tools}/${MY_CROSS_prefix}g++)

set (CMAKE_FIND_ROOT_PATH tools)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_STANDARD 11)

add_executable(${PROJECT_NAME} main.c)

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake-build-debug/${PROJECT_NAME}
        ${CMAKE_CURRENT_SOURCE_DIR}/Output/${PROJECT_NAME})

cmake_minimum_required(VERSION 3.12)
project(TLDK)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/")
find_package(DPDK REQUIRED)
find_package(Threads REQUIRED)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Include the directories for library headers
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/libtle_misc
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/libtle_dring
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/libtle_timer
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/libtle_memtank
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/libtle_l4p
)

# Set compiler flags for debug mode
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")

# Compile the libraries
add_subdirectory(lib/libtle_misc)
add_subdirectory(lib/libtle_dring)
add_subdirectory(lib/libtle_timer)
add_subdirectory(lib/libtle_memtank)
add_subdirectory(lib/libtle_l4p)

# Compile the example
add_subdirectory(examples)

# Compile the tests
# add_subdirectory(tests)

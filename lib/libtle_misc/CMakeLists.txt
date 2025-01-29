cmake_minimum_required(VERSION 3.12)
project(libtle_misc)

# List the source files for the library
set(HEADERS
    tle_dpdk_wrapper.h
    tle_version.h
)

# Create an INTERFACE library target
add_library(tle_misc INTERFACE)

# Specify the include directories
target_include_directories(tle_misc INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Install the header files
install(
    FILES ${HEADERS}
    DESTINATION include
)

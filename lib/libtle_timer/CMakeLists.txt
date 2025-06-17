cmake_minimum_required(VERSION 3.12)
project(libtle_timer)

# List the source files for the library
set(SOURCES
    timer.c
)

# List the header files for the library
set(HEADERS
    tle_timer.h
)

# Create the library target
add_library(tle_timer STATIC ${SOURCES})

# Specify the include directories
target_include_directories(tle_timer PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Link against the DPDK library
target_link_libraries(tle_timer PUBLIC PkgConfig::DPDK)

#Compile options
target_compile_options(tle_timer
    PUBLIC "-mssse3"
    PRIVATE "-Wall"
)
target_compile_features(tle_timer PUBLIC c_std_11)

# Install the library and header files
install(
    TARGETS tle_timer
    ARCHIVE DESTINATION lib
)
install(
    FILES ${HEADERS}
    DESTINATION include
)

# Set the source files for the example
set(SOURCES
    main.c
    parse.c
    pkt.c
)

# Add the executable target
add_executable(l4fwd ${SOURCES})

# Set the include directories
target_include_directories(l4fwd
    PRIVATE
    ${CMAKE_SOURCE_DIR}/lib
    ${CMAKE_SOURCE_DIR}/include
)

# Link the required libraries
# IMPORTANT: The order of the libraries is important. You should order them by dependency: first the libraries that depend on others, then the libraries that are dependencies.
set(TLDK_DIR ${CMAKE_SOURCE_DIR}/build/lib)
target_link_libraries(l4fwd PUBLIC
    ${TLDK_DIR}/libtle_l4p/libtle_l4p.a
    ${TLDK_DIR}/libtle_dring/libtle_dring.a
    ${TLDK_DIR}/libtle_timer/libtle_timer.a
    ${TLDK_DIR}/libtle_memtank/libtle_memtank.a
    PkgConfig::DPDK
)

# Set the compiler flags
target_compile_options(l4fwd
PUBLIC "-march=native" "-mssse3" 
PRIVATE "-Wall" "-Wno-unused-function" "-Wno-write-strings"
-D_GNU_SOURCE
)



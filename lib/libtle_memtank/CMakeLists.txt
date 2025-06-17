# List the source files for the library
set(SOURCES
    memtank.c
    misc.c
)

# List the header files for the library
set(HEADERS
    tle_memtank.h
)

# Create the library target
add_library(tle_memtank STATIC ${SOURCES})

# Specify the include directories
target_include_directories(tle_memtank PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

#Compile options
target_compile_options(tle_memtank
    PUBLIC "-mssse3"
    PRIVATE "-Wall"
)
target_compile_features(tle_memtank PUBLIC c_std_11)

# Link against the DPDK library
target_link_libraries(tle_memtank PUBLIC PkgConfig::DPDK)

# Install the library and header files
install(
    TARGETS tle_memtank
    ARCHIVE DESTINATION lib
)
install(
    FILES ${HEADERS}
    DESTINATION include
)

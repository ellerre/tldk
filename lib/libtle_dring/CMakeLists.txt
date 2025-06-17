# List the source files for the library
set(SOURCES
    dring.c
)

# List the header files for the library
set(HEADERS
    tle_dring.h
)

# Create the library target
add_library(tle_dring STATIC ${SOURCES})

# Specify the include directories
target_include_directories(tle_dring PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Link against the DPDK library
target_link_libraries(tle_dring PUBLIC PkgConfig::DPDK)

#Compile options
target_compile_options(tle_dring
    PUBLIC "-mssse3"
    PRIVATE "-Wall"
)
target_compile_features(tle_dring PUBLIC c_std_11)

# Install the library and header files
install(
    TARGETS tle_dring
    ARCHIVE DESTINATION lib
)
install(
    FILES ${HEADERS}
    DESTINATION include
)

# List the header files for the library
set(HEADERS
    tle_ctx.h
    tle_event.h
    tle_tcp.h
    tle_udp.h
)

# Create the library target
add_library(tle_l4p STATIC ${SOURCES})

# List the source files for the library
target_sources(tle_l4p PRIVATE
    ctx.c
    event.c
    stream_table.c
    tcp_ofo.c
    tcp_rxtx.c
    tcp_stream.c
    udp_rxtx.c
    udp_stream.c
)

# Specify the include directories
target_include_directories(tle_l4p PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

#print out the dpdk libraries
target_link_libraries(tle_l4p PUBLIC PkgConfig::DPDK "rt")

#Compile options
target_compile_options(tle_l4p PUBLIC "-march=native" "-mssse3" PRIVATE "-Wall")
target_compile_features(tle_l4p PUBLIC c_std_11)

# Install the library and header files
install(
    TARGETS tle_l4p
    ARCHIVE DESTINATION lib
)
install(
    FILES ${HEADERS}
    DESTINATION include
)

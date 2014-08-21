cmake_minimum_required(VERSION 2.8)

project(hbio C)

set(hbio_VERSION_MAJOR 1)
set(hbio_VERSION_MINOR 0)
set(hbio_VERSION ${hbio_VERSION_MAJOR}.${hbio_VERSION_MINOR})

add_subdirectory(src)
add_subdirectory(bin)

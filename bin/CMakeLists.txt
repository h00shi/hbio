
include_directories(../src/)

add_executable(sample sample.c)
target_link_libraries(sample hbio)

add_executable(hbrhs2mtx hbrhs2mtx.c)
target_link_libraries(hbrhs2mtx hbio)

add_executable(hbmat2mtx hbmat2mtx.c)
target_link_libraries(hbmat2mtx hbio)

add_executable(hb2mtxstrm hb2mtxstrm.c)
target_link_libraries(hb2mtxstrm hbio)

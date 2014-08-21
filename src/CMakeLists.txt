set(SOURCES
  iohb.c
  mmio.c
  )
set(HEADERS
  iohb.h
  mmio.h
  )

add_library(hbio ${SOURCES})

SET_TARGET_PROPERTIES(
  hbio PROPERTIES
  PUBLIC_HEADER "${HEADERS}"
  VERSION ${hbio_VERSION}
  SOVERSION ${hbio_VERSION_MAJOR}
  )

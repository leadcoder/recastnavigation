if(WIN32)
  set(BASE_DIR "C:/opt" CACHE PATH "Base install dir")
else()
  set(BASE_DIR "/opt" CACHE PATH "Base install dir")
endif()

set(CMAKE_DEBUG_POSTFIX "_d")

set(CMAKE_INSTALL_PREFIX "${BASE_DIR}/recast" CACHE PATH "Install prefix")

include(cmake/buildlib.cmake)
include(cmake/mkcmakeconfig.cmake)
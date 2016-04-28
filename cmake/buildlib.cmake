function(buildlib libname lib_VERSION lib_HEADERS lib_SOURCES lib_INCLUDE_DIRECTORIES lib_INSTALL_HEADER_DIRECTORY lib_INSTALL_HEADER_FILES)

message("N:${libname}")
message("V:${lib_VERSION}")
message("H:${lib_HEADERS}")
message("S:${lib_SOURCES}")
message("I:${lib_INCLUDE_DIRECTORIES}")
message("D:${lib_INSTALL_HEADER_DIRECTORY}")
message("F:${lib_INSTALL_HEADER_FILES}")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)


#include(GenerateExportHeader)

#set(BUILD_SHARED_LIBS false CACHE BOOL "Tell cmake to build shared libs")

# Library target
add_library(${libname} ${lib_SOURCES} ${lib_HEADERS}) # lib_HEADERS for VS
target_include_directories(${libname} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${lib_INCLUDE_DIRECTORIES}>
  $<INSTALL_INTERFACE:${lib_INSTALL_HEADER_DIRECTORY}>  
)
#generate_export_header(${libname})
set_property(TARGET ${libname} PROPERTY VERSION ${lib_VERSION})
set_property(TARGET ${libname} PROPERTY SOVERSION ${libname}_MAJOR_VERSION)
set_property(TARGET ${libname} PROPERTY
  INTERFACE_${libname}_MAJOR_VERSION ${libname}_MAJOR_VERSION)
set_property(TARGET ${libname} APPEND PROPERTY
  COMPATIBLE_INTERFACE_STRING ${libname}_MAJOR_VERSION
)

install(TARGETS ${libname} EXPORT LibraryTargets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(
  FILES
	${lib_HEADERS}
  DESTINATION
    ${lib_INSTALL_HEADER_DIRECTORY}
  COMPONENT
    Devel
)

#install(
#  FILES
#    "${CMAKE_CURRENT_BINARY_DIR}/Detour_export.h"
#  DESTINATION
#    include
#  COMPONENT
#    Devel
#)

endfunction()
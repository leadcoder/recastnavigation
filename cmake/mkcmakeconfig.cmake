function(mkcmakeconfig packagename packageversion)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/${packagename}ConfigVersion.cmake"
  VERSION ${packageversion}
  COMPATIBILITY AnyNewerVersion
)

export(EXPORT LibraryTargets
  FILE "${CMAKE_CURRENT_BINARY_DIR}/${packagename}Targets.cmake"
  NAMESPACE ${packagename}::
)
configure_file(cmake/${packagename}Config.cmake
  "${CMAKE_CURRENT_BINARY_DIR}/${packagename}Config.cmake"
  COPYONLY
)

if(WIN32)
  set(ConfigPackageLocation cmake)
else()
  set(ConfigPackageLocation lib/cmake/${packagename})
endif()
install(EXPORT LibraryTargets
  FILE
    ${packagename}Targets.cmake
  NAMESPACE
    ${packagename}::
  DESTINATION
    ${ConfigPackageLocation}
)
install(
  FILES
    cmake/${packagename}Config.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/${packagename}ConfigVersion.cmake"
  DESTINATION
    ${ConfigPackageLocation}
  COMPONENT
    Devel
)
endfunction()
set(DetourCrowd_LIBNAME DetourCrowd)
set(DetourCrowd_MAJOR_VERSION 1)
set(DetourCrowd_MINOR_VERSION 5)
set(DetourCrowd_PATCH_VERSION 1)
#set(DetourCrowd_TWEAK_VERSION 0)
set(DetourCrowd_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")

# ------------
# Dependencies
# ------------

# ------------------------------
# Sources and source directories
# ------------------------------
set(DetourCrowd_HEADERS
  Include/DetourCrowd.h
  Include/DetourLocalBoundary.h
  Include/DetourObstacleAvoidance.h
  Include/DetourPathCorridor.h
  Include/DetourPathQueue.h
  Include/DetourProximityGrid.h
)
set(DetourCrowd_SOURCES
  Source/DetourCrowd.cpp
  Source/DetourLocalBoundary.cpp
  Source/DetourObstacleAvoidance.cpp
  Source/DetourPathCorridor.cpp
  Source/DetourPathQueue.cpp
  Source/DetourProximityGrid.cpp
)

set(DetourCrowd_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(DetourCrowd_INSTALL_HEADER_DIRECTORY Include)
set(DetourCrowd_INSTALL_HEADER_FILES ${DetourCrowd_HEADERS})


# ==============================

buildlib("${DetourCrowd_LIBNAME}" "${DetourCrowd_VERSION}" "${DetourCrowd_HEADERS}" "${DetourCrowd_SOURCES}" "${DetourCrowd_INCLUDE_DIRECTORIES}" "${DetourCrowd_INSTALL_HEADER_DIRECTORY}" "${DetourCrowd_INSTALL_HEADER_FILES}")
target_link_libraries(${DetourCrowd_LIBNAME} PRIVATE Detour)


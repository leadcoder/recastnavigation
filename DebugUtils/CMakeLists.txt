set(DebugUtils_LIBNAME DebugUtils)
set(DebugUtils_MAJOR_VERSION 1)
set(DebugUtils_MINOR_VERSION 5)
set(DebugUtils_PATCH_VERSION 1)
#set(DebugUtils_TWEAK_VERSION 0)
set(DebugUtils_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")


# ------------
# Dependencies
# ------------
#find_package(Recast REQUIRED)
#find_package(Detour REQUIRED)
#find_package(DetourTileCache REQUIRED)

# ------------------------------
# Sources and source directories
# ------------------------------
set(DebugUtils_HEADERS
  Include/DebugDraw.h
  Include/DetourDebugDraw.h
  Include/RecastDebugDraw.h
  Include/RecastDump.h
)
set(DebugUtils_SOURCES
  Source/DebugDraw.cpp
  Source/DetourDebugDraw.cpp
  Source/RecastDebugDraw.cpp
  Source/RecastDump.cpp
)

set(DebugUtils_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(DebugUtils_INSTALL_HEADER_DIRECTORY Include)
set(DebugUtils_INSTALL_HEADER_FILES ${DebugUtils_HEADERS})


# ==============================

buildlib("${DebugUtils_LIBNAME}" "${DebugUtils_VERSION}" "${DebugUtils_HEADERS}" "${DebugUtils_SOURCES}" "${DebugUtils_INCLUDE_DIRECTORIES}" "${DebugUtils_INSTALL_HEADER_DIRECTORY}" "${DebugUtils_INSTALL_HEADER_FILES}")
target_link_libraries("${DebugUtils_LIBNAME}" Recast Detour DetourTileCache)


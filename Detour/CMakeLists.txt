set(Detour_LIBNAME Detour)
set(Detour_MAJOR_VERSION 1)
set(Detour_MINOR_VERSION 5)
set(Detour_PATCH_VERSION 1)
#set(Detour_TWEAK_VERSION 0)
set(Detour_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")

# ------------
# Dependencies
# ------------

# ------------------------------
# Sources and source directories
# ------------------------------
set(Detour_HEADERS 
  Include/DetourAlloc.h
  Include/DetourAssert.h
  Include/DetourCommon.h
  Include/DetourMath.h
  Include/DetourNavMesh.h
  Include/DetourNavMeshBuilder.h
  Include/DetourNavMeshQuery.h
  Include/DetourNode.h
  Include/DetourStatus.h
)
set(Detour_SOURCES
  Source/DetourAlloc.cpp
  Source/DetourCommon.cpp
  Source/DetourNavMesh.cpp
  Source/DetourNavMeshBuilder.cpp
  Source/DetourNavMeshQuery.cpp
  Source/DetourNode.cpp
)

set(Detour_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(Detour_INSTALL_HEADER_DIRECTORY Include)
set(Detour_INSTALL_HEADER_FILES ${Detour_HEADERS})


# ==============================

buildlib("${Detour_LIBNAME}" "${Detour_VERSION}" "${Detour_HEADERS}" "${Detour_SOURCES}" "${Detour_INCLUDE_DIRECTORIES}" "${Detour_INSTALL_HEADER_DIRECTORY}" "${Detour_INSTALL_HEADER_FILES}")



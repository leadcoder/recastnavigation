set(Recast_LIBNAME Recast)
set(Recast_MAJOR_VERSION 1)
set(Recast_MINOR_VERSION 5)
set(Recast_PATCH_VERSION 1)
#set(Recast_TWEAK_VERSION 0)
set(Recast_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")

# ------------
# Dependencies
# ------------

# ------------------------------
# Sources and source directories
# ------------------------------
set(Recast_HEADERS 
  Include/Recast.h
  Include/RecastAlloc.h
  Include/RecastAssert.h
)
set(Recast_SOURCES
  Source/Recast.cpp
  Source/RecastAlloc.cpp
  Source/RecastArea.cpp
  Source/RecastContour.cpp
  Source/RecastFilter.cpp
  Source/RecastLayers.cpp
  Source/RecastMesh.cpp
  Source/RecastMeshDetail.cpp
  Source/RecastRasterization.cpp
  Source/RecastRegion.cpp
)

set(Recast_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(Recast_INSTALL_HEADER_DIRECTORY Include)
set(Recast_INSTALL_HEADER_FILES ${Recast_HEADERS})


# ==============================

buildlib("${Recast_LIBNAME}" "${Recast_VERSION}" "${Recast_HEADERS}" "${Recast_SOURCES}" "${Recast_INCLUDE_DIRECTORIES}" "${Recast_INSTALL_HEADER_DIRECTORY}" "${Recast_INSTALL_HEADER_FILES}")



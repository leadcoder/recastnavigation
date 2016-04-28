set(Utils_LIBNAME Utils)
set(Utils_MAJOR_VERSION 1)
set(Utils_MINOR_VERSION 5)
set(Utils_PATCH_VERSION 1)
#set(Utils_TWEAK_VERSION 0)
set(Utils_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")

# ------------
# Dependencies
# ------------

# ------------------------------
# Sources and source directories
# ------------------------------
set(Utils_HEADERS
  Include/ChunkyTriMesh.h
  Include/InputGeom.h
  Include/MeshLoaderObj.h
  Include/TiledNavigationMeshBuilder.h
  Include/TiledNavigationMeshSerializer.h
)
set(Utils_SOURCES
  Source/ChunkyTriMesh.cpp
  Source/InputGeom.cpp
  Source/MeshLoaderObj.cpp
  Source/TiledNavigationMeshBuilder.cpp
  Source/TiledNavigationMeshSerializer.cpp
)

set(Utils_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(Utils_INSTALL_HEADER_DIRECTORY Include)
set(Utils_INSTALL_HEADER_FILES ${Utils_HEADERS})


# ==============================

buildlib("${Utils_LIBNAME}" "${Utils_VERSION}" "${Utils_HEADERS}" "${Utils_SOURCES}" "${Utils_INCLUDE_DIRECTORIES}" "${Utils_INSTALL_HEADER_DIRECTORY}" "${Utils_INSTALL_HEADER_FILES}")
target_link_libraries("${Utils_LIBNAME}"
  PRIVATE
    Recast
	Detour
	DetourTileCache
)


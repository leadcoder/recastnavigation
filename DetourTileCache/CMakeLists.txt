set(DetourTileCache_LIBNAME DetourTileCache)
set(DetourTileCache_MAJOR_VERSION 1)
set(DetourTileCache_MINOR_VERSION 5)
set(DetourTileCache_PATCH_VERSION 1)
#set(DetourTileCache_TWEAK_VERSION 0)
set(DetourTileCache_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")

# ------------
# Dependencies
# ------------

# ------------------------------
# Sources and source directories
# ------------------------------
set(DetourTileCache_HEADERS
  Include/DetourTileCache.h
  Include/DetourTileCacheBuilder.h
)
set(DetourTileCache_SOURCES
  Source/DetourTileCache.cpp
  Source/DetourTileCacheBuilder.cpp
)

set(DetourTileCache_INCLUDE_DIRECTORIES Include)

# -------
# Install
# -------
set(DetourTileCache_INSTALL_HEADER_DIRECTORY Include)
set(DetourTileCache_INSTALL_HEADER_FILES ${DetourTileCache_HEADERS})


# ==============================

buildlib("${DetourTileCache_LIBNAME}" "${DetourTileCache_VERSION}" "${DetourTileCache_HEADERS}" "${DetourTileCache_SOURCES}" "${DetourTileCache_INCLUDE_DIRECTORIES}" "${DetourTileCache_INSTALL_HEADER_DIRECTORY}" "${DetourTileCache_INSTALL_HEADER_FILES}")
target_link_libraries(${DetourTileCache_LIBNAME} PRIVATE Detour)


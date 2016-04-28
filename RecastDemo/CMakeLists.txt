set(RecastDemo_EXENAME RecastDemo)
set(RecastDemo_MAJOR_VERSION 1)
set(RecastDemo_MINOR_VERSION 5)
set(RecastDemo_PATCH_VERSION 1)
#set(RecastDemo_TWEAK_VERSION 0)
set(RecastDemo_VERSION "${Utils_MAJOR_VERSION}.${Utils_MINOR_VERSION}.${Utils_PATCH_VERSION}")


# ------------
# Dependencies
# ------------
find_package(OpenGL REQUIRED)


# ------------------------------
# Sources and source directories
# ------------------------------
set(RecastDemo_HEADERS
  Include/ChunkyTriMesh.h
  Include/ConvexVolumeTool.h
  Include/CrowdTool.h
  Include/Filelist.h
  Include/imgui.h
  Include/imguiRenderGL.h
  Include/InputGeom.h
  Include/MeshLoaderObj.h
  Include/NavMeshPruneTool.h
  Include/NavMeshTesterTool.h
  Include/OffMeshConnectionTool.h
  Include/PerfTimer.h
  Include/Sample.h
  Include/SampleInterfaces.h
  Include/Sample_Debug.h
  Include/Sample_SoloMesh.h
  Include/Sample_TempObstacles.h
  Include/Sample_TileMesh.h
  Include/TestCase.h
  Include/ValueHistory.h
)

set(RecastDemo_SOURCES
  Source/ChunkyTriMesh.cpp
  Source/ConvexVolumeTool.cpp
  Source/CrowdTool.cpp
  Source/Filelist.cpp
  Source/imgui.cpp
  Source/imguiRenderGL.cpp
  Source/InputGeom.cpp
  Source/main.cpp
  Source/MeshLoaderObj.cpp
  Source/NavMeshPruneTool.cpp
  Source/NavMeshTesterTool.cpp
  Source/OffMeshConnectionTool.cpp
  Source/PerfTimer.cpp
  Source/Sample.cpp
  Source/SampleInterfaces.cpp
  Source/Sample_Debug.cpp
  Source/Sample_SoloMesh.cpp
  Source/Sample_TempObstacles.cpp
  Source/Sample_TileMesh.cpp
  Source/TestCase.cpp
  Source/ValueHistory.cpp
)

set(RecastDemo_INCLUDE_DIRECTORIES Include Contrib Contrib/fastlz Contrib/SDL/include)

file(GLOB RecastDemo_EXTERNAL_SOURCES Contrib/fastlz/*.c)
file(GLOB RecastDemo_EXTERNAL_HEADERS Contrib/fastlz/*.h Contrib/*.h) # For VS


# -------
# Install
# -------
set(RecastDemo_INSTALL_RESOURCES_DIRECTORY bin)
set(RecastDemo_RESOURCE_DIRECTORIES
  Bin/Meshes
  Bin/TestCases
)
set(RecastDemo_RESOURCE_FILES
  Bin/DroidSans.ttf
)

# ==============================

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)

# Define target
add_executable(${RecastDemo_EXENAME} ${RecastDemo_SOURCES} ${RecastDemo_HEADERS} ${RecastDemo_EXTERNAL_SOURCES} ${RecastDemo_EXTERNAL_HEADERS})
set_target_properties(${RecastDemo_EXENAME} PROPERTIES DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})


# Link target dependencies
target_include_directories(${RecastDemo_EXENAME} PRIVATE ${RecastDemo_INCLUDE_DIRECTORIES})
target_link_libraries(${RecastDemo_EXENAME} PRIVATE ${OpenGL_LIBRARIES} ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY})
target_link_libraries(${RecastDemo_EXENAME} PRIVATE Recast)
target_link_libraries(${RecastDemo_EXENAME} PRIVATE Detour)
target_link_libraries(${RecastDemo_EXENAME} PRIVATE DetourCrowd)
target_link_libraries(${RecastDemo_EXENAME} PRIVATE DetourTileCache)
target_link_libraries(${RecastDemo_EXENAME} PRIVATE DebugUtils)
target_link_libraries(${RecastDemo_EXENAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Contrib/SDL/lib/x64/SDL2.lib ${CMAKE_CURRENT_SOURCE_DIR}/Contrib/SDL/lib/x64/SDL2main.lib)

# Install procedure
install(TARGETS ${RecastDemo_EXENAME} EXPORT ExeTargets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(
  DIRECTORY
	${RecastDemo_RESOURCE_DIRECTORIES}
  DESTINATION
    ${RecastDemo_INSTALL_RESOURCES_DIRECTORY}
)
install(
  FILES
	${RecastDemo_RESOURCE_FILES}
  DESTINATION
    ${RecastDemo_INSTALL_RESOURCES_DIRECTORY}
)

if(WIN32)
  install(
    FILES
      Contrib/SDL/lib/x64/SDL2.dll
    DESTINATION bin
  )
endif()


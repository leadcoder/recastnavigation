include(cmake/policy.cmake)
project(RecastNavigation)

cmake_minimum_required(VERSION 3.5)


add_subdirectory(Recast)
add_subdirectory(Detour)
add_subdirectory(DetourCrowd)
add_subdirectory(DetourTileCache)
add_subdirectory(DebugUtils)
add_subdirectory(Utils)
#add_subdirectory(RecastDemo)

mkcmakeconfig(RecastNavigation 1.5.1)

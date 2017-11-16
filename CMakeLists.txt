#--------------------------------------------------------------------------#
# Set Basic CMake Configuration                                            #
#--------------------------------------------------------------------------#
cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
project(AliDPG C)
enable_testing()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${dir})
set(CMAKE_BUILD_FILES_DIRECTORY ${dir})
set(CMAKE_BUILD_DIRECTORY  ${dir})
set(CMAKE_BINARY_DIR  ${dir})

message(STATUS "CMake platform: ${CMAKE_SYSTEM}")
message(STATUS "Build folder: ${AliRoot_BINARY_DIR}")
message(STATUS "Source folder: ${AliRoot_SOURCE_DIR}")
message(STATUS "Installation folder: ${CMAKE_INSTALL_PREFIX}")

# Optional: Doxygen for reference doc generation
find_package(Doxygen)
if(DOXYGEN_FOUND AND DOXYGEN_DOT_FOUND)
  message(STATUS "Doxygen ${DOXYGEN_VERSION} and Graphviz found: ${DOXYGEN_EXECUTABLE}, ${DOXYGEN_DOT_EXECUTABLE}")
  set(CAN_GENERATE_DOC TRUE)
elseif(DOXYGEN_ONLY)
  message(FATAL_ERROR "Doxygen and Graphviz not found. Cannot generate documentation")
else()
  message(STATUS "Doxygen and Graphviz not found. Disabling support for documentation generation")
endif()

# Doxygen documentation is always included
add_subdirectory(doxygen)
# enable Ctest/dashboard scripting
include (CTest)

add_subdirectory(Utilis/test)
#add_subdirectory(MC)




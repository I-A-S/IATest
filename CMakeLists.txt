cmake_minimum_required(VERSION 3.28 FATAL_ERROR)

project(IATest LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(IATest_ROOT "${CMAKE_CURRENT_LIST_DIR}" CACHE INTERNAL "")
set(IATest_CMAKE_DIR "${IATest_ROOT}/cmake" CACHE INTERNAL "")
list(APPEND CMAKE_MODULE_PATH "${IATest_CMAKE_DIR}")

message(STATUS "[IATest] Detected Compiler: ${CMAKE_CXX_COMPILER_ID}")

if (MSVC AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    message(FATAL_ERROR 
        "\n-------------------------------------------------------------\n"
        "CRITICAL ERROR: Unsupported Compiler (MSVC/cl.exe)\n"
        "IATest requires GCC or Clang. On Windows, use 'Clang-cl' or MinGW.\n"
        "-------------------------------------------------------------\n"
    )
endif()

include(find_deps)

add_library(IATest INTERFACE)

target_include_directories(IATest INTERFACE "${IATest_ROOT}/include")

if(MSVC)
    target_compile_options(IATest INTERFACE "/EHsc")
else()
    target_compile_options(IATest INTERFACE "-fexceptions")
endif()
set_target_properties(IATest PROPERTIES USE_EXCEPTIONS ON)

target_link_libraries(IATest INTERFACE Auxid)

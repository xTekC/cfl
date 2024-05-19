cmake_minimum_required(VERSION 3.25)

# Set compiler to Clang before project definition
set(CMAKE_C_COMPILER clang)
project(low C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
# set(CMAKE_C_EXTENSIONS OFF)

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
    add_compile_options(
        -Wall
        -Wextra
        -pedantic
        -fPIC
        -Xanalyzer
    )
else()
    message(FATAL_ERROR "This project requires Clang.")
endif()

# set(**LIB_NAME**_VERSION **version**)
# find_package(**lib_name** ${**LIB_NAME**_VERSION} QUIET)
# if (NOT **lib_name**_FOUND)
#   include(FetchContent)
#   FetchContent_Declare(
#     **lib_name**
#     DOWNLOAD_EXTRACT_TIMESTAMP OFF
#     URL https://github.com/**user**/**lib_name**/archive/refs/tags/${**LIB_NAME**_VERSION}.tar.gz
#   )
#   FetchContent_GetProperties(**lib_name**)
#   if (NOT **lib_name**_POPULATED)
#     set(FETCHCONTENT_QUIET NO)
#     FetchContent_Populate(**lib_name**)
#     set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
#     add_subdirectory(${**lib_name**_SOURCE_DIR} ${**lib_name**_BINARY_DIR})
#   endif()
# endif()

# add_executable(${PROJECT_NAME} src/low.c)
# add_library(${PROJECT_NAME}_lib SHARED src/low.c)

# target_link_libraries(${PROJECT_NAME} PRIVATE **lib_name**)
# target_include_directories(${PROJECT_NAME} PRIVATE ${**lib_name**_SOURCE_DIR}/include)

file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets)

# if(ANDROID)
#     message(STATUS "Configuring for Android")
#     file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/android)

#     add_library(low_android SHARED src/low.c)
#     target_include_directories(low_android PRIVATE include)

#     set_target_properties(low_android PROPERTIES OUTPUT_NAME "low_android")

#     set_target_properties(low_android PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/android)
# endif()

option(BUILD_ANDROID OFF)
if(BUILD_ANDROID)
    message(STATUS "Configuring for Android")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/android)

    add_library(low_android SHARED src/low.c)
    target_include_directories(low_android PRIVATE include)

    set_target_properties(low_android PROPERTIES OUTPUT_NAME "low_android")

    set_target_properties(low_android PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/android)
endif()

if(LINUX)
    message(STATUS "Configuring for Linux")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/linux)

    add_library(low_linux SHARED src/low.c)
    target_include_directories(low_linux PRIVATE include)

    set_target_properties(low_linux PROPERTIES OUTPUT_NAME "low_linux")

    set_target_properties(low_linux PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/linux)
endif()

if(MSYS)
    message(STATUS "Configuring for Windows")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/windows)

    add_library(low_windows SHARED src/low.c)
    target_include_directories(low_windows PRIVATE include)

    set_target_properties(low_windows PROPERTIES OUTPUT_NAME "low_windows")

    set_target_properties(low_windows PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/windows)
endif()

if(APPLE)
message(STATUS "Configuring for MacOS")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/macos)

    add_library(low_macos SHARED src/low.c)
    target_include_directories(low_macos PRIVATE include)

    set_target_properties(low_macos PROPERTIES OUTPUT_NAME "low_macos")

    set_target_properties(low_macos PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/macos)
endif()

if(IOS)
    message(STATUS "Configuring for iOS")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/ios)

    add_library(low_ios SHARED src/low.c)
    target_include_directories(low_ios PRIVATE include)

    set_target_properties(low_ios PROPERTIES OUTPUT_NAME "low_ios")

    set_target_properties(low_ios PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/native_assets/ios)
endif()

option(BUILD_WEB OFF)
if(BUILD_WEB)
    #...
endif()

enable_testing()
option(BUILD_TESTS OFF)
if(BUILD_TESTS)
    add_subdirectory(tests)
endif()

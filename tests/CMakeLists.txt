cmake_minimum_required(VERSION 3.25)
project(Tests)

set(CMOCKA_VERSION 1.1.7)
find_package(cmocka ${CMOCKA_VERSION} QUIET)
if (NOT cmocka_FOUND)
  include(FetchContent)
  FetchContent_Declare(
    cmocka
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
    URL https://cmocka.org/files/1.1/cmocka-${CMOCKA_VERSION}.tar.xz
  )
  FetchContent_GetProperties(cmocka)
  if (NOT cmocka_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(cmocka)
    set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
    add_subdirectory(${cmocka_SOURCE_DIR} ${cmocka_BINARY_DIR})
  endif()
endif()

add_executable(test_low test_low.c)
target_link_libraries(test_low PRIVATE cmocka)

enable_testing()
add_test(NAME test_low COMMAND test_low)
set_tests_properties(test_low PROPERTIES LABELS "low_tests")

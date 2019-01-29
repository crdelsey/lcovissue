cmake_minimum_required(VERSION 3.5)
project(package_b)

option(CODE_COVERAGE "Enable code coverage" OFF)

if(CODE_COVERAGE)
  add_compile_options(--coverage)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} --coverage")
endif()

find_package(ament_cmake REQUIRED)
find_package(package_a REQUIRED)

include_directories(
  include
)

if(BUILD_TESTING)
  find_package(ament_cmake_gtest REQUIRED)
  add_subdirectory(test)
endif()

ament_package()

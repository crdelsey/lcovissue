cmake_minimum_required(VERSION 3.5)
project(package_a)

option(CODE_COVERAGE "Enable code coverage" OFF)

if(CODE_COVERAGE)
  add_compile_options(--coverage)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} --coverage")
endif()

find_package(ament_cmake REQUIRED)

include_directories(
  include
)

install(DIRECTORY include/
  DESTINATION include/
)

if(BUILD_TESTING)
  find_package(ament_cmake_gtest REQUIRED)
  add_subdirectory(test)
endif()

ament_export_include_directories(include)

ament_package()

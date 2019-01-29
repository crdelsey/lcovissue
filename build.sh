#!/bin/bash

if [ ! -d src/package_a ]; then
  echo "Please run this script from the root of your workspace."
  echo "Expected directory hierarchy is:"
  echo "example_ws"
  echo " - src"
  echo " - - package_a"
  echo " - - package_b"
  exit 1
fi

for opt in "$@" ; do
  case "$opt" in
    clean)
      rm -rf install build log
      ;;
    colconlcov)
      colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS='--coverage' -DCMAKE_C_FLAGS='--coverage'
      ;;
    baselcov)
      colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCODE_COVERAGE=ON
      ;;
  esac
done

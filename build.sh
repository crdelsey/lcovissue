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

set -e

for opt in "$@" ; do
  case "$opt" in
    clean)
      rm -rf install build log lcov baselcov
      ;;
    colconlcov)
      colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS='--coverage' -DCMAKE_C_FLAGS='--coverage'
      colcon lcov-result --zero-counters
      colcon lcov-result --initial
      colcon test
      colcon lcov-result
      echo
      echo "Coverage results are in lcov"
      ;;
    baselcov)
      colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCODE_COVERAGE=ON
      LCOVDIR=baselcov
      mkdir $LCOVDIR
      PWD=`pwd`
      lcov -c  --initial --rc lcov_branch_coverage=1 --directory build --output-file ${LCOVDIR}/initialcoverage.info
      colcon test
      lcov -c --rc lcov_branch_coverage=1 --directory build --output-file ${LCOVDIR}/testcoverage.info
      lcov -a ${LCOVDIR}/initialcoverage.info -a ${LCOVDIR}/testcoverage.info --rc lcov_branch_coverage=1 --o ${LCOVDIR}/fullcoverage.info
      lcov -e ${LCOVDIR}/fullcoverage.info "${PWD}/*" --rc lcov_branch_coverage=1 --output-file ${LCOVDIR}/projectcoverage.info
      genhtml ${LCOVDIR}/projectcoverage.info --output-directory ${LCOVDIR}/html --branch-coverage -p ${PWD}
      echo
      echo "Coverage results are in ${LCOVDIR}/html"
      ;;
  esac
done

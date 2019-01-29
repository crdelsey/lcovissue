#include "gtest/gtest.h"
#include "package_a/package_a.h"

TEST(package_a, PackageA) {
  PackageA pa;
  pa.foo();
  SUCCEED();
}

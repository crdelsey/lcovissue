#include "gtest/gtest.h"
#include "package_a/package_a.h"

TEST(package_b, PackageB) {
  PackageA pa;
  pa.bar();
  SUCCEED();
}

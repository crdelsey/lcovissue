ament_add_gtest(test_PackageB test_PackageB.cpp)
ament_target_dependencies(test_PackageB package_a)

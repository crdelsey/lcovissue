# Overview

The repository is to illustrate an issue in colcon lcov result.

https://github.com/colcon/colcon-lcov-result/issues/9

# Instructions

1. Make a workspace to play with this code.
```
cd /tmp
mkdir -p example_ws/src
```

2. Clone this repo to the src directory
```
cd example_ws/src
git clone *TBD*
```

3. Source your ROS 2 environment and go to the root of the workspace
```
source <YOUR ROS DIR>/install/setup.bash
cd /tmp/example_ws
```

4. Generate colcon-lcov-result data
```
./src/build.bash colconlcov
firefox lcov/index.html
```

5. Generate direct lcov data
```
./src/build.bash baselcov
firefox baselcov/html/index.html
```

Notic there is one extra line in the baselcov data showing `package_a` under the `install` directory.

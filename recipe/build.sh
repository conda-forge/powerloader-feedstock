rm -rf build
mkdir build
cd build

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY=1"

cmake .. ${CMAKE_ARGS}              \
    -GNinja                         \
    -DCMAKE_INSTALL_PREFIX=$PREFIX  \
    -DCMAKE_PREFIX_PATH=$PREFIX     \
    -DBUILD_EXE=ON                  \
    -DBUILD_SHARED=ON               \
    -DBUILD_STATIC=ON               \
    -DENABLE_TESTS=OFF              \
    -DENABLE_PYTHON=OFF

ninja
ninja install

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

if [[ $PKG_NAME == "powerloader" ]]; then
    cp libpowerloader.so $PREFIX/lib/
    cp powerloader $PREFIX/bin/
elif [[ $PKG_NAME == "powerloader-dev" ]]; then
    ninja install
    rm $PREFIX/lib/libpowerloader.so
    rm $PREFIX/bin/powerloader
fi

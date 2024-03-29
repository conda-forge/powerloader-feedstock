rmdir /Q /S build
mkdir build
cd build

cmake .. ^
    %CMAKE_ARGS% ^
        -GNinja ^
        -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
        -DCMAKE_PREFIX_PATH=%PREFIX% ^
        -DCMAKE_BUILD_TYPE="Release" ^
        -DBUILD_SHARED=ON ^
        -DBUILD_STATIC=OFF ^
        -DBUILD_EXE=ON ^
        -DENABLE_TESTS=OFF ^
        -DENABLE_PYTHON=OFF

if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1


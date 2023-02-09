rmdir /Q /S build
mkdir build
cd build

cmake .. ^
    %CMAKE_ARGS% ^
        -GNinja ^
        -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
        -DCMAKE_PREFIX_PATH=%PREFIX% ^
        -DBUILD_SHARED=ON ^
        -DBUILD_STATIC=ON ^
        -DBUILD_EXE=ON ^
        -DENABLE_TESTS=OFF ^
        -DENABLE_PYTHON=OFF

if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

if /I "%PKG_NAME%" == "powerloader" (
    COPY /Y /B libpowerloader.lib %LIBRARY_PREFIX%/lib/ 
    COPY /Y /B libpowerloader.dll %LIBRARY_PREFIX%/bin/ 
    COPY /Y /B powerloader.exe %LIBRARY_PREFIX%/bin/ 
)
if errorlevel 1 exit 1

if /I "%PKG_NAME%" == "powerloader-dev" (
    ninja install
    DEL /f %LIBRARY_PREFIX%/lib/libpowerloader.lib
    DEL /f %LIBRARY_PREFIX%/bin/libpowerloader.dll
    DEL /f %LIBRARY_PREFIX%/bin/powerloader.exe
)
if errorlevel 1 exit 1



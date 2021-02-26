rmdir \S \Q Build\MSVC
rmdir \S \Q Install\MSVC
mkdir Build\MSVC
cd Build\MSVC
python ..\..\scripts\update_deps.py
cd ..\..
cmake -C Build/MSVC/helper.cmake -D CMAKE_INSTALL_PREFIX=".\Install\MSVC" -H. -BBuild/MSVC
cmake --build Build/MSVC --config Release
cmake --install Build/MSVC --config Release

:: Copy the artifacts over
mkdir ..\\Extern\\VulkanLoader\\Libraries\\x64\\Windows\\MSVC\\
mkdir ..\\Extern\\VulkanLoader\\Include
copy .\Install\MSVC\lib\vulkan-1.lib ..\Extern\VulkanLoader\Libraries\x64\Windows\MSVC\vulkan-1.lib
xcopy /s /y .\Vulkan-Headers\include ..\Extern\VulkanLoader\Include
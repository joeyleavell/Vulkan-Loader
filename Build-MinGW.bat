rmdir \S \Q Build\MinGW
rmdir \S \Q Install\MinGW
mkdir Build\MinGW
cd Build\MinGW
python ..\..\scripts\update_deps.py
cd ..\..
cmake -G "MinGW Makefiles" -C Build/MinGW/helper.cmake -D CMAKE_INSTALL_PREFIX=".\Install\MinGW" -H. -BBuild/MinGW
cmake --build Build/MinGW --config Release -- -j12
cmake --install Build/MinGW --config Release

:: Copy the artifacts over
mkdir ..\\Extern\\VulkanLoader\\Libraries\\x64\\Windows\\MinGW\\
mkdir ..\\Extern\\VulkanLoader\\Include
copy .\Install\MinGW\lib\libvulkan-1.dll.a ..\Extern\VulkanLoader\Libraries\x64\Windows\MinGW\libvulkan-1.dll.a
xcopy /s /y .\Vulkan-Headers\include ..\Extern\VulkanLoader\Include
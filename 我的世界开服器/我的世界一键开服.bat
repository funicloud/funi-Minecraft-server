chcp 65001
@echo off

echo funi我的世界开服器
echo 已在GitHub开源地址：
echo 请选择要下载的服务器版本：
echo 1. Minecraft 1.12.2
echo 2. Minecraft 1.14.4
echo 3. Minecraft 1.15.2
echo 4. Minecraft 1.16.3
echo 5. Minecraft 1.16.5
echo 6. Minecraft 1.20.1
echo 7. Minecraft 1.20.2

set /p version=请输入对应的数字: 

if "%version%"=="1" (
    set downloadURL=https://img.zeruns.tech/down/mc_server/minecraft_server/minecraft_server.1.12.2.jar
) else if "%version%"=="2" (
    set downloadURL=https://img.zeruns.tech/down/mc_server/minecraft_server/minecraft_server.1.14.4.jar
) else if "%version%"=="3" (
    set downloadURL=https://img.zeruns.tech/down/mc_server/minecraft_server/minecraft_server.1.15.2.jar
) else if "%version%"=="4" (
    set downloadURL=https://img.zeruns.tech/down/mc_server/minecraft_server/minecraft_server.1.16.3.jar
) else if "%version%"=="5" (
    set downloadURL=https://img.zeruns.tech/down/mc_server/minecraft_server/minecraft_server.1.16.5.jar
) else if "%version%"=="6" (
    set downloadURL=https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar
) else if "%version%"=="7" (
    set downloadURL=https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar
) else (
    echo 无效的输入，无法下载服务器文件。
    pause
    exit /b
)

set serverDir=minecraft_server_%version%

echo 正在创建服务器目录...
if not exist %serverDir% mkdir %serverDir%

echo 正在下载服务器文件...
curl -o %serverDir%/server.jar %downloadURL%

echo 创建启动脚本...
echo @echo off > %serverDir%/start_server.bat
echo java -Xmx4096M -Xms4096M -jar server.jar nogui >> %serverDir%/start_server.bat

echo 启动脚本已创建。请进入%servrDir%文件夹，双击运行start_server.bat文件启动服务器。

pause
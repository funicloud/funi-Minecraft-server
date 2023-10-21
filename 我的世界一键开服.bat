chcp 65001
@echo off

echo funi我的世界原版开服器
echo 已在GitHub开源地址：https://github.com/funicloud/funi-Minecraft-server
echo 请选择要下载的服务器版本：
echo 1. Minecraft 1.12.2
echo 2. Minecraft 1.14.4
echo 3. Minecraft 1.15.2
echo 4. Minecraft 1.16.3
echo 5. Minecraft 1.16.5
echo 6. Minecraft 1.18.2
echo 7. Minecraft 1.20.1
echo 8. Minecraft 1.20.2
echo 9. 下载启动器

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
    set downloadURL=https://launcher.mojang.com/v1/objects/5cefe123ae97c01db83297f55968b9dc2fd0a360/server.jar
) else if "%version%"=="7" (
    set downloadURL=https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar
) else if "%version%"=="8" (
    set downloadURL=https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar
) else if "%version%"=="9" (
    curl -Lo HCML启动器.exe http://mirrors.cloud.tencent.com/nexus/repository/maven-public/org/glavo/hmcl/hmcl-dev/3.5.4.234/hmcl-dev-3.5.4.234.exe
    echo 启动器已下载完成，请双击运行hmcl启动器。
) 
    pause
    exit /b
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
echo chcp 65001 >> %serverDir%/start_server.bat
echo java -Xmx4096M -Xms4096M -jar server.jar nogui >> %serverDir%/start_server.bat
echo 启动脚本已创建。请进入%servrDir%文件夹，双击运行start_server.bat文件启动服务器。

pause
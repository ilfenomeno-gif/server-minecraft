@echo off
title Server Minecraft 26.2 Fabric (Luca e Sebastian)
echo ===================================================
echo   AVVIO SERVER MINECRAFT 26.2 FABRIC
echo   Tenuta di Luca e Sebastian
echo ===================================================
echo.

set "JAVA_BIN=C:\Program Files\Microsoft\jdk-25.0.4.7-hotspot\bin\java.exe"
if not exist "%JAVA_BIN%" (
    if exist "C:\Program Files\Microsoft\jdk-21.0.12.8-hotspot\bin\java.exe" (
        set "JAVA_BIN=C:\Program Files\Microsoft\jdk-21.0.12.8-hotspot\bin\java.exe"
    ) else (
        set "JAVA_BIN=java"
    )
)

"%JAVA_BIN%" -Xms4G -Xmx6G -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -jar fabric-server-launch.jar nogui
echo.
echo Server arrestato. Premi un tasto per chiudere.
pause


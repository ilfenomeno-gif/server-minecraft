@echo off
title Aggiornamento Mappa Mondo Reale a 26.2
echo ===================================================
echo   AGGIORNAMENTO / UPGRADE FORZATO DEI CHUNK MONDO
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

echo Esecuzione DataFixerUpper con --forceUpgrade --eraseCache...
echo Attendere il completamento della scansione...
echo.
"%JAVA_BIN%" -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -jar fabric-server-launch.jar --forceUpgrade --eraseCache nogui
echo.
echo Conversione completata con successo!
pause


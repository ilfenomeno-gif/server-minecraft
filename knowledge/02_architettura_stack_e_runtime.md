# Scheda di Governance 02: Architettura Stack & Runtime
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Stack Tecnologico & Runtime

Il server è basato su architettura **Minecraft Dedicated Server 26.2** con mod loader **Fabric**.

- **Game Engine**: Minecraft Server 26.2 (`server.jar`).
- **Mod Loader**: Fabric Loader (`fabric-server-launch.jar`) + Fabric API (`fabric-api-0.158.0+26.2.jar`).
- **Linguaggi di Supporto**: Java 25 / Kotlin (`fabric-language-kotlin-1.13.13+kotlin.2.4.10.jar`).
- **Runtime Principale**: Microsoft OpenJDK 25 HotSpot (`C:\Program Files\Microsoft\jdk-25.0.4.7-hotspot\bin\java.exe`).
- **Runtime di Fallback**: Microsoft OpenJDK 21 HotSpot (`C:\Program Files\Microsoft\jdk-21.0.12.8-hotspot\bin\java.exe`).

---

## 2. Parametri JVM & Ottimizzazione Garbage Collection

Il server viene avviato tramite lo script `avvia.bat` con parametri di tuning avanzato per minimizzare i picchi di latenza (lag spike) e garantire TPS costanti a 20:

```batch
"%JAVA_BIN%" -Xms4G -Xmx6G -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -jar fabric-server-launch.jar nogui
```

- **Allocazione Memoria**: 4 GB iniziale (`-Xms4G`), 6 GB massima (`-Xmx6G`).
- **Garbage Collector**: G1GC con pausa target massima a 200 ms (`-XX:MaxGCPauseMillis=200`).
- **Mod Server-Side di Ottimizzazione TPS e RAM**:
  - **Lithium** (`lithium-fabric-0.25.3+mc26.2.jar`): Ottimizza la fisica dei mob, i chunk tick e l'IA senza alterare il comportamento vanilla.
  - **FerriteCore** (`ferritecore-9.0.0-fabric.jar`): Riduce drasticamente l'impronta di memoria dei blocchi e dei modelli.

---

## 3. Rete, Tunneling P2P & Connessione Ospiti (`e4mc`)

Per consentire la connessione di Sebastian o amici da reti esterne senza necessità di aprire porte sul router di casa (port forwarding):

- **Mod `e4mc` (Fabric)**: All'avvio del server genera un tunnel P2P crittografato e associa un dominio dinamico sicuro (es. `*.e4mc.link`).
- **Script di Estrazione Link (`leggi_codice_e4mc.ps1` / `leggi_codice_e4mc.bat`)**:
  - Legge istantaneamente il log `logs\latest.log`.
  - Estrae il dominio pubblico assegnato da e4mc.
  - Lo copia automaticamente negli appunti di Windows (`Set-Clipboard`), pronto per essere incollato o letto con NVDA.

---

## 4. Matrice dei Prerequisiti & Pre-Flight Check

### Prerequisiti Hard (Indispensabili per l'avvio)
1. Eseguibile Java 25 o 21 a 64 bit (`java.exe`).
2. Presenza di `fabric-server-launch.jar` e `server.jar`.
3. Almeno 6 GB di RAM fisica libera sul sistema `NEMEXMASTER`.
4. File `eula.txt` con `eula=true`.

### Prerequisiti Soft (Funzionali)
1. Connessione internet attiva per il tunnel e4mc.
2. PowerShell abilitato per l'esecuzione di `leggi_codice_e4mc.ps1`.

### Script di Pre-Flight Check Rapido (PowerShell)
```powershell
# Esegui dalla radice del repository:
$java25 = "C:\Program Files\Microsoft\jdk-25.0.4.7-hotspot\bin\java.exe"
$java21 = "C:\Program Files\Microsoft\jdk-21.0.12.8-hotspot\bin\java.exe"
if (Test-Path $java25) { Write-Host "Java 25: OK" -ForegroundColor Green }
elseif (Test-Path $java21) { Write-Host "Java 21 (Fallback): OK" -ForegroundColor Yellow }
else { Write-Host "ERRORE: Nessun JDK Microsoft trovato!" -ForegroundColor Red }

if (Test-Path "fabric-server-launch.jar") { Write-Host "Fabric JAR: OK" -ForegroundColor Green }
if (Test-Path "eula.txt") { Write-Host "EULA: OK" -ForegroundColor Green }
```

# 01 â€” Infrastruttura Runtime, Configurazione e Rete Ibrida (LAN / WAN)

## 1. Runtime Java 25 & Parametri JVM di Avvio

Il server Minecraft opera su ambiente **Fabric Loader 0.19.3** per Minecraft **26.2**, alimentato dal runtime **Microsoft OpenJDK 25 LTS** a 64-bit.

### Script di Avvio (`avvia.bat`):
```batch
set "JAVA_BIN=C:\Program Files\Microsoft\jdk-25.0.4.7-hotspot\bin\java.exe"
"%JAVA_BIN%" -Xms4G -Xmx6G -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -jar fabric-server-launch.jar nogui
```

### Parametri Chiave:
- **`-Xms4G -Xmx6G`**: Allocazione dinamica di memoria RAM (4 GB iniziali, 6 GB massimo), ideale per gestire 2 giocatori simultanei e il retrogen dei chunk.
- **`-Djavax.net.ssl.trustStoreType=WINDOWS-ROOT`**: Utilizzo del gestore certificati Windows per validare i certificati SSL di Fabric, Mojang ed e4mc senza errori PKIX.
- **`-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200`**: Garbage Collector a bassa latenza per evitare picchi di lag sui tick del server.

---

## 2. AgnosticitÃ  di Rete Multi-Host (Salotto di Luca <-> Casa di Sebastian)

Il server Ã¨ progettato per essere **itinerante e multi-host**: puÃ² essere avviato indifferentemente sul computer del Salotto di Luca o sul PC di Sebastian.

- **Regola di Bind `0.0.0.0`**: Nel file `server.properties`, il parametro `server-ip=` deve rimanere **sempre vuoto**. In questo modo il server si aggancia a tutte le interfacce di rete disponibili della macchina host su porta standard `25565`.

---

## 3. ModalitÃ  Duale di Connessione

### A. ModalitÃ  LAN Locale (Stessa Casa)
Quando Luca e Sebastian giocano fisicamente insieme nella stessa abitazione:
- **Host**: Chi esegue `avvia.bat` gioca connettendosi a `localhost:25565`.
- **Client**: L'altro giocatore si connette all'indirizzo IP locale assegnato dal router (es. `192.168.1.201:25565`).

### B. ModalitÃ  WAN Remota (Ognuno a Casa Propria)
Quando Luca e Sebastian giocano a distanza da case diverse:
1. **Tunnel P2P Diretto (`e4mc`)**:
   - All'avvio del server, il modulo `e4mc` genera un tunnel crittografato e un dominio pubblico univoco (es. `xxx-yyy.eu.e4mc.link:25565`).
   - L'amministratore che avvia il server esegue lo script `leggi_codice_e4mc.ps1` per copiare il link direttamente negli appunti e inviarlo all'altro.
   - Chi riceve il link lo incolla nei server multigiocatore di PrismLauncher ed entra istantaneamente.
   - **Vantaggi**: Zero configurazione del router, nessuna porta da aprire, 100% accessibile e sicuro.
2. **Rete Mesh Privata (Tailscale / ZeroTier)** *(Alternativa con IP Fisso)*:
   - Permette di creare una LAN virtuale diretta punto-a-punto tra i due computer con un IP virtuale fisso (es. `100.x.y.z:25565`), senza dover scambiare link ad ogni sessione.

---

## 4. Configurazione Master `server.properties`

I parametri cardine concordati per la Tenuta:
```properties
motd=Server Minecraft 26.2 Fabric - Tenuta di Luca e Sebastian
difficulty=normal
gamemode=survival
pvp=true
allow-flight=true
online-mode=false
max-players=10
spawn-protection=0
view-distance=10
simulation-distance=8
sync-chunk-writes=true
region-file-compression=deflate
```
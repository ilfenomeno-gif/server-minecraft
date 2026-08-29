# Scheda di Governance 04: Struttura Progetto & Gestione Dati
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Mappa Gerarchica delle Cartelle

Il repository `server-minecraft` è organizzato secondo la seguente gerarchia logica:

- **Radice (`/`)**:
  - `avvia.bat`: Script principale di avvio del server con allocazione RAM e GC tuning.
  - `aggiorna_mappa.bat`: Script di upgrade forzato dei chunk (`--forceUpgrade --eraseCache`).
  - `leggi_codice_e4mc.bat` & `leggi_codice_e4mc.ps1`: Strumenti per copiare l'IP dinamico e4mc.
  - `fabric-server-launch.jar` & `server.jar`: Eseguibili del runtime server Fabric.
  - `server.properties`, `ops.json`, `whitelist.json`, `eula.txt`: File di configurazione vanilla del server.
  - `GEMINI.md`: Hub master di contesto e regole di governance.
  - `README.md`: Guida rapida e panoramica del server.

- **`mods/`**: Contiene tutti i file JAR delle mod caricate dal Fabric Loader.
- **`config/`**: Configurazioni specifiche di ciascuna mod (TOML, JSON, JSON5, Mixin properties).
- **`world/`**: Dati attivi del mondo di gioco:
  - `region/*.mca`: File Anvil contenenti i blocchi dei chunk dell'Overworld.
  - `DIM-1/` e `DIM1/`: Dati del Nether e dell'End.
  - `level.dat`, `data/`, `playerdata/`: Dati del mondo, scoreboard e inventari giocatori.
- **`world_backup/`**: Copie storiche e istantanee di sicurezza del mondo prima di conversioni o retrogen.
- **`docs/`**: Documentazione tecnica strutturata:
  - `docs/piani/attivi/`: Piani tecnici in fase di progettazione o collaudo.
  - `docs/piani/completati/`: Piani completati con successo e archiviati.
  - `docs/strategie/`: Analisi strategiche (es. conversione mappa Earth 1:1500).
  - `docs/report/`: Audit, benchmark e test di carico.
  - `docs/idee/`: Scalette e spunti implementativi futuri.
  - `docs/manuali/`: Guide in-game e protocolli operativi.
- **`knowledge/`**: Base di conoscenza modulare continua (`00_` .. `09_`).
- **`logs/` & `crash-reports/`**: Log di sessione (`latest.log`) e tracciati di crash.

---

## 2. Protocollo di Sicurezza Dati e Backup

1. **Prima di qualsiasi operazione su `world/`** (conversione chunk con `aggiorna_mappa.bat` o importazione nuove mappe):
   - Creare sempre una copia compressa o cartella di backup in `world_backup/`.
2. **Isolamento dei Dati Personali**:
   - I file di cache utente e whitelist (`whitelist.json`, `ops.json`) non devono contenere dati sensibili non tracciati.
3. **Gestione File `.gitignore`**:
   - File di log temporanei, sessioni e lockfile di Fabric non devono essere tracciati.

---

## 3. Matrice di Routing Multi-Macchina & Topologia

L'ambiente di sviluppo e gestione del server opera su una topologia multi-dispositivo:

1. **Postazione Desktop Principale (`NEMEXMASTER`)**:
   - Hostname: `NEMEXMASTER` (`$env:COMPUTERNAME`).
   - Percorso: `C:\Users\nemex\OneDrive\Documenti\GitHub\server-minecraft`.
   - Ruolo: Esecuzione server a pieno carico (6 GB RAM), elaborazioni pesanti DFU e retrogen.
2. **Postazione Portatile (Laptop Sala da Pranzo)**:
   - Hostname dinamico sincronizzato tramite OneDrive / GitHub.
   - Ruolo: Sviluppo remoto, consultazione documentazione, modifiche configurazioni e sessioni di gioco.
3. **Resilienza Percorsi & Portabilità**:
   - Tutti gli script batch e PowerShell utilizzano percorsi relativi dinamici (`%~dp0`, `$PSScriptRoot`, `./`) per garantire l'esecuzione trasparente su entrambe le postazioni.
   - Rilevamento automatico della Java Virtual Machine (`JAVA_BIN`) che verifica prima `Program Files\Microsoft\jdk-25*` e `jdk-21*`, con fallback su `java` di sistema.

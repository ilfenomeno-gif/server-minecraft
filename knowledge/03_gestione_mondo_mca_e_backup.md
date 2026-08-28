# 03 â€” Gestione Mondo, Formato MCA, Retrogen & Backup Mappe

## 1. Struttura e Anatomia della Cartella `world/`

La cartella `world/` custodisce la totalitÃ  dei dati della Tenuta e della mappa esplorata:
- **`level.dat` / `level.dat_old`**: Parametri del mondo, coordinate di spawn, tempo atmosferico e versione dati.
- **`dimensions/minecraft/overworld/`**:
  - `region/*.mca`: File regionali contenenti la geometria dei blocchi (32 x 32 chunk per file).
  - `poi/*.mca`: Punti di interesse (letti, villici, stazioni di lavoro, portali).
  - `entities/*.mca`: Animali, mob, armature e veicoli.
- **`dimensions/minecraft/the_nether/` & `the_end/`**: Dimensioni del Nether e dell'End.
- **`playerdata/*.dat`**: Inventario, livelli esperienza, salute e coordinate dei giocatori (identificati tramite UUID offline).

---

## 2. Politica di Backup Selettiva (Solo Mappe)

PoichÃ© il codice sorgente, le mod, gli script e i file di configurazione sono tracciati e al sicuro su **GitHub**, la strategia di backup Ã¨ focalizzata **esclusivamente sui dati delle mappe**:

1. **Snapshot Pre-Manutenzione (`world_backup/`)**:
   - Prima di qualsiasi operazione critica (aggiornamento mod di blocchi, conversione forzata `--forceUpgrade`, pulizia chunk o retrogen), generare una copia compressa della cartella `world/` in `world_backup/`:
     ```powershell
     # Esempio snapshot rapido con timestamp
     $ts = Get-Date -Format "yyyy-MM-dd_HH-mm"
     Compress-Archive -Path "world" -DestinationPath "world_backup\world_snapshot_$ts.zip"
     ```
2. **Archivio Storico Mappe**:
   - Gli archivi delle mappe storiche e delle conversioni risiedono nella cartella operativa:
     `C:\Users\nemex\OneDrive\progetti dei frati\accessible games\minecraft\mappa originale del server vecchio\`

---

## 3. Protocollo di Sincronizzazione Mappe tra i Due Host

Quando la sessione di gioco si trasferisce dal PC del Salotto di Luca al PC di casa di Sebastian (o viceversa):
1. **Chiusura Pulita**: Arrestare il server con il comando `/stop` per forzare il flush su disco di tutti i chunk (`sync-chunk-writes=true`).
2. **Compressione & Trasferimento**: Comprimere la cartella `world/` ed esportarla tramite OneDrive / cloud condiviso.
3. **Importazione**: Estrarre il file `.zip` nella cartella `server-minecraft/world` del computer di destinazione prima di lanciare `avvia.bat`.

---

## 4. Script di Aggiornamento Chunk (`aggiorna_mappa.bat`)

Per convertire o ricostruire le tabelle dati dei chunk pre-generati secondo il DataFixerUpper di Minecraft 26.2:
```batch
"%JAVA_BIN%" -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -jar fabric-server-launch.jar --forceUpgrade --eraseCache nogui
```
- `--forceUpgrade`: Converte tutti i chunk all'ultimo schema NBT.
- `--eraseCache`: Ricostruisce le cache di luce e biomi per prevenire artefatti grafici o ombre corrotte.
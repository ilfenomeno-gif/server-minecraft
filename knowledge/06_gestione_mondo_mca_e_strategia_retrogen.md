# Scheda di Governance 06: Gestione Mondo MCA & Strategia Retrogen
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Architettura dei File di Mondo Anvil (`.mca`)

Il mondo di gioco è archiviato all'interno della cartella `world/`:
- **Cartella `region/`**: Contiene file di regione in formato Anvil (`r.X.Z.mca`). Ciascun file `.mca` racchiude una griglia di $32 \times 32 = 1024$ chunk.
- **Chunk Status**: Nelle mappe pre-generate (es. Earth 1:1500), i chunk sono contrassegnati con `Status: "full"`, impedendo al generatore vanilla di applicare le decorazioni delle nuove mod introdotte successivamente.

---

## 2. Procedura di Upgrade & Conversione Mappe 26.2

Quando viene importata una nuova mappa (es. Earth 1:1500) o dopo cambi di versione del motore di gioco:

1. **Backup Preventivo**: Creare una copia completa di `world/` in `world_backup/world_[DATA]`.
2. **Esecuzione di `aggiorna_mappa.bat`**:
   - Esegue il DataFixerUpper (DFU) nativo di Minecraft:
     ```batch
     "%JAVA_BIN%" -Djavax.net.ssl.trustStoreType=WINDOWS-ROOT -jar fabric-server-launch.jar --forceUpgrade --eraseCache nogui
     ```
   - Allinea tutti i chunk alla `DataVersion` di Minecraft 26.2.
   - Pulisce le cache di illuminazione e altezza corrotte.

---

## 3. Modulo Custom Server Retrogen (`server-retrogen-1.1.2.jar`)

Per risolvere il problema dell'assenza di risorse mod (colture di *Farmer's Delight*, sabbie e palme di *Ecologics*, minerali moddati) nelle mappe pre-generate:

- **File di Configurazione**: `config/server_retrogen.json`.
- **Meccanismo di Iniezione**: Intercetta il caricamento dei chunk e inietta proceduralmente le entità e i blocchi mancanti in base al bioma di appartenenza.
- **Comando di Teletrasporto & Ricerca Risorse**:
  - `/serverretrogen tp <risorsa>`: Calcola le coordinate del punto di spawn valido più vicino e teletrasporta il giocatore (Luca o Sebastian) sul bioma target, eliminando lunghe camminate nel vuoto su mappe in scala reale.

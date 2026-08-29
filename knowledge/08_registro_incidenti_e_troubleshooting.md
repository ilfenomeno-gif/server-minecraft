# Scheda di Governance 08: Registro Incidenti & Troubleshooting
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Protocollo di Diagnostica Rapida

In caso di mancato avvio o crash del server, seguire questa sequenza lineare:

1. **Esaminare `logs/latest.log`**:
   - Cercare le linee marcate con `[FATAL]` o `[ERROR]`.
2. **Ispezionare `crash-reports/`**:
   - Aprire il report generato con data e ora più recenti (`crash-YYYY-MM-DD_HH.MM.SS-server.txt`).
3. **Verificare `fabricloader.log`**:
   - Identifica incompatibilità tra mod o mixin falliti prima dell'avvio del motore di gioco.

---

## 2. Casistiche Note & Soluzioni

### A. Crash da Conflitto Mixin / Incompatibilità Versione Mod
- **Sintomo**: `MixinApplyError` o `ClassNotFoundException` all'avvio.
- **Causa**: Una mod non è compilata per Minecraft 26.2 o va in conflitto con `Lithium` / `FerriteCore`.
- **Risoluzione**:
  1. Rimuovere temporaneamente la mod sospetta da `mods/`.
  2. Riavviare con `avvia.bat` per isolare il componente difettoso.
  3. Cercare una build compatibile aggiornata o disattivare il mixin specifico nel file di config.

### B. Tunnel e4mc Non Assegnato
- **Sintomo**: `leggi_codice_e4mc.bat` segnala *"Nessun dominio e4mc trovato"*.
- **Causa**: Mancanza di connessione a internet al momento del bootstrap o blocco firewall in uscita.
- **Risoluzione**:
  1. Verificare la connessione internet su `NEMEXMASTER`.
  2. Verificare in `logs/latest.log` la presenza di `[e4mc] Initializing...`.
  3. Riavviare il server.

### C. Chunk Corrotti o Blocchi Non Riconosciuti
- **Sintomo**: Il server crasha quando un giocatore entra in una specifica area del mondo.
- **Causa**: Disallineamento `DataVersion` dei file `.mca` o rimozione di una mod che ha lasciato blocchi fantasma.
- **Risoluzione**:
  1. Eseguire `aggiorna_mappa.bat` per forzare la scansione DFU con `--forceUpgrade --eraseCache`.
  2. Se persiste, ripristinare il file `.mca` interessato dal backup in `world_backup/`.

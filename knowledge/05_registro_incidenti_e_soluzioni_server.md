# 05 â€” Registro Incidenti & Soluzioni Tecniche del Server

Questo registro documenta i problemi tecnici, le anomalie di rete, i conflitti di mod e le soluzioni adottate nel tempo per il server di Luca e Sebastian.

---

### Record 01 â€” Codifica Tassativa `UTF-8 No-BOM` per JSON e Properties
- **Problema**: All'avvio del server o del client, le configurazioni o le opzioni venivano resettate o scartate con errori di lettura e `NumberFormatException`.
- **Causa Radice**: I comandi PowerShell `Set-Content -Encoding UTF8` inseriscono i 3 byte di intestazione Unicode BOM (`0xEF 0xBB 0xBF`). Il parser di Minecraft non riconosce l'intestazione all'inizio della prima riga.
- **Soluzione Definitiva**: Tutti i file `.json`, `.properties` e `.cfg` devono essere scritti tramite `[System.IO.File]::WriteAllLines(..., New-Object System.Text.UTF8Encoding($false))` o script con codifica No-BOM garantita.

---

### Record 02 â€” Retrogen Idempotente per Risorse Mod su Mappe Custom Pre-generate
- **Problema**: Nelle mappe custom (es. mappa della Terra 1:1500 con 1.180.000 chunk pre-generati), le colture selvatiche di Farmer's Delight e le piante di Ecologics non apparivano naturalmente nel mondo.
- **Causa Radice**: Il motore di Minecraft salta la fase di decorazione del terreno sui chunk con status `full`.
- **Soluzione Definitiva**: Implementazione della mod server `server-retrogen-1.1.2.jar`, che intercetta l'evento `ServerChunkEvents.CHUNK_LOAD`, verifica tramite tag NBT che il chunk non sia mai stato arricchito, e popola dinamicamente le colture corrette in base al bioma con costo CPU trascurabile.

---

### Record 03 â€” Connessione Remota Trasparente via Tunnel `e4mc` Senza Port-Forwarding
- **Problema**: ImpossibilitÃ  di giocare a distanza quando Luca e Sebastian si trovano nelle rispettive abitazioni senza dover riconfigurare porte TCP/UDP sui modem/router domestici.
- **Causa Radice**: Presenza di router con IP dinamici o CGNAT che impediscono connessioni dirette in ingresso.
- **Soluzione Definitiva**: Predisposto il modulo `e4mc` e lo script di automazione `leggi_codice_e4mc.ps1`. All'avvio del server, lo script cattura automaticamente il dominio pubblico temporaneo e lo deposita negli appunti di sistema, pronto per essere incollato.

---

### Record 04 â€” StabilitÃ  Tick Rate a 20 TPS con `Lithium` e `FerriteCore`
- **Problema**: Rallentamenti del tempo di gioco (tick lag / *"Can't keep up!"*) durante l'esplorazione rapida del mondo o il caricamento di grandi quantitÃ  di entitÃ .
- **Causa Radice**: Calcoli fisici ridondanti e overhead di allocazione memoria sui chunk del server vanilla.
- **Soluzione Definitiva**: Inclusione simultanea di `lithium-fabric` (ottimizzazione fisica e chunk) e `ferritecore` (riduzione footprint RAM), abbinati ai parametri JVM Garbage Collector G1 (`MaxGCPauseMillis=200`).
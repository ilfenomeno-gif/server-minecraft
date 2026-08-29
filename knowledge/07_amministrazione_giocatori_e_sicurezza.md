# Scheda di Governance 07: Amministrazione Giocatori & Sicurezza
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Gestione Whitelist & Accessi al Server

Per garantire un ambiente di gioco protetto e riservato a Luca, Sebastian e amici autorizzati:

- **Attivazione Whitelist**: `server.properties` -> `white-list=true`.
- **File di Riferimento**: `whitelist.json`.
- **Comandi Console / In-Game**:
  - `whitelist add <nickname>`: Aggiunge un giocatore alla lista autorizzata.
  - `whitelist remove <nickname>`: Rimuove un giocatore.
  - `whitelist reload`: Ricarica le modifiche al file senza riavviare il server.
  - `whitelist list`: Elenca tutti i giocatori abilitati.

---

## 2. Gestione Ruoli & Privilegi Operatore (OP)

- **File di Riferimento**: `ops.json`.
- **Livelli di Permesso**:
  - **Luca & Sebastian (Livello 4 - Amministratore Totale)**: Pieno accesso a tutti i comandi (`/gamemode`, `/tp`, `/whitelist`, `/serverretrogen`, `/stop`).
- **Comando di Assegnazione**:
  - Dalla console server: `op <nickname>`.

---

## 3. Parametri Chiave di Sicurezza (`server.properties`)

- `online-mode=true`: Verifica dell'autenticazione degli account ufficiali Mojang/Microsoft.
- `enforce-whitelist=true`: Disconnette all'istante i giocatori non presenti in whitelist.
- `pvp=false` (o concordato): Previene il fuoco amico accidentale.
- `difficulty=normal` / `difficulty=easy`: Difficoltà equilibrata.
- `view-distance=10` e `simulation-distance=8`: Ottimizzazione per ridurre il consumo di CPU e banda.

---

## 4. Flusso di Connessione per Ospiti via Tunnel `e4mc`

1. Avviare il server con `avvia.bat`.
2. Eseguire `leggi_codice_e4mc.bat`.
3. Il dominio (es. `xxx-yyy.e4mc.link`) viene automaticamente copiato negli appunti.
4. Fornire l'indirizzo all'amico abilitato in whitelist, che lo incollerà in Minecraft -> *Multiplayer* -> *Direct Connection*.

# 04 â€” Co-ProprietÃ , Amministrazione Giocatori & Sicurezza

## 1. Principio di Co-Amministrazione Paritaria (Luca & Sebastian)

Il server della Tenuta Ã¨ un progetto cooperativo condiviso. Entrambi i proprietari detengono i privilegi di **Operatore di Livello 4**:
- Accesso completo a tutti i comandi di gioco (`/teleport`, `/gamemode`, `/give`, `/time`, `/weather`).
- CapacitÃ  di gestire le regole di protezione e la costruzione di strutture comuni.

---

## 2. Configurazione `ops.json` e Mappatura UUID Offline

PoichÃ© il server opera in modalitÃ  `online-mode=false` (per consentire l'accesso flessibile sia via LAN che da remoto), gli identificatori utente (UUID) vengono calcolati deterministicamente in base al nome utente in minuscolo:

```json
[
  {
    "uuid": "7ea02228-4993-48d0-b3cd-46524e7949d0",
    "name": "Wolfsang",
    "level": 4,
    "bypassesPlayerLimit": false
  },
  {
    "uuid": "e48e6275-dac3-40de-8d53-17ec4b51515e",
    "name": "sebIIIdiaragona",
    "level": 4,
    "bypassesPlayerLimit": false
  },
  {
    "uuid": "66e1d5e2-6642-3784-b8bf-fec3e82438a9",
    "name": "Nemex",
    "level": 4,
    "bypassesPlayerLimit": false
  },
  {
    "uuid": "6552bb1b-80a3-4b29-a689-7a79ab1c2ebd",
    "name": "Nemex",
    "level": 4,
    "bypassesPlayerLimit": false
  },
  {
    "uuid": "aaf3f945-a382-39d3-bb39-1c8cb36a9540",
    "name": "wolfsang",
    "level": 4,
    "bypassesPlayerLimit": false
  }
]
```

---

## 3. Gestione di `usercache.json` & Persistenza Inventari

- Il file `usercache.json` associa il nickname del giocatore all'UUID offline.
- I salvataggi individuali di inventario, posizione e statistiche risiedono in:
  - `world/playerdata/<UUID>.dat`
  - `world/stats/<UUID>.json`
  - `world/advancements/<UUID>.json`
- **Regola di Sicurezza**: Non rinominare mai i file `.dat` a server acceso. Se un giocatore cambia nickname sul launcher offline, aggiornare contestualmente il file `usercache.json`.

---

## 4. Regole di Protezione e Gameplay Concordate

1. **`allow-flight=true`**: Fondamentale per evitare che il server disconnetta ingiustamente i giocatori per falso allarme di "volo" durante l'uso di zaini, salti assistiti o manovre di navigazione accessibile.
2. **`spawn-protection=0`**: Consente a entrambi i giocatori di costruire e posizionare blocchi liberamente fin dal punto esatto di spawn iniziale.
3. **`pvp=true`**: Combattimento attivo abilitato per sfide concordate, nel rispetto reciproco delle basi e degli animali addomesticati.
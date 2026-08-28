# Piano Tecnico Implementativo: Retrogen Dinamico & Spawner Risorse Mod per Mappe Custom

**Documento**: Specifiche Tecniche e Architettura di Sviluppo  
**Data**: 27 Agosto 2026  
**Autore**: Antigravity (Pair Programmer) & Luca  
**Repository Server**: server-minecraft (C:\Users\nemex\OneDrive\Documenti\GitHub\server-minecraft)  
**Target Runtime**: Minecraft 26.2 (Fabric Loader 0.19.3, Java 25 Microsoft LTS)

---

## 1. Obiettivi e Visione Architetturale

Nelle mappe custom e pre-generate (come la mappa della Terra 1:1500, estesa su 1.152 file .mca e oltre 1.180.000 chunk marcati con Status: full), il motore di gioco salta la fase di decorazione del terreno (*placed features* e *world generation*). Di conseguenza, tutti gli elementi introdotti dalle mod (come le colture selvatiche di *Farmer's Delight*, la flora e le conchiglie di *Ecologics*, o eventuali nuovi minerali) non appaiono naturalmente nel paesaggio.

L'obiettivo del presente progetto e' realizzare una **mod server Fabric leggera e data-driven** (server-retrogen-26.2) che:
1. **Intercetta il caricamento dei chunk** al passaggio dei giocatori (ServerChunkEvents.CHUNK_LOAD).
2. **Verifica l'idempotenza**: controlla se il chunk e' gia' stato arricchito (tramite un tag persistente).
3. **Scansiona velocemente la superficie** (utilizzando le heightmap di movimento e luce senza iterare tutti i blocchi verticali).
4. **Posiziona le risorse corrette** in base al bioma reale registrato nel chunk (ad es. pomodori in savana, riso nei fiumi/paludi, cavoli lungo le spiagge).
5. **Garantisce scalabilita' e sicurezza**: zero lag di tick del server, zero impatto sui 13.1 GB di dati non ancora esplorati, e compatibilita' assoluta con qualsiasi mappa custom futura.

---

## 2. Architettura del Modulo (server-retrogen)

`
                                  FLUSSO DI RETROGEN DINAMICO
                                               │
                        ┌──────────────────────▼──────────────────────┐
                        │   ServerChunkEvents.CHUNK_LOAD              │
                        │   (Giocatore si avvicina al Chunk X, Z)     │
                        └──────────────────────┬──────────────────────┘
                                               │
                                ┌──────────────▼──────────────┐
                                │ Il Chunk e' gia' processato?│
                                └──────┬───────────────┬──────┘
                                       │ SI            │ NO
                       ┌───────────────┘               └──────────────┐
                       ▼                                              ▼
               [Nessuna Azione]                        ┌──────────────────────────────┐
                                                       │ Leggi Bioma e Heightmap      │
                                                       │ Esegui N Tentativi Pesati    │
                                                       └──────────────┬───────────────┘
                                                                      │
                                                       ┌──────────────▼──────────────┐
                                                       │ Verifica Blocco di Supporto  │
                                                       │ e Aria a Quota Y+1           │
                                                       └──────────────┬───────────────┘
                                                                      │
                                                       ┌──────────────▼──────────────┐
                                                       │ Posiziona Blocco Mod         │
                                                       │ Marca Chunk come Processato  │
                                                       └──────────────────────────────┘
`

---

## 3. Specifiche Tecniche dei Componenti

### 3.1 Lifecycle & Intercettazione Eventi
- **Hook Principale**: 
et.fabricmc.fabric.api.event.lifecycle.v1.ServerChunkEvents.CHUNK_LOAD
- **Ambiente di Esecuzione**: Esclusivamente **Server-Side** (nessun requisito di installazione sui client dei giocatori Luca o Sebastian).
- **Controllo Dimensione**: Il retrogen operera' primariamente sulla dimensione minecraft:overworld (con supporto estendibile a Nether ed End da configurazione).

### 3.2 Persistenza e Idempotenza
Per garantire che un chunk non riceva generazioni multiple in caso di ricaricamento:
- **Metodo Primario**: Salvataggio di un flag compatto nel ChunkData del chunk (NbtCompound -> server_retrogen:populated = 1b).
- **Metodo Secondario (Fallback Memory/Disk)**: Struttura SavedData / PersistentState del mondo per tenere traccia delle regioni gia' validate.

### 3.3 Algoritmo di Scansione della Superficie (High Performance)
Per evitare rallentamenti (budget CPU < 1 ms per chunk):
1. **Coordinate X, Z**: Selezione di un numero configurabile di coordinate casuali nel chunk (es. 4-8 punti di test per chunk).
2. **Calcolo Y tramite Heightmap**:
   int surfaceY = chunk.getHeight(Heightmap.Type.MOTION_BLOCKING_NO_LEAVES, localX, localZ);
   BlockPos targetPos = chunk.getPos().getBlockPos(localX, surfaceY, localZ);
3. **Validazione delle Condizioni di Posa**:
   - Il blocco a quota surfaceY deve essere un blocco solido idoneo (es. minecraft:grass_block, minecraft:sand, minecraft:dirt).
   - Il blocco a quota surfaceY + 1 deve essere minecraft:air o minecraft:short_grass.
   - Per le piante acquatiche (es. riso selvatico): il blocco a surfaceY deve essere minecraft:water profondo 1 blocco con fondale di terra/fango.

---

## 4. Matrice di Distribuzione Biomi -> Risorse Mod

Di seguito la mappatura predefinita calibrata per le mod attualmente installate sul server:

| Mod | Blocco da Spawnare | Biomi di Destinazione | Blocco Supporto Richiesto | Probabilita' per Chunk |
|---|---|---|---|:---:|
| **Farmer's Delight** | armersdelight:wild_tomatoes | savanna, savanna_plateau, windswept_savanna, adlands | grass_block, dirt, ed_sand | 3% |
| **Farmer's Delight** | armersdelight:wild_cabbages | each, stony_shore | sand, dirt, grass_block | 5% |
| **Farmer's Delight** | armersdelight:wild_onions | plains, meadow, sunflower_plains, orest | grass_block, dirt | 4% |
| **Farmer's Delight** | armersdelight:wild_carrots | plains, meadow, lower_forest | grass_block, dirt | 3% |
| **Farmer's Delight** | armersdelight:wild_potatoes | 	aiga, snowy_taiga, old_growth_pine_taiga | grass_block, podzol, dirt | 3% |
| **Farmer's Delight** | armersdelight:wild_beetroots | each, orest, irch_forest | grass_block, sand, dirt | 3% |
| **Farmer's Delight** | armersdelight:wild_rice | swamp, mangrove_swamp, iver | dirt/mud sommerso in 1 blocco di water | 4% |
| **Ecologics** | ecologics:seashell | each | sand (superficie asciutta o battigia) | 6% |
| **Ecologics** | ecologics:coconut_seedling | each | sand, grass_block | 2% |
| **Ecologics** | ecologics:walnut_sapling | orest, dark_forest, old_growth_birch_forest | grass_block, dirt | 2% |

---

## 5. Struttura del File di Configurazione Data-Driven (config/server_retrogen.json)

Per consentire l'aggiunta futura di qualsiasi altra mod (es. nuovi minerali, flora di *Naturalist*, mod tecnologiche o magiche) senza ricompilare il JAR, la mod leggera' un file di configurazione JSON:

`json
{
  "enabled": true,
  "debug_logging": false,
  "attempts_per_chunk": 6,
  "rules": [
    {
      "id": "farmersdelight_wild_tomatoes",
      "block": "farmersdelight:wild_tomatoes",
      "chance_percentage": 3.0,
      "biomes": [
        "minecraft:savanna",
        "minecraft:savanna_plateau",
        "minecraft:windswept_savanna"
      ],
      "valid_ground": [
        "minecraft:grass_block",
        "minecraft:dirt"
      ],
      "requires_water_layer": false
    },
    {
      "id": "farmersdelight_wild_rice",
      "block": "farmersdelight:wild_rice",
      "chance_percentage": 4.0,
      "biomes": [
        "minecraft:swamp",
        "minecraft:mangrove_swamp",
        "minecraft:river"
      ],
      "valid_ground": [
        "minecraft:dirt",
        "minecraft:clay",
        "minecraft:mud"
      ],
      "requires_water_layer": true
    }
  ]
}
`

---

## 6. Piano di Sviluppo & Collaudo (Roadmap)

1. **Step 1: Setup Progetto Mod Fabric (Java 25 / Architectury Loom)**:
   - Configurazione workspace dedicato per compilare il file server-retrogen-1.0.0.jar.
2. **Step 2: Implementazione Core Engine**:
   - Gestore eventi ServerChunkEvents.
   - Modulo di scansione SurfaceHeightmapScanner.
   - Parser del file server_retrogen.json.
3. **Step 3: Test di Benchmark su Chunk Isolato**:
   - Verifica dei tempi di esecuzione (< 1 ms per chunk caricato).
   - Verifica di non duplicazione (ricarico dello stesso chunk mantenendo intatte le colture posizionate).
4. **Step 4: Integrazione nel Server di Produzione**:
   - Inserimento del JAR in C:\Users\nemex\OneDrive\Documenti\GitHub\server-minecraft\mods\.
   - Verifica in-game durante l'esplorazione da parte di Luca e Sebastian.

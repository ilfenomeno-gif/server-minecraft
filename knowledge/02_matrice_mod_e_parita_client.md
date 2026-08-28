# 02 â€” Matrice Mod & Sincronizzazione di ParitÃ  Client-Server

## 1. La Regola Aurea di ParitÃ  Mod

Per garantire che nÃ© Luca nÃ© Sebastian riscontrino desincronizzazioni, blocchi fantasma o errori di connessione (*"Incompatible mod set"*), **tutte le mod di contenuto devono avere la versione rigorosamente identica** sia sul server che nei rispettivi client di gioco (istanza PrismLauncher `Minecraft 26.2 Access - Server Tenuta`).

---

## 2. Catalogo Completo delle Mod Installate (23 Mod)

| Mod / File JAR | Categoria | Ruolo e FunzionalitÃ  | Sincronizzata col Client? |
|---|---|---|---|
| **`FarmersDelight-26.2-3.6.17+refabricated.jar`** | Contenuto | Colture avanzate, ricette, pentole, tagliere, coltelli | **SÃŒ** (Tassativo) |
| **`cookingforblockheads-fabric-26.2-26.2.0.3.jar`** | Contenuto | Cucina componibile (frigorifero, lavello, piano cottura) | **SÃŒ** (Tassativo) |
| **`mcw-bridges-3.1.2-mc26.2fabric.jar`** | Contenuto | Ponti in legno, pietra e corda | **SÃŒ** (Tassativo) |
| **`mcw-doors-1.1.5-mc26.2fabric.jar`** | Contenuto | Porte decorative e botole | **SÃŒ** (Tassativo) |
| **`mcw-fences-1.2.1-mc26.2fabric.jar`** | Contenuto | Recinzioni moderne e muretti | **SÃŒ** (Tassativo) |
| **`mcw-furniture-3.4.2-mc26.2fabric.jar`** | Contenuto | Mobili, tavoli, sedie, banconi | **SÃŒ** (Tassativo) |
| **`mcw-windows-2.4.2-mc26.2fabric.jar`** | Contenuto | Finestre, persiane e vetrate | **SÃŒ** (Tassativo) |
| **`Ecologics-NeoFab-26.2-2.6.0.jar`** | Contenuto | Nuovi animali (pinguini, cammelli, granchi), alberi e biomi | **SÃŒ** (Tassativo) |
| **`travelersbackpack-fabric-26.2-11.3.1.jar`** | Contenuto | Zaini espandibili indossabili con serbatoi fluidi | **SÃŒ** (Tassativo) |
| **`FallingTree-26.2-25.jar`** | Gameplay | Abbattimento rapido alberi interi | **SÃŒ** (Tassativo) |
| **`oreharvester-26.2.0-1.6.jar`** | Gameplay | Scavo a catena istantaneo di vene minerali | **SÃŒ** (Tassativo) |
| **`xaeroworldmap-fabric-26.2-1.44.2.jar`** | Mappa | Supporto dati mappa mondo condivisa | **SÃŒ** |
| **`server-retrogen-1.1.2.jar`** | Utility Server | Retrogen dinamico flora mod su chunk pre-generati | **NO** (Esclusiva Server) |
| **`fabric-api-0.158.0+26.2.jar`** | Core / Lib | API nativa Fabric per eventi e registri | **SÃŒ** (Tassativo) |
| **`cloth-config-26.2.155.jar`** | Libreria | Libreria configurazioni per mod | **SÃŒ** |
| **`architectury-fabric-21.0.7.jar`** | Libreria | Ponte di compatibilitÃ  multi-loader | **SÃŒ** |
| **`balm-fabric-26.2-26.2.0.6.jar`** | Libreria | Libreria base per Cooking for Blockheads | **SÃŒ** |
| **`collective-26.2.0-8.39.jar`** | Libreria | Libreria base per Ore Harvester | **SÃŒ** |
| **`fabric-language-kotlin-1.13.13+kotlin.2.4.10.jar`** | Runtime | Runtime Kotlin per mod moderne | **SÃŒ** |
| **`geckolib-fabric-26.2-5.5.3.jar`** | Motore Animazioni | Gestione animazioni entitÃ  e blocchi mod | **SÃŒ** |
| **`ForgeConfigAPIPort-v26.2.1-mc26.2.x-Fabric.jar`** | Libreria | Supporto configurazioni per Traveler's Backpack | **SÃŒ** |
| **`lithium-fabric-0.25.3+mc26.2.jar`** | Ottimizzazione | Ottimizzazione tick fisica, chunk e intelligenza artificiale | **SÃŒ** (Server & Client) |
| **`ferritecore-9.0.0-fabric.jar`** | Ottimizzazione | Riduzione del consumo di memoria RAM | **SÃŒ** (Server & Client) |

---

## 3. Mod Esclusive e Divieti di Installazione

- **`server-retrogen`**: Ãˆ una mod puramente server-side; non Ã¨ richiesta sul client perchÃ© genera blocchi vanilla e blocchi di Farmer's Delight giÃ  noti alle rispettive mod.
- **Cosa NON installare sul server**:
  - Non installare Sodium, Iris o shaderpack (sono mod grafiche esclusive del client).
  - Non installare `minecraft-access` o librerie screen reader (`Tolk.dll`) sul server headless (l'accessibilitÃ  risiede interamente nel client di Luca).
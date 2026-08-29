# Scheda di Governance 05: Matrice Mod & Parità Client-Server
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Architettura della Ripartizione Mod

L'architettura del server garantisce la convivenza trasparente tra mod di contenuto condivise e mod specifiche di interfaccia/accessibilità per i due profili client.

---

## 2. Mod Condivise (Server & Client Obbligatorie)

Queste mod introducono blocchi, oggetti, entità e meccaniche di gioco. Devono essere presenti sia sul server che su tutti i client:

1. **Farmer's Delight Refabricated** (`FarmersDelight-26.2-3.6.17+refabricated.jar`):
   - Cucina, colture agricole, pentole di cottura, coltelli e piatti.
2. **Macaw's Suite**:
   - `mcw-bridges-3.1.2-mc26.2fabric.jar` (Ponti in legno, pietra e ferro).
   - `mcw-doors-1.1.5-mc26.2fabric.jar` (Porte e botole decorate).
   - `mcw-fences-1.2.1-mc26.2fabric.jar` (Recinzioni, cancelli e siepi).
   - `mcw-furniture-3.4.2-mc26.2fabric.jar` (Tavoli, sedie, banconi, armadi).
   - `mcw-windows-2.4.2-mc26.2fabric.jar` (Finestre, persiane e vetri decorati).
3. **Cooking for Blockheads** (`cookingforblockheads-fabric-26.2-26.2.0.3.jar`):
   - Blocco cucina intelligente, frigorifero, forno e ricettario integrato.
4. **FallingTree** (`FallingTree-26.2-25.jar`):
   - Abbattimento immediato di tronchi d'albero con un solo colpo d'ascia.
5. **Ore Harvester** (`oreharvester-26.2.0-1.6.jar`):
   - Scavo concatenato automatico di vene di minerali.
6. **Traveler's Backpack** (`travelersbackpack-fabric-26.2-11.3.1.jar`):
   - Zaini personalizzabili indossabili, capienza estesa, slot liquidi e crafting table.
7. **Ecologics** (`Ecologics-NeoFab-26.2-2.6.0.jar`):
   - Pinguini, cammelli, noci di cocco, granchi, conchiglie e arricchimento biomi.

---

## 3. Mod Esclusive Server (Server-Side Only)

1. **Lithium** (`lithium-fabric-0.25.3+mc26.2.jar`):
   - Ottimizzazione fisica, AI entità e calcolo chunk tick.
2. **FerriteCore** (`ferritecore-9.0.0-fabric.jar`):
   - Compressione memoria per stati di blocco e modelli.
3. **Server Retrogen** (`server-retrogen-1.1.2.jar`):
   - Mod custom per l'iniezione retroattiva di risorse e teletrasporto (`/serverretrogen tp`).
4. **Xaero's World Map (Server Side Support)** (`xaeroworldmap-fabric-26.2-1.44.2.jar`):
   - Supporta la sincronizzazione dei chunk con i client Xaero.

---

## 4. Mod Esclusive per Profilo Client

### Profilo Client Luca (Accessibilità Vocale & 3D Audio)
- **Mod Principale**: `minecraft-access-1.12.0.jar`
- **Funzionalità**:
  - Narrazione vocale con screen reader in tempo reale.
  - Suoni guida 3D per targeting blocchi e percorsi.
  - Lettura a celle degli inventari (casse, zaini, crafting table).
  - *Non installata sul client di Sebastian né sul server.*

### Profilo Client Sebastian (Esperienza Visiva Normovedente)
- **LambDynamicLights**: Luce dinamica delle torce tenute in mano.
- **ToroHealth Damage Indicators**: Barre della vita fluttuanti sopra i mob e numeri di danno.
- **Xaero's World Map / Minimap**: Mappa 2D e minimappa grafica sullo schermo.
- *Non interferisce con la sintesi vocale di Luca.*

---

## 5. Mappatura Tasti per Mod Aggiuntive

Per evitare sovrapposizioni tra le funzioni visive di Sebastian e i controlli vocali di Luca:

- **Xaero's World Map (Schermata Mappa Piena)**: Assegnata al tasto **`F7`** (apertura/chiusura a schermo intero senza interferire con `M` o `B`).
- **Traveler's Backpack (Accesso Rapido Zaino)**: Assegnato al tasto **`F8`** (evitando conflitti con `B` e `Z`).


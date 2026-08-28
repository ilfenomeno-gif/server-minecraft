# Piano Tecnico Implementativo: Comando di Ricerca & Teletrasporto Risorse Mod (`/serverretrogen tp`)

**Documento**: Specifiche di Progettazione e Architettura del Comando  
**Data**: 27 Agosto 2026  
**Autore**: Antigravity (Pair Programmer) & Luca  
**Repository Server**: `server-minecraft` (`C:\Users\nemex\OneDrive\Documenti\GitHub\server-minecraft`)  
**Target Runtime**: Minecraft 26.2 (Fabric Loader 0.19.3, Java 25 Microsoft LTS)

---

## 1. Obiettivi e Visione di Accessibilità

Nella mappa reale della Terra (1:1500, estesa su oltre 13 GB), i diversi biomi (savane africane, coste atlantiche, paludi asiatiche, taighe siberiane) distano migliaia di blocchi l'uno dall'altro.

L'obiettivo di questo modulo è dotare il server di un **sistema rapido e intelligente di navigazione e teletrasporto** che permetta ai giocatori (Luca e Sebastian) di:
1. **Localizzare istantaneamente** la zona climatica o il bioma più vicino dove cresce o si trova una determinata risorsa delle mod (*Farmer's Delight*, *Ecologics*, o mod future).
2. **Teletrasportarsi in sicurezza assoluta** sulla superficie del terreno (senza rischio di soffocamento in blocchi o caduta da altezze letali).
3. **Ricevere feedback vocale immediato e dettagliato** per la sintesi vocale (NVDA) con coordinate $(X, Y, Z)$, nome del bioma e risorsa associata.

---

## 2. Architettura Tecnica dei Componenti

```
                                  ALBERO DEI COMANDI /serverretrogen
                                                  │
                 ┌────────────────────────────────┼────────────────────────────────┐
                 │                                │                                │
       ┌─────────▼─────────┐            ┌─────────▼─────────┐            ┌─────────▼─────────┐
       │        tp         │            │      locate       │            │       list        │
       │ (Teletrasporto)   │            │ (Solo Coordinate) │            │ (Elenco Risorse)  │
       └─────────┬─────────┘            └─────────┬─────────┘            └───────────────────┘
                 │                                │
                 └────────────────┬───────────────┘
                                  │
                   ┌──────────────▼──────────────┐
                   │  ResourceLocator Engine     │
                   │  • Lookup Regola nel JSON   │
                   │  • Ricerca Bioma 3D Nativa  │
                   │  • Calcolo Quota Sicurezza  │
                   │  • Dispatching Audio/Chat   │
                   └─────────────────────────────┘
```

---

## 3. Specifiche Tecniche dei Moduli

### 3.1 Albero dei Comandi (Brigadier Command Registration)
Estensione dei comandi registrati in `ServerRetrogenMod.java`:

- `/serverretrogen tp <resource_id>`:
  - Cerca il bioma più vicino per la risorsa specificata e teletrasporta il giocatore.
  - Permesso predefinito: Accessibile a tutti i giocatori (o configurabile per livello op).
- `/serverretrogen locate <resource_id>`:
  - Calcola la distanza in blocchi e fornisce le coordinate $(X, Y, Z)$ e la direzione cardinale (Nord, Sud, Est, Ovest) in chat senza teletrasportare (ideale per esplorazione survival a piedi/cavallo/nave).
- `/serverretrogen list`:
  - Invia in chat l'elenco di tutte le risorse disponibili e i relativi biomi di appartenenza.

### 3.2 Suggerimenti Intelligenti (Tab Completion)
Un provider dinamico `SuggestionProvider<CommandSourceStack>` suggerisce in tempo reale:
- `farmersdelight_wild_tomatoes` (o alias brevi `tomatoes`)
- `farmersdelight_wild_cabbages` (`cabbages`)
- `farmersdelight_wild_onions` (`onions`)
- `farmersdelight_wild_carrots` (`carrots`)
- `farmersdelight_wild_potatoes` (`potatoes`)
- `farmersdelight_wild_beetroots` (`beetroots`)
- `farmersdelight_wild_rice` (`rice`)
- `ecologics_seashell` (`seashells`)
- `ecologics_coconut_seedling` (`coconuts`)
- `ecologics_walnut_sapling` (`walnuts`)

### 3.3 Motore di Ricerca Biomi & Quota di Sicurezza (`ResourceLocator`)
1. **Ricerca Bioma 3D**:
   Utilizza l'algoritmo nativo:
   ```java
   Pair<BlockPos, Holder<Biome>> result = serverLevel.findClosestBiome3d(
       biomeHolder -> rule.biomes.contains(biomeHolder.unwrapKey().get().identifier().toString()),
       playerPos,
       maxRadiusBlocks, // es. 10.000 blocchi
       horizontalStep,  // 32 blocchi di risoluzione
       verticalStep     // 64 blocchi
   );
   ```
2. **Calcolo della Quota Sicura di Atterraggio**:
   - `int groundY = level.getHeight(Heightmap.Types.MOTION_BLOCKING_NO_LEAVES, targetX, targetZ);`
   - Quota di spawn impostata a `groundY + 1`.
   - Controllo di sicurezza: se il blocco a quota `groundY` è acqua profonda (caso riso selvatico), l'algoritmo scansiona un raggio di 5 blocchi per posizionare il giocatore sulla riva asciutta adiacente.

---

## 4. Matrice di Gestione dei Casi & Edge Cases

| Scenario | Tipo Caso | Comportamento Previsto |
|---|:---:|---|
| **Giocatore in Overworld cerca risorsa locale** | Comune | Trova il bioma più vicino entro 2.000 blocchi, teletrasporta su erba/sabbia e notifica in chat con coordinate. |
| **Comando lanciato dalla Console Server** | Non comune | Rileva che l'esecutore non è un'entità giocatrice e restituisce le sole coordinate o richiede un target: `/serverretrogen tp <risorsa> <giocatore>`. |
| **Giocatore nel Nether o nell'End** | Non comune | Rileva la dimensione attuale. Se la risorsa cercata è nell'Overworld, notifica che la risorsa appartiene alla dimensione Overworld o gestisce il cambio dimensione se richiesto. |
| **Risorsa lontana (> 10.000 blocchi)** | Non comune | Estende il raggio di ricerca o segnala che il bioma non è presente nelle immediate vicinanze, suggerendo la direzione. |
| **Risorsa Acquatica (*Wild Rice*)** | Caso Limite | Individua il fiume/palude ma calcola lo spawn sulla prima sponda asciutta (`grass_block` o `mud` non sommerso), evitando l'immersione improvvisa. |
| **ID Risorsa Errato o Inesistente** | Caso Limite | Invia messaggio di errore con sintesi vocale: *"Risorsa non valida. Usa /serverretrogen list per visualizzare le opzioni"*. |
| **Chunk non ancora in memoria** | Caso Limite | `teleportTo` carica nativamente il chunk di destinazione; `server-retrogen` intercetta il caricamento e popola la zona in tempo reale. |

---

## 5. Formato Output e Vocalizzazione (Zero Mouse)

Tutti i messaggi inviati al giocatore saranno formattati per la lettura immediata da parte di NVDA:

- **Teletrasporto effettuato con successo**:
  > `§a[ServerRetrogen] Teletrasportato a X: %d, Y: %d, Z: %d nel bioma %s per la risorsa: %s`
- **Comando Locate (Coordinate)**:
  > `§b[ServerRetrogen] %s trovata a X: %d, Z: %d (Distanza: %d blocchi, Direzione: %s)`
- **Nessun Bioma nel Raggio**:
  > `§c[ServerRetrogen] Nessun bioma valido per '%s' trovato entro %d blocchi dalla tua posizione.`

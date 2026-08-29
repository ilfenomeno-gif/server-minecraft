# Scheda di Governance 09: Standard Piani, Verifiche & Living Documentation
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Ciclo di Vita dei Piani Tecnici

Ogni evoluzione complessa del server (nuove mod, conversioni mondi, comandi custom) viene gestita tramite un Piano Tecnico formale all'interno di `docs/`:

1. **Fase di Progettazione**:
   - Il piano viene redatto e posizionato in `docs/piani/attivi/[NOME_PIANO].md`.
   - Struttura standard:
     - Obiettivi e Visione di Accessibilità
     - Architettura Tecnica & Mod Coinvolte
     - Protocollo di Collaudo & Casi di Test
     - Procedura di Rollback di Emergenza
2. **Fase di Esecuzione & Collaudo**:
   - Esecuzione delle modifiche guidata da Antigravity solo dopo il consenso di Luca.
   - Collaudo in-game da parte di Luca (con NVDA) e Sebastian.
3. **Fase 3: Completamento, Archiviazione & Domanda Ponte**:
   - Spostamento del file da `docs/piani/attivi/` a `docs/piani/completati/[NOME_PIANO].md`.
   - Commit Git, backup stabile e aggiornamento Living Documentation.
   - Presentazione del riepilogo 3D e **obbligo di Domanda Ponte**:
     > *"Vuoi che avviamo ora la sessione formale di Auto-Apprendimento (Fase 4) per elaborare la bozza dettagliata delle regole e aggiornare le schede di conoscenza e governance?"*
4. **Fase 4: Auto-Apprendimento Continuo (Al via libera di Luca)**:
   - Mappatura file di destinazione, redazione bozza paragrafi completi e convalida esplicita prima di applicarli.

---

## 2. Aggiornamento della Living Documentation (Documentazione Viva)

Nessun piano o modifica sostanziale è considerato chiuso senza l'aggiornamento contestuale di:
- **`README.md`**: Elenco mod e istruzioni rapide d'uso.
- **`GEMINI.md`**: Hub di contesto centrale e indice delle regole.
- **`knowledge/`**: Aggiornamento delle schede di governance impattate.

---

## 3. Standard di Accessibilità Cognitiva per Screen Reader

Tutti i documenti tecnici devono rispettare i seguenti requisiti di leggibilità per sintesi vocale:

- **Formattazione Sequenziale Lineare**: Articolazione con logica causa-effetto o "Se... Allora".
- **Divieto Assoluto di Diagrammi 2D**: Nessun disegno ASCII, grafici a scatole con caratteri `|`, `+`, `-`, frecce orizzontali multiple o matrici grafiche complesse che confondono lo screen reader.
- **Titoli ed Elenchi Chiari**: Uso rigoroso dei livelli di intestazione Markdown (`#`, `##`, `###`) per consentire la navigazione rapida per titoli con il tasto `H` di NVDA.
- **Link con Percorsi Assoluti/Relativi Espliciti**: Riferimenti ai file sempre formattati come collegamenti markdown accessibili (`[testo](file:///...)`).

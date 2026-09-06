# Scheda di Governance 09: Standard Piani, Verifiche & Living Documentation
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)
# Framework: ASTRALIS v3.0.2

---

## 1. Ciclo di Vita dei Piani Tecnici & Rete a 4 Nodi Comunicanti (DRY)

Ogni evoluzione complessa del server (nuove mod, conversioni mondi, comandi custom) viene gestita tramite un Piano Tecnico formale all'interno della rete a 4 nodi comunicanti in `docs/`:

1. **Fase 0 — Strategia Cognitiva (UPCS)**:
   - Se l'intervento è strutturale (es. migrazione DFU, modifiche MCA o script di rete), viene redatta una strategia in `docs/strategie/attive/[NOME_STRATEGIA].md`.
   - Ad attività ultimata, la strategia viene archiviata in `docs/strategie/archiviate/`.
2. **Fase 1A — Piano Tecnico & Stop Obbligatorio**:
   - Il piano viene redatto e posizionato in `docs/piani/attivi/[NOME_PIANO].md`.
   - Struttura standard:
     - Obiettivi e Visione di Accessibilità (Zero Mouse, sonificazione, parità client)
     - Architettura Tecnica & Mod Coinvolte
     - Validazione Preventiva a 7 Assi & 3 Livelli di Simulazione
     - Protocollo di Collaudo & Casi di Test
     - Procedura di Rollback di Emergenza
   - Stop Obbligatorio prima di toccare codice, jar o mondi.
3. **Fase 1B / 2 — Esecuzione, Deploy Proattivo & Telemetria**:
   - Esecuzione delle modifiche guidata da Antigravity solo dopo il consenso di Luca.
   - Avvio del server in modalità protetta (`nogui`) e collaudo in-game da parte di Luca (con NVDA) e Sebastian.
   - Durante il collaudo opera la **Telemetria Live**: eventuali anomalie vengono registrate in `docs/report/REGISTRO_REVISIONI.md`.
4. **Fase 3 — Completamento, Archiviazione & Domanda Ponte**:
   - Spostamento del piano da `docs/piani/attivi/` a `docs/piani/completati/[NOME_PIANO].md`.
   - Eventuali voci del Registro Revisioni collaudate con successo vengono migrate in `docs/report/ARCHIVIO_REVISIONI.md`.
   - Commit Git semantico, aggiornamento di `CHANGELOG.md` e living documentation.
   - **Obbligo Tassativo di Domanda Ponte**:
     > *"Vuoi che avviamo ora la sessione formale di Auto-Apprendimento (Fase 4) per elaborare la bozza dettagliata delle regole e aggiornare le schede di conoscenza e governance?"*

---

## 2. Aggiornamento della Living Documentation (Documentazione Viva)

Nessun piano o modifica sostanziale è considerato chiuso senza l'aggiornamento contestuale di:
- **`CHANGELOG.md`**: Disciplina AVF con versione V.A.R[.M] e log cronologico inverso.
- **`README.md`**: Elenco mod e istruzioni rapide d'uso.
- **`GEMINI.md` / `AGENTS.md`**: Hub di contesto centrale, router snelli e indice delle regole.
- **`knowledge/`**: Aggiornamento delle schede di governance e delle matrici mod impattate.

---

## 3. Standard di Accessibilità Cognitiva per Screen Reader (NVDA)

Tutti i documenti tecnici devono rispettare i seguenti requisiti di leggibilità per sintesi vocale:

- **Formattazione Sequenziale Lineare**: Articolazione con logica causa-effetto o "Se... Allora".
- **Divieto Assoluto di Diagrammi 2D**: Nessun disegno ASCII, grafici a scatole con caratteri `|`, `+`, `-`, frecce orizzontali multiple o matrici grafiche complesse che confondono lo screen reader.
- **Titoli ed Elenchi Chiari**: Uso rigoroso dei livelli di intestazione Markdown (`#`, `##`, `###`) per consentire la navigazione rapida per titoli con il tasto `H` di NVDA.
- **Link con Percorsi Assoluti/Relativi Espliciti**: Riferimenti ai file sempre formattati come collegamenti markdown accessibili (`[testo](./percorso/file.md)`).

# server-minecraft — Hub di Contesto & Governance Locale (GEMINI.md — ASTRALIS v3.0.2)
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Collaborazione: Luca (Veterano / Senior Developer Non Vedente con NVDA) & Sebastian (Owner / Apprendista)
# AI Pair Programmer: Antigravity (Primario) & OpenAI Codex/ChatGPT (Copilota Ausiliario)
# Framework: ASTRALIS v3.0.2
# Eredita da: $HOME\.gemini\config\GEMINI.md (Genoma Globale — Livello 0)
# Master Hub Framework: https://github.com/Nemex81/astralis-framework ($env:OneDrive\Documenti\GitHub\astralis-framework)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

Questo repository ospita il server dedicato Minecraft Fabric 26.2 per la Tenuta di Luca e Sebastian (`ilfenomeno-gif/server-minecraft`).
L'architettura garantisce il 100% dell'accessibilità vocale e sonora a Luca (tramite screen reader NVDA, audio 3D posizionale e ZERO MOUSE) garantendo al contempo un'esperienza grafica nativa pulita per Sebastian.

Questo file costituisce l'Hub Centrale di Contesto Locale e router di governance, vincolante per tutti gli assistenti AI. I dettagli specialistici risiedono nella cartella [knowledge/](./knowledge/).

---

## 🏛️ 1. LA MATRICE DEI 12 PROTOCOLLI OPERATIVI (SPECIALIZZAZIONE SERVER MINECRAFT)

1. **Protocollo 1 — Progettazione (Strategy, Contracts & Rete a 4 Nodi DRY)**:
   - *Rete a 4 Nodi Comunicanti*: Strategie (`docs/strategie/`) <-> Piani Tecnici (`docs/piani/`) <-> Report di Sessione (`docs/report/archivio/`) <-> Registro Revisioni RRU (`docs/report/REGISTRO_REVISIONI.md` / `ARCHIVIO_REVISIONI.md`).
   - *Fase 0 (Strategia UPCS)*: Analisi cognitiva in `docs/strategie/attive/` per modifiche complesse (es. conversioni mondi o comandi avanzati).
   - *Sotto-Fase 1A (Piano Tecnico Formale)*: Redazione piano in `docs/piani/attivi/` con stop obbligatorio (Gating Semantico: zero modifiche prima dell'autorizzazione).
2. **Protocollo 2 — Validazione (7 Assi di Qualità + 3 Livelli di Simulazione)**:
   - Validazione preventiva su sintassi configurazioni (JSON/TOML), rispetto memoria JVM (6 GB), zero mouse e volumi sonori di sicurezza (0.7f - 0.8f).
3. **Protocollo 3 — Esecuzione (Build, Deploy Proattivo & Zero Attrito)**:
   - Modifiche chirurgiche su mod/config; avvio controllato in modalità `nogui` con `avvia.bat` prima del collaudo.
4. **Protocollo 4 — Telemetria Live & Denoising**:
   - Monitoraggio in tempo reale dei log del server (`logs/latest.log`, console) durante le sessioni di gioco; registrazione proattiva delle anomalie in `docs/report/REGISTRO_REVISIONI.md`.
5. **Protocollo 5 — Revisione & Affinamento (PRAPI)**:
   - Ciclo rapido di correzione e affinamento in 4 passi sulle voci aperte nel Registro Revisioni.
6. **Protocollo 6 — Chiusura Tecnica & AVF (Fase 3)**:
   - Aggiornamento di `CHANGELOG.md` secondo SemVer AVF a 3+1 cifre (`V.A.R[.M]`).
   - Archiviazione piani in `docs/piani/completati/` e migrazione delle anomalie collaudate in `docs/report/ARCHIVIO_REVISIONI.md`.
   - Commit Git convenzionale (`feat:`, `fix:`, `docs:`, `chore:`) e Domanda Ponte Obbligatoria per la Fase 4.
7. **Protocollo 7 — Auto-Apprendimento Continuo (Fase 4)**:
   - Estrazione lezioni su 3 dimensioni: Binario A (locale in `knowledge/`) e Binario B (globale nel Master Hub).
8. **Protocollo 8 — Aggiornamento Ecosistema**:
   - Ricezione e allineamento degli avanzamenti dal Master Hub `astralis-framework` con preservazione al 100% delle schede di dominio.
9. **Protocollo 9 — Onboarding**:
   - Configurazione rapida dell'ambiente server e credenziali.
10. **Protocollo 10 — Sicurezza & Diagnosi Ostica**:
    - Backup preventivo obbligatorio del mondo (`world/` -> `world_backup/`) prima di qualsiasi operazione critica (DFU, mod chunk, MCA). Root Cause Analysis per crash e mixin conflict.
11. **Protocollo 11 — Pulizia & Bonifica (Dead Code Purge)**:
    - Bonifica e audit delle configurazioni obsolete o mod dismesse con rollback preventivo a 1-click.
12. **Protocollo 12 — Inner Codex Pattern (Dialettica Ingegneristica & 6 Cancelli Inviolabili)**:
    - Autonomia critica con gating rigoroso: hardware grounding per periferiche, rispetto dei vincoli fisici voxel e clearance, test seams headless e budget token router (<= 250 righe).

---

## 🌟 2. REGOLE FONDAMENTALI DEL DOMINIO SERVER MINECRAFT

1. **Accessibilità Vocale & Zero Mouse**:
   - Flusso operativo 100% da tastiera. Nessuna finestra GUI bloccante per il server.
   - Script batch rapidi ed ergonomici: `avvia.bat`, `aggiorna_mappa.bat`, `leggi_codice_e4mc.bat`.
2. **Integrità del Mondo e Doppia Barriera**:
   - Non toccare mai la cartella `world/` senza aver prima convalidato un backup integro in `world_backup/`.
3. **Parità Mod & Rispetto dei Ruoli**:
   - Mod condivise sul server, mod visive esclusive per Sebastian sul suo client, mod di accessibilità (`minecraft-access`) sul client di Luca.
   - Repository GitHub di proprietà di Sebastian (`ilfenomeno-gif`), modifiche strutturali concordate.

---

## 🧭 3. INDICE RAGIONATO DELLA BASE DI CONOSCENZA LOCALE (`knowledge/`)

- [`00_consuetudini_operative_e_sinergia_assistente.md`](./knowledge/00_consuetudini_operative_e_sinergia_assistente.md): Dialogo a 2 tempi, 12 protocolli, 7 assi e pipeline a 4 fasi.
- [`01_accessibilita_vocale_e_interazione_tastiera.md`](./knowledge/01_accessibilita_vocale_e_interazione_tastiera.md): Standard zero-mouse, calibrazione audio (0.7f-0.8f) e parità client.
- [`02_architettura_stack_e_runtime.md`](./knowledge/02_architettura_stack_e_runtime.md): Stack Fabric 26.2, Java 25 LTS, tuning JVM/GC e tunnel e4mc.
- [`03_standard_git_branching_e_commit.md`](./knowledge/03_standard_git_branching_e_commit.md): Conventional Commits, ruoli GitHub e branching policy.
- [`04_struttura_progetto_e_gestione_dati.md`](./knowledge/04_struttura_progetto_e_gestione_dati.md): Mappa cartelle, isolamento backup mondi e topologia hardware.
- [`05_matrice_mod_e_parita_client_server.md`](./knowledge/05_matrice_mod_e_parita_client_server.md): Matrice esaustiva mod: server, client Luca e client Sebastian.
- [`06_gestione_mondo_mca_e_strategia_retrogen.md`](./knowledge/06_gestione_mondo_mca_e_strategia_retrogen.md): File `.mca`, procedura DFU `--forceUpgrade` e modulo retrogen.
- [`07_amministrazione_giocatori_e_sicurezza.md`](./knowledge/07_amministrazione_giocatori_e_sicurezza.md): Whitelist, ruoli OP livello 4, sicurezza rete e tunnel e4mc.
- [`08_registro_incidenti_e_troubleshooting.md`](./knowledge/08_registro_incidenti_e_troubleshooting.md): Protocollo diagnostico crash report, conflitti mixin e chunk.
- [`09_standard_piani_verifiche_e_living_documentation.md`](./knowledge/09_standard_piani_verifiche_e_living_documentation.md): Standard piani in `docs/piani/`, living doc e Rete a 4 Nodi.

---

## ⚡ 4. GUIDA RAPIDA AI COMANDI DEL SERVER

- **Avvio Server**: Eseguire `avvia.bat` (alloca 6 GB RAM, G1GC ottimizzato, avvia Fabric in modalità `nogui`).
- **Ottenere Link Connessione Ospiti (e4mc)**: Eseguire `leggi_codice_e4mc.bat` (estrae l'indirizzo dinamico e lo copia negli appunti).
- **Upgrade Forzato Chunk & Conversione Mappa**: Eseguire `aggiorna_mappa.bat` (esegue il DataFixerUpper con `--forceUpgrade --eraseCache`).

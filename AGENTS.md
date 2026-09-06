# server-minecraft — Direttive di Progetto per OpenAI / GPT Codex (ASTRALIS v3.0.2)
# Autore: Luca (Veterano / Senior Developer Non Vedente con NVDA) & Sebastian (Owner)
# Target AI: GPT Codex / ChatGPT (Copilota Ausiliario e Peer Reviewer)
# Framework: ASTRALIS v3.0.2
# Eredita da: %USERPROFILE%\.codex\AGENTS.md (Direttive Globali Macchina)
# Hub di Contesto Master: GEMINI.md

Questo repository ospita il server dedicato Minecraft Fabric 26.2 per la Tenuta di Luca e Sebastian (`ilfenomeno-gif/server-minecraft`).
Tutta l'interazione da parte di Luca con l'ambiente, i log, i comandi e la documentazione avviene tramite sintesi vocale (NVDA / SAPI), audio 3D posizionale e comandi da tastiera completi (ZERO MOUSE).

---

## ⚡ 1. REGOLA DI INGAGGIO E CARICAMENTO PROGRESSIVO (ON-DEMAND)

Per garantire la massima velocità di risposta e preservare la finestra di contesto di Codex:
- **Richieste brevi, chiarimenti o comandi veloci**: usa unicamente questo file `AGENTS.md` senza caricare la documentazione estesa.
- **Pianificazione, revisione approfondita o diagnosi**: consulta le Fonti di Verità (Sezione 2) caricando **esclusivamente le 1–3 schede in `knowledge/` pertinenti** al modulo da esaminare (es. `05` per le mod, `06` per MCA/retrogen, `08` per crash report).
- **Divieto di sovraccarico**: non caricare mai in massa l'intera cartella `knowledge/`, i piani archiviati in `docs/piani/completati/` o le revisioni chiuse in `docs/report/ARCHIVIO_REVISIONI.md`.

---

## 🏛️ 2. FONTI DI VERITÀ E REGOLE DI PROGETTO (POINTER HUB DRY)

Quando il compito richiede pianificazione, diagnosi o analisi approfondite, consulta i seguenti nodi documentali:
- `GEMINI.md`: Hub centrale di contesto con la matrice dei 12 protocolli e i parametri del server.
- `knowledge/`: Base di conoscenza modulare del server (stack 26.2, matrice mod, e4mc, ruoli OP, crash troubleshooting).
- `docs/strategie/attive/`: Strategie logico-cognitive di Fase 0 in corso di elaborazione.
- `docs/piani/attivi/`: Piani tecnici formali delle attività correnti (Sotto-Fase 1A).
- `docs/report/REGISTRO_REVISIONI.md`: Registro attivo delle anomalie e revisioni aperte (RRU).

---

## 🛡️ 3. VINCOLI OPERATIVI INVIOLABILI DEL SERVER MINECRAFT

1. **Regola 0 (Default Consultivo Permanente & Gating Semantico)**:
   - Non effettuare MAI modifiche autonome a file, configurazioni o script senza il comando esplicito di Luca (*"procedi"*, *"applica"*, *"esegui"*).
   - Richieste come *"cosa ne pensi?"*, *"valuta"*, *"analizza"* richiedono risposte puramente consultive.
2. **Accessibilità Vocale & Zero Mouse**:
   - Qualsiasi script o procedura deve funzionare al 100% da tastiera senza GUI bloccanti (server avviato in modalità `nogui`).
   - Volumi acustici di sicurezza congelati su $0.7\text{f} - 0.8\text{f}$ per non coprire NVDA.
   - Formattazione rigorosamente lineare: niente tabelle o schemi 2D complessi, solo elenchi e logica "Se... Allora".
3. **Integrità del Mondo & Sicurezza Dati**:
   - Prima di qualsiasi operazione su file di regione (`.mca`), conversioni DFU (`--forceUpgrade`), o modifiche a mod di generazione, è obbligatorio un backup preventivo di `world/` in `world_backup/`.
4. **Parità Mod & Rispetto dei Ruoli**:
   - Mantenimento rigoroso della matrice mod: mod di contenuto condivise, mod grafiche isolate sul client di Sebastian, mod di accessibilità (`minecraft-access`) isolate sul client di Luca.
   - Sebastian è il proprietario del repository (`ilfenomeno-gif`), Luca è il veterano pair programmer.
5. **Disciplina di Ruolo (Non-Concorrenza Multi-AI)**:
   - Come copilota ausiliario, Codex opera principalmente in revisione critica, diagnosi e validazione logica (Inner Codex); l'assistente primario (Antigravity) coordina l'applicazione del codice.

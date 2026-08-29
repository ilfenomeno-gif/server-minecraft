# Scheda di Governance 03: Standard Git, Branching & Commit
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Struttura del Repository & Proprietà

- **Repository Upstream**: `https://github.com/ilfenomeno-gif/server-minecraft.git`
- **Owner del Repository**: Sebastian (apprendista)
- **Collaboratore Senior & Architetto Tecnico**: Luca (veterano)
- **Branch Principale**: `main`

---

## 2. Standard Commit Semantici (Conventional Commits)

Tutti i commit devono adottare lo standard **Conventional Commits** in lingua inglese tecnica:

- `feat(server): ...` -> Aggiunta o aggiornamento di mod, script di gestione o feature server.
- `feat(retrogen): ...` -> Modifiche al modulo di generazione risorse o regole di spawn.
- `fix(config): ...` -> Correzione di configurazioni errate in `config/` o `server.properties`.
- `docs(knowledge): ...` -> Aggiornamento o inserimento di schede nella base di conoscenza o piani.
- `chore(server): ...` -> Manutenzione ordinaria, pulizia log, aggiornamento `.gitignore`.
- `refactor(scripts): ...` -> Ottimizzazione di script `.bat` o `.ps1` senza cambi funzionali.

---

## 3. Criterio di Branching Proporzionato

Per mantenere il flusso agile senza sovrastrutture inutili ma tutelando la stabilità:

### A. Branch Dedicato (`feat/*`, `fix/*`, `plan/*`)
Obbligatorio per:
- Sviluppo o ricompilazione di nuove mod custom Java (es. `server-retrogen`).
- Piani tecnici complessi che richiedono collaudi prolungati (es. migrazione massiva di mappe o rifacimento rete).
- Modifiche che potrebbero impedire l'avvio del server.

### B. Fast Path Diretto su `main`
Consentito per:
- Aggiornamenti della Living Documentation (`README.md`, `GEMINI.md`, schede in `knowledge/`, piani in `docs/`).
- Ritocchi a parametri di configurazione (`config/*.json`, `config/*.toml`, `server.properties`).
- Aggiornamento di whitelist o permessi (`ops.json`, `whitelist.json`).
- Fix rapidi di una riga (one-line fixes) approvati esplicitamente da Luca.

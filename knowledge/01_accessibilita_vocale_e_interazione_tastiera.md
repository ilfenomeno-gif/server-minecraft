# Scheda di Governance 01: Accessibilità Vocale & Interazione Tastiera
# Repository: server-minecraft (Tenuta di Luca e Sebastian)
# Autore: Luca (Veterano & Sviluppatore Non Vedente con NVDA) & Antigravity (Senior AI Pair Programmer)
# Target Runtime: Minecraft 26.2 (Fabric Loader, Java 25 Microsoft LTS)

---

## 1. Principi di Accessibilità Assoluta (Zero Mouse)

L'intero ecosistema del server e dei relativi strumenti di gestione è progettato per garantire il **100% dell'accessibilità da tastiera e sintesi vocale**, senza alcuna dipendenza dal puntatore del mouse o da interfacce visive esclusive.

- **Comandi da Tastiera Completi**: Qualsiasi script (`avvia.bat`, `aggiorna_mappa.bat`, `leggi_codice_e4mc.bat`), comando console o interazione in-game deve essere eseguibile esclusivamente tramite tasti freccia, Tab, Invio e scorciatoie standard.
- **Zero Interfacce Grafiche Bloccanti**: Il server viene sempre eseguito con il flag `nogui` per evitare popup Java swing inaccessibili e massimizzare il controllo da terminale.

---

## 2. Standard di Sintesi Vocale & Gestione Audio

Per consentire una fruizione fluida e non affaticante con lo screen reader (NVDA / SAPI):

- **Pulizia dei Messaggi di Log e Console**: Output lineari, sintetici, privi di tabelle ASCII 2D, box grafici con caratteri speciali o sequenze di caratteri ripetute che appesantiscono la lettura vocale.
- **Priorità alla Narrazione Vocale**: Nei client accessibili, i messaggi di chat e le notifiche di sistema devono essere formattati con testi chiari ed esplicativi (es. *"Giocatore Sebastian è entrato nel mondo"* anziché simboli grafici indecifrabili).
- **Volumi di Sicurezza Audio In-Game (Cap $0.7\text{f} - 0.8\text{f}$)**: I canali sonori del gioco (effetti, suoni ambientali, pioggia, passi, macchinari) devono rimanere sempre calibrati tra un massimo di $0.7\text{f}$ e $0.8\text{f}$ per evitare di mascherare o soffocare la voce della sintesi vocale di NVDA.

---

## 3. Parità di Esperienza tra Client

Il server gestisce in modo armonico la presenza di due tipologie di giocatori:

1. **Client Luca (Giocatore Non Vedente)**:
   - Mod fondamentale: `minecraft-access-1.12.0.jar`.
   - Fornisce: narrazione continua dei blocchi puntati, inventari leggibili a griglia, audio posizionale 3D avanzato per entità e ostacoli, indicazione sonora di altezza e pericoli.
   - Il server deve mantenere coerenti le informazioni posizionali e di stato affinché `minecraft-access` riceva pacchetti puliti.

2. **Client Sebastian (Giocatore Normovedente)**:
   - Mod visive lato client: `LambDynamicLights` (illuminazione torce dinamica), `ToroHealth Damage Indicators` (barre vita mob a schermo), `Xaero's World Map / Minimap` (mappatura visiva).
   - Nessuna interferenza audio invasiva: la sintesi vocale è isolata sul client di Luca e non genera suoni o TTS sul client di Sebastian.

---

## 4. Linee Guida di Formattazione per la Documentazione e Console

1. **Struttura Lineare**: Usare sempre elenchi puntati e sezioni sequenziali.
2. **Niente Tabelle Complesse o Grafica ASCII**: Vietati diagrammi a scatole (`+---+`), frecce orizzontali complesse o matrici visive 2D.
3. **Link Espliciti e Cliccabili**: Utilizzare percorsi completi con formato `file:///` per consentire l'apertura rapida da riga di comando o editor.

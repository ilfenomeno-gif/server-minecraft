# Server Minecraft 26.2 Fabric - Tenuta di Luca e Sebastian

Server dedicato Minecraft su architettura nativa **Fabric 26.2**, progettato per garantire il 100% dell'accessibilità per giocatori non vedenti con sintesi vocale e controlli da tastiera, offrendo al contempo un'esperienza visiva nativa fluida e priva di audio invasivo per i giocatori normovedenti.

---

## ?? Avvio Rapido

1. **Avvio del Server:**
   Fai doppio clic su vvia.bat per avviare il server con 6 GB di RAM e garbage collection ottimizzato.

2. **Ottenere il Link di Connessione per gli Amici (e4mc):**
   Grazie alla mod e4mc (Fabric), il server genera a ogni avvio un link di connessione P2P senza bisogno di aprire porte sul router.
   Per leggere o copiare rapidamente l'indirizzo negli appunti, esegui:
   leggi_codice_e4mc.bat

3. **Aggiungere Giocatori alla Whitelist:**
   Dalla console del server in esecuzione digita:
   whitelist add <nickname>

4. **Aggiornamento Futuro Mappa Mondo Reale:**
   Quando la mappa della Terra sarà disponibile:
   - Inseriscila nella cartella principale rinominandola world.
   - Esegui ggiorna_mappa.bat per convertire tutti i chunk al formato 26.2.
   - Avvia normalmente con vvia.bat.

---

## ?? Ripartizione Mod (Server vs Client)

| Mod | Tipo | Server | Client Luca (Non Vedente) | Client Sebastian (Normovedente) |
| :--- | :--- | :---: | :---: | :---: |
| **Farmer's Delight Refabricated** | Contenuto / Cucina | ? | ? | ? |
| **Macaw's Suite (Ponti, Porte, Mobili, Fences, Finestre)** | Arredo e Blocchi | ? | ? | ? |
| **Valkyrien Skies 2 + Eureka Ships** | Navi e Fisica | ? | ? | ? |
| **Cooking for Blockheads** | Cucina Componibile | ? | ? | ? |
| **FallingTree + Ore Harvester** | Raccolta Rapida | ? | ? | ? |
| **Traveler's Backpack** | Zaini Indossabili | ? | ? | ? |
| **Vic's Point Blank** | Armi 3D | ? | ? | ? |
| **Naturalist + Ecologics** | Fauna e Biomi | ? | ? | ? |
| **Lithium + FerriteCore + Krypton** | Ottimizzazione TPS/RAM | ? | ? | ? |
| **e4mc (Fabric)** | Tunneling P2P | ? | *(Opzionale)* | *(Opzionale)* |
| **minecraft-access-1.12.0.jar** | Screen Reader / Audio 3D | ? *(NO)* | ? **SÌ** | ? **NO (Nessuna Voce)** |
| **LambDynamicLights** | Luci Dinamiche Torce | ? *(NO)* | *(Opzionale)* | ? **SÌ (Visivo)** |
| **ToroHealth Damage Indicators** | Barre Vita Mob | ? *(NO)* | ? | ? **SÌ (Visivo)** |
| **Xaero's World Map / Minimap** | Mappe 2D a Schermo | ? *(NO)* | ? | ? **SÌ (Visivo)** |

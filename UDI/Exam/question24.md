# Otázka 24
## Konečné automaty
**Definice:**
- Konečný automat je teoretický výpočetní model používaný v informatice pro studium vyčíslitelnosti a obecně formálních jazyků. Popisuje velice jednoduchý počítač, který může být v jednom z několika stavů, mezi kterými přechází na základě symbolů, které čte ze vstupu. Množina stavů je konečná (odtud název). Konečný automat nemá žádnou další paměť kromě informace o aktuálním stavu. Konečné automaty se používají pro zpracování regulárních výrazů, například jako součást lexikálního analyzátoru v překladacích.

**Deterministický konecný automat** je pětice \( A = <T,Q,δ,q_0,F> \), kde:
- \( T \) je konečná množina vstupních symbolů (nazývaná abeceda)
- \( Q \) je konečná množina stavů
- \( δ \) je tzv. přechodová funkce, \( δ : Q ×T → Q \), popisující pravidla přechodů mezi stavy
- \( q_0 \) je pocáteční stav, \( q_0 ∈ Q \)
- F je množina koncových stavů, \( F ⊆ Q \)

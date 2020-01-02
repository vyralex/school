# Otázka 29
## Hledání minimální kostry grafu (Kruskalův algoritmus)

**Strom** je neorientovaný souvislý graf bez kružnic<br>
**Kostra** neorientovaného grafu \( G \) je jeho podgraf, který je stromem a obsahuje všechny vrcholy grafu \( G \).

**Kruskalův algoritmus** je hladový algoritmus (z roku 1956) hledající minimální kostru souvislého grafu \( G = <V, E> \).
- **Vstup:** souvislý graf \( G = <V, E> \), \( |V| = n \), \(|E| = m \), hranové ohodnocení \( w : E → R^+ \)
- **Výstup:** minimální kostra grafu, tj. kostra grafu s minimálním součtem ohodnocení jejích hran
- **Algoritmus:** Algoritmus postupně prochází hrany a vytváří z nich množiny \( E_0, E_1, E_2, ..., \) z nichž poslední je minimální kostra grafu \( G = <V, E> \):
1. Uspořádej hrany z \( E \) dle váhy: \( w(e_1) ≤ w(e_2) ≤ ... ≤ w(e_m) \)
2. Vytvoř prázdnou množinu hran \( E_0 \)
3. Pokud přidáním \( e_i \) vznikne kružnice, ponechej \( E_i := E_{i−1} \), jinak \( E_i := E_{i−1} ∪ \{e_i\} \)
4. Opakuj krok 3, dokud \( i < m \) a \( E_i \) ješte nemá \( n − 1 \) hran.

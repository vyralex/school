# Otázka 28
## Hledání cest (Dijkstrův algoritmus)
**Dijkstrův algoritmus** je nejznámější algoritmus na nalezení nejkratších cest z daného vrcholu.

- **Vstup:** neorientovaný graf \( G = <V, E> \), hranové ohodnocení \( w : E → R^+ \), počáteční vrchol \( s ∈ V \)
- **Výstup:** hodnota \( d(v) \) pro každý \( v ∈ V \), \( d(v) \) je hodnota nejkratší cesty z \( s \) do \( v \)
- **Proměnné:** funkce \( d : V → R^+_0 \), číslo  \( m ∈ R^+_0 \), množiny \( A, N ⊆ V \)

**Algoritmus:**
1. \( A = V \); \( d(s) = 0 \); pro \( v ∈ V − \{s\}: d(v) = ∞ \)
2. Pokud neexistuje \( v ∈ A \) takový, že \( d(v) ≠ ∞ \), skonči
3. \( m = min\{d(v)\ |\ v ∈ A\} \); \( N = \{v ∈ A\ |\ d(v) = m\} \); \( A = A − N \)
4. Pro všechny \( v ∈ N,\ u ∈ A \) takové, že \( \{v, u\} ∈ E \): jestliže \( d(v) + w(\{v, u\}) < d(u) \), pak \( d(u) = d(v) + w(\{v, u\}) \); pokracuj bodem 2.


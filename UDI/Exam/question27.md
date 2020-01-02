# Otázka 27
## Obsah
1. Neorientované a orientované grafy
2. Základní pojmy teorie grafů

## Neorientované a orientované grafy
**Neorientovaný graf** je dvojice \( G = <V, E> \), kde \( V \) je neprázdná množina vrcholů a \( E ⊆ \{\{u, v\}\ |\ u, v ∈ V, u ≠ v\} \) je množina dvouprvkových množin vrcholů, tzv. (neorientovaných) hran.

**Orientovaný graf** je dvojice \( G = <V, E> \), kde \( V ≠ ∅ \) je množina vrcholů a \( E ⊆ V × V \) je množina uspořádaných dvojic vrcholů, tzv. (orientovaných) hran.

## Základní pojmy teorie grafů
- **Graf** je gravické znázornění objektů a vztahu mezi nimi
- **Vrcholy** jsou objekty (v grafu jsou znázotněny kruhy)
- **Hrany** jsou vztahy mezi objekty (v grafu jsou znázorněny pomocí čar/šipek mezi kruhy)

**Sled** v neorientovaném grafu \( G = <V, E> \) je posloupnost \( v_0, e_1, v_1, e_2, v_2, ..., e_n, v_n \), kde \( v_i ∈ V \) jsou vrcholy a \( e_j ∈ E \) jsou
hrany takové, že \( e_i = \{v_{i−1}, v_i\} \) pro \( i = 1, ..., n \). Číslo \( n \) se nazývá délka sledu. Sled \( v_0, e_1, v_1, e_2, v_2, ..., e_n, v_n \), se nazývá:
- **uzavřený**, je-li \( v_0 = v_n \)
- **tah**, neopakuje-li se v něm žádná hrana \( (i ≠ j ⇒ e_i ≠ e_j) \)
- **cesta**, neopakuje-li se v něm žádný vrchol \( (i ≠ j ⇒ v_i ≠ v_j) \)
- **kružnice**, je-li \( v_0 = v_n \) a s výjimkou vrcholů \( v_0 \) a \( v_n \) jsou každé dva vrcholy různé.

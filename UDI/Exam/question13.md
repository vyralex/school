# Otázka 13
## Obsah
1. Ekvivalence
2. Rozklady na množině
3. Ekvivalence a surjektivní zobrazení

## Ekvivalence
Relace je ekvivalence pokud je *reflexinví*, *symetrická* i *tranzitivní*.

## Rozklady na množině
Nechť \( X ≠ ∅ \). Systém množin \( Π ⊆ 2^X \) splňující
1. \( Y ≠ ∅ \) pro každou \( Y ∈ Π \)
2. Pro každé \( Y_1, Y_2 ∈ Π \) platí: pokud \( Y_1 ∩ Y_2 ≠ ∅ \), pak \( Y_1 = Y_2 \)
3. \( ∪Π = X \)

se nazývá rozklad na množině \( X \). Množiny \( Y ∈ Π \) nazýváme třídy rozkladu \( Π \). Pro prvek \( x ∈ X \) označíme \( [x]_Π \) tu třídu rozkladu \( Π \), která obsahuje \( x \).

## Ekvivalence a surjektivní zobrazení
Vezměme surjektivní zobrazení \( g : Z → \{−1, 0, 1\} \), které každému celému číslu \( z ∈ Z \) přiřazuje prvek z \( \{−1, 0, 1\} \) předpisem
- \( g(z) = −1 \) pokud \( z < 0 \),
- \( g(z) = 1 \) pokud \( z > 0 \),
- \( g(z) = 0 \) jinak.

Zobrazení \( g \) tedy reprezentuje funkci signum. Faktorová množina \( X/E_g \) se skládá ze tří tříd rozkladu: \( \{x ∈ Z\ |\ x < 0\} \), \( \{0\} \) a \( \{x ∈ Z\ |\ x > 0\} \). Z intuitivního pohledu \( g \) i \( X/E_g \) reprezentují zjednodušení množiny celých čísel, které jsme získali "odhlédnutím od konkrétní číselné hodnoty a soustředením se pouze na znaménko".

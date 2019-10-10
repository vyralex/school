# Paradigmata programovaní 1 (PAPR1)
## Symbolické výrazy
Máme 2 druhy symbolických výrazů<br>
**Jednoduchý výraz (atom)** může být symbol, číslo, art… <br>
**Složený výraz (seznam)** musí být ohraničen závorkami a zapisujeme jej v prefixové notaci. 
Například `a + b` zapisujeme jako `(+ a b)`, složitější výrazy jako `(5 + 3) / (5 - 3)` zapisujeme `(/ (+ 5 3) (- 5 3))`<br>
Složený výraz se skládá ze symbolu operátoru, speciálního operátoru, nebo makra a argumentů.

**Vyhodnocování výrazu E**<br>
1. Je-li E symbol, výsledkem je hodnota symbolu E. <br>
2. Je-li E jiný atom než symbol, výsledkem je E. <br>
3. Je-li E seznam s operátorem o a argumenty a<sub>1</sub> . . . a<sub>n</sub>, pak: <br>
   - se zjistí funkce f, kterou operátor o označuje
   - zjistí se hodnoty v<sub>1</sub> . . . v<sub>n</sub> argumentů a<sub>1</sub> . . . a<sub>n</sub> (opět vyhodnocovacím procesem).
   - Výsledkem je výsledek aplikace funkce f na hodnoty v<sub>1</sub> . . . v<sub>n</sub>.

## Hodnoty symbolů
**Symbol** je jméno hodnoty<br>
Například hodnota symbolu `pi` je 3.141592653589793D0

## Logické hodnoty
V lispu jsou logické hodnoty reprezentovány jako `T` = pravda a `NIL` = nepravda<br>
Při vyhodnocení podmínky jsou všechny hodnoty různé od `NIL` brány jako pravdivé

## Speciální operátory
Speciální operátory se nazývají speciální, protože nepodléhají standardnímu mechanismu vyhodnocování, tj. mají vlastní pořadí vyhodnocování argumentů<br>
Vyhodnocení podmíněného výrazu `(if a b c)`
1. Vyhodnotí se a na hodnotu u.
2. Pokud je u rovno NIL, vyhodnotí se c a vrátí jeho hodnota.
3. Pokud není, vyhodnotí se b a vrátí jeho hodnota.

Vyhodnocení výrazu `(setf a b)`
1. Vyhodnotí se b.
2. hodnota symbolu a se nastaví na tuto hodnotu.


# Paradigmata programovaní 1 (PAPR1)
## Hodina 1
### **Symbolické výrazy**
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

### **Hodnoty symbolů**
**Symbol** je jméno hodnoty<br>
Například hodnota symbolu `pi` je 3.141592653589793D0

### **Logické hodnoty**
V lispu jsou logické hodnoty reprezentovány jako `T` = pravda a `NIL` = nepravda<br>
Při vyhodnocení podmínky jsou všechny hodnoty různé od `NIL` brány jako pravdivé

### **Speciální operátory**
Speciální operátory se nazývají speciální, protože nepodléhají standardnímu mechanismu vyhodnocování, tj. mají vlastní pořadí vyhodnocování argumentů<br>
Vyhodnocení podmíněného výrazu `(if a b c)`
1. Vyhodnotí se a na hodnotu u.
2. Pokud je u rovno NIL, vyhodnotí se c a vrátí jeho hodnota.
3. Pokud není, vyhodnotí se b a vrátí jeho hodnota.

Vyhodnocení výrazu `(setf a b)`
1. Vyhodnotí se b.
2. hodnota symbolu a se nastaví na tuto hodnotu.

## Hodina 2
### **Definice funkce**
K definici funkce slouží funkce (makra) **DEFUN**
zapisujeme ji `(defun jméno-funkce (parametry-funkce) (tělo-funkce))` funkci poté voláme následovně `( jméno-funkce parametry-funkce)`<br>
Když definujeme funkci, tak ji budeme moct požít vícekrát i na jiných místech programu. Typicky si můžeme definovat funkci, která nám ověří trojúhelníkovou nerovnost (délka nejdelší strany musí být menší než součet délek zbývajících), kterou pak můžeme využít při výpočtu obvodu trojúhelníku (pokud nerovnost neplatí vrátím hodnotu 0) `(if (nerovnost a b c) (+ a b c) 0)` ahoj
**Další výhody funkce jsou**:<br>
- Nemusím vědět, jak přesně funkce pracuje – důležité je, co dělá
- Zvyšuje se čitelnost
- Snadněji se dělají změny
- Snižuje se chybovost

### **Vazby**
Každý (definovaný) symbol má vazbu na nějakou hodnotu.<br>
Každý symbol může mít více vazeb, ale jen jednu vazbu aktuální.<br>
Když mám v proměnné `r` nastavenou hodnotu 5 a zavolám funkci která používá r jako parametr, například výpočet obvodu kruhu `(defun circle-area (r) (* r pi))`, pak se mi se stane následující:
1. se vytvoří nová vazba na symbol r
2. učiní se aktuální (tím zastíní původní vazbu)
3. nastaví se jí hodnota 10
4. Vyhodnotí se tělo funkce
5. Po vyhodnocení vazba přestává být aktuální.

Vazba na symbol pi se nevytváří a nenastavuje, aktuální zůstává původní vazba.

### **Prostředí**
Je tabulka symbol a hodnota, ze které se zjišťují vazby symbolů na jejich hodnoty.

| Symbol | Hodnota             |
|--------|---------------------|
| pi     | 3.141592653589793D0 |

Na začátku máme globální prostředí<br>
Při volání funkce se stává prostředí funkce aktuálním prostředím a jeho předkem předkem se stává globální prostředí. <br>
Symboly se vždy vyhodnocují v aktuální prostředí, pokud symboly v aktuální prostředí nemají vazbu na hodnotu, pak se dívám na předchozí prostředí.

### **Operátor LET**
Tento operátor nám umožňuje vytvářet prostředí explicitně, jeho prvním argumentem je seznam popisů vazeb, druhým argumentem je tělo funkce. Zápis je `(let ((a 2) (b (+ 2 1))) (* a b))` vyhodnocuje se následovně:
1. V aktuálním prostředí se vyhodnotí všechny druhé položky popisů vazeb. (Vyhodnotí se `2` a `(+ 2 1)`)
2. Vytvoří se nové prostředí a v něm vazby tak, že každá první položka popisu vazby (která musí být symbolem) se naváže na hodnotu druhé položky. (a = 2; b = 3)
3. Předkem nového prostředí se učiní aktuální prostředí.
4. Tělo se vyhodnotí v tomto novém prostředí. Výsledek se vrátí jako hodnota celého výrazu. 


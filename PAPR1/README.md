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
zapisujeme ji:
``` lisp
(defun jméno-funkce (parametry-funkce)
    (tělo-funkce))
```
Funkci poté voláme následovně: `(jméno-funkce parametry-funkce)`<br>
Když definujeme funkci, tak ji budeme moct požít vícekrát i na jiných místech programu. Typicky si můžeme definovat funkci, která nám ověří trojúhelníkovou nerovnost (délka nejdelší strany musí být menší než součet délek zbývajících), kterou pak můžeme využít při výpočtu obvodu trojúhelníku (pokud nerovnost neplatí vrátím hodnotu 0) `(if (nerovnost a b c) (+ a b c) 0)` ahoj
**Další výhody funkce jsou**:<br>
- Nemusím vědět, jak přesně funkce pracuje – důležité je, co dělá
- Zvyšuje se čitelnost
- Snadněji se dělají změny
- Snižuje se chybovost

### **Vazby**
Každý (definovaný) symbol má vazbu na nějakou hodnotu.<br>
Každý symbol může mít více vazeb, ale jen jednu vazbu aktuální.<br>
Když mám v proměnné `r` nastavenou hodnotu 5 a zavolám funkci která používá r jako parametr, například výpočet obvodu kruhu 
``` lisp
(defun circle-area (r) (* r pi))
```
, pak se mi se stane následující:
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
| ...    | ...                 |

Na začátku máme globální prostředí<br>
Při volání funkce se stává prostředí funkce aktuálním prostředím a jeho předkem předkem se stává globální prostředí. <br>
Symboly se vždy vyhodnocují v aktuální prostředí, pokud symboly v aktuální prostředí nemají vazbu na hodnotu, pak se dívám na předchozí prostředí.

### **Operátor LET**
Tento operátor nám umožňuje vytvářet prostředí explicitně, jeho prvním argumentem je seznam popisů vazeb, druhým argumentem je tělo funkce.
``` lisp
(let ((a 2) (b (+ 2 1)))
    (* a b))
```
vyhodnocuje se následovně:
1. V aktuálním prostředí se vyhodnotí všechny druhé položky popisů vazeb. (Vyhodnotí se `2` a `(+ 2 1)`)
2. Vytvoří se nové prostředí a v něm vazby tak, že každá první položka popisu vazby (která musí být symbolem) se naváže na hodnotu druhé položky. (a = 2; b = 3)
3. Předkem nového prostředí se učiní aktuální prostředí.
4. Tělo se vyhodnotí v tomto novém prostředí. Výsledek se vrátí jako hodnota celého výrazu. 

## Hodina 3
### Operátor `cond`
Funguje jako `if`, ale může být vyhodnoceno více podmínek naráz:<br>
``` lisp
(cond (podmínka1 výraz1)
      (podmínka2 výraz2)
      (podmínka3 výraz3))
```
### Operátory AND a OR
`(and podmínka1 podmínka2 ...)`<br>
`(or podmínka1 podmínka2 ...)`<br>
Operátory se vyhodnocují "líně" (částečně), tzn. jakmile je možné říct odpověď, tak se dále nevyhodnosují.

### Rekurzivní funkce
**Definice:** Výpočetní proces je rekurzivní, když během aplikace funkce dojde znovu k aplikaci téže
funkce.
``` lisp
(defun power (a n)
    (if (= n 0)
        1
        (* a (power a (- n 1)))))
```

### Iterativní funkce
**Definice:** Výpočetní proces je iterativní, když na konci aplikace funkce dojde opět k aplikaci téže
funkce.
``` lisp
(defun power-iter (a n result)
    (if (= n 0)
        result
        (power-iter a (- n 1) (* result a))))

(defun power (a n)
    (power-iter a n 1))
```

## Hodina 5
### Rekurzivní proces
Například pokud zavoláme funkci (power 2 3) viz. výše:
- Zjistí se, že n není 0, tak se stane `(* 2 (power 2 2))`
- Zjistí se, že n není 0, tak se stane `(* 2 (power 2 1))`
- Zjistí se, že n není 0, tak se stane `(* 2 (power 2 0))`
- Zjistí se, že n je 0 tak se vrátí se `1`.
- Spočítá se hodnota `(* 2 1)` a vrátí se.
- Spočítá se hodnota `(* 2 2)` a vrátí se.
- Spočítá se hodnota `(* 2 4)` a vrátí se.

### Iterativní proces
Například pokud zavoláme funkci (power-iter 2 3 1) viz. výše:
- Zjistí se, že n není 0, tak se stane `(power-iter 2 2 2)`
- Zjistí se, že n není 0, tak se stane `(power-iter 2 1 4)`
- Zjistí se, že n není 0, tak se stane `(power-iter 2 0 8)`
- Zjistí se, že n je 0 tak se vrátí se `8`.

### Zrychlený proces
``` lisp
(defun power2 (n)
  (* n n))

(defun fast-power (a n)
  (cond ((= n 0) 1)
        ((evenp n)
         (power2 (fast-power a (/ n 2))))
        (t (* a (fast-power a (- n 1))))))
```
Například pokud zavoláme funkci (fast-power 2 3) viz. výše:
- Zjistí se, že n není 0 a není sudé, tak se stane `(* 2 (fast-power 2 2))`
- Zjistí se, že n je sudé, tak se stane `(power2 (fast-power 2 1))`
  - Zjistí se, že n není 0 a není sudé, tak se stane `(* 2 (fast-power 2 0)`
  - Zjistí se, že n je 0 tak se vrátí se `1`
  - Spočítá se `(* 2 1)` a vrátí se.
- Spočítá se hodnota `(power2 2)` - vrátí se.
- Spočítá se hodnota `(* 2 4)` a vrátí se.

### Náročnost rekurzivního procesu
**Stromově** rekurzivní výpočetní proces výpočtu n-tého čísla fibonacciho posloupnosti:
``` lisp
(defun fib (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (t (+ (fib (- n 2)) (fib (- n 1))))))
```
Na každé konci funkce se volá 2x tentýž funkce (některé výpočty proběhnout 2x)<br>
**Lineárně** rekurzivní výpočetní proces výpočtu n-tého čísla fibonacciho posloupnosti:
``` lisp
(defun fib-iter (a b n)
  (if (= n 0)
      b
    (fib-iter b (+ a b) (- n 1))))

(defun fib (n)
  (if (= n 1)
      0
      (fib-iter 0 1 (- n 2))))
```
Ve funkce se volá funkce znovu pouze 1x (takže se žádné číslo nepočítá vícekrát).

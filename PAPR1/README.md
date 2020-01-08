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

## Hodina 4
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

# Hodina 5
## Datové struktury
- **Konstruktory** vytváří objekt dané struktury.
- **Selektory** vrací hodnotu, která je v dané struktuře.

Nemusím vědět, jak je datová struktura vytvořena, ale můžu jí umět používat. Pokot hovoříme o abstraktní datové struktuře.
*Například souřadnice bodu*.

## Pár
**Tečkový pár** je dvojce dvou složek `car` (první) a `cdr` (druhý).
- Konstruktor `(cons 1 2)` vásledek `(1 . 2)`.
- Jednotlivé prvky múže získat funkcemi `car` a `cdr`.
- Ověření, zda zadaná hodnota je pár `(consp X)`.

### Zlomky
Zlomky můžeme reprezentovat jako tečkové páry.
``` lisp
; Kontruktor
(defun fraction (a b)
  (cons a b))
; Selektor citatele
(defun numer (a)
  (car a))
; Selektor jmenovatele
(defun denom (b)
  (cdr b))
```
Další operace s naší strukturou zlomků (například `+` a `*`).
``` lisp
(defun frac-+ (x y)
  (fraction (+ (* (number x) (denom y))
               (* (number y) (denom x)))))

(defun frac-* (x y)
  (fraction (* (number x) (number y)
               (denom x) (denom y))))
```

## Čistý seznam 
Základem jsou tečkové páry. Seznam o `n` prvcích je tečkový pár, kde je na první místě první prvek a na druhém místě seznam o `n – 1` prvcích. Seznam o `0` prvcích je nil.
``` lisp
; Příklad čistého seznamu
(cons 1 (cons 2 (cons 3 nil)))
```

# Hodina 6
## Použití operátorů AND a OR místo IF
Pokud funkce vrací pravdivostní hodnotu, tak se nemusí používat funkce if, ale stačí kombinace funkcí `AND` a `OR`
Například funkce kontrolující, zda je zadaný parametr seznam:
``` lisp
(defun proper-list-p (x)
  (or (null x)
      (and (consp x)
           (proper-list-p (cdr x)))))
```

## Speciální operáto `let*`
Příklad:
``` lisp
(let* ((a 2)
       (b (* a 2)))
  (+ a b))
```
Výraz se vyhodnocuje přesně jako 
``` lisp
(let ((a 2))
  (let ((b (* a 2)))
    (+ a b)))
       (b (* a 2)))
  (+ a b))
```

# Hodina 7
## Speciální operátor `QUOTE`
Operátor přijímá jeden argument a vrací ho, aniž by ho vyhodnotil<br>
`(quote (1 2 3))` vrátí seznam (1 2 3)<br>
`(quote a)` vrátí proměnnou a (je jedno, zda jsme přední proměnné přiřadily nějakou hodnotu)<br>
**Zkrácený zápis tohoto operátoru je** `'` (apostrof)<br>
předešlé příklady lze tedy zapsat jako `'(1 2 3)` a `'a`

# Hodina 8
## Vedlejší efekt
Vedlejší efektu je stav, kdy nám funkce kromě vrácení výsledku udělá ještě něco jiného.<br>
Například `(setf a 5)` vrátí jako výsledek 5, ale vedlejší efekt je takový, že nastaví hodnotu proměnné a na 5.

## Textové řetězce
Textové řetězce zapisujeme do uvozovek `"Priklad textoveho retezce"`<br>
Řetězce pak můžeme přiřazovat do proměnných nebo je tisknou

## Tisk
1. Funkce PRINT přijímá jeden argument ten vytiskne na nový řádek, textový řetězec vytiskne s uvozovkami a parametr vyhodnotí a vrátí jeho hodnotu.
2. Funkce PRINC přijímá jeden argument ten vytiskne, řetězec tiskne bez uvozovek. Parametr vyhodnotí a vrátí jeho hodnotu.
3. Funkce TERPRI vytiskne prázdný řádek
 
## Bloky kódu
Když definujeme funkci pomocí makra `defun`, tak tím implicitně říkáme, že se ve funkci může vyhodnocovat více výrazů. Například:
``` lisp
(defun power2 (a)
  (princ "Druha mocnina cisla ")
  (princ a)
  (princ " je ")
  (princ (* a a)))
```
`(power2 5)` vytiskne "Druha mocnina cisla 5 je 25".

**Explicitní** vytvoření bloku kódu za pomocí speciálního operátoru PROGN<br>
Například speciální operátor IF nevytváří bloky kódu implicitně a proto se nám může hodit umět blok definovat explicitně.
K tomu slouží speciální operátor PROGN používá se takto `(progn vyraz-1 vyraz-2 ... vyraz-n)`. Příklad použití
``` lisp
(defun print-numbers (n)
  (if (<= n 0)
      nil
    (progn
      (print (- n 1))
      (print-numbers (- n 1)))))
```
`(print-numbers 3)` vytiskne:<br>
3<br>
2<br>
1<br>
0

# Hodina 9
## Funkce jako hodnoty
Hodnotu funkce můžeme získá za pomocí operátoru **function**, na příklad `(function +)`. Funkci můžeme také přiřadit do hodnoty například `(setf a (function +))`. Zkrácený zápis operátoru function je `#'`, použití je stejné jako u QUOTE `(setf a #'+)`

Funkci poté můžeme volat pomocí funkce **funcall**. Mějme například funkci
``` lisp
(defun foo (fun a b)
  (funcall fun a b))
```
Tuto funkci můžeme nyní použít jako jakoukoliv funkci které bere 2 argumenty. Příklady: `(foo #'+ 5 2)` sečte čísla a vrátí 7, `(foo (function -) 5 2)` odečte čísla a vrátí 3, atd...

## Mapování
Mapováním se rozumí aplikování funkce na každý prvek seznamu. Například na seznam `(1 2 3 4 5)` namapovat druhou mocninu. Na to nám slouží funkce **mapcar**. Příklad použití `(mapcar #'power2 '(1 2 3 4 5))` na vrátí seznam `(1 4 9 16 25)`.

## Hodnotová a funkční vazba
Vazba symbolu v prostředí může být funkční, to znamená, že je vázaná na funkci, nebo hodnotová, to znamená, že je vázaná na nějakou hodnotu.

## Labels
Za pomocí speciálního operátoru **labels** si můžeme vytvoří funkci uvnitř funkce. Může se hodit, pokud je naše funkce iterativní, ale my nechceme mí v globálním prostředí tuto definici funkce. Příklad:
``` lisp
(defun power (a n)
  (labels ((iter (a n result)
             (if (= n 0)
                 result
               (iter a (- n 1) (* a result)))))
    (iter a n 1)))
```

# Hodina 10
## Anonymní funkce (lambda funkce)
Pomocí makra **lambda** můžeme vytvářet anonymní funkce. Syntaxe `(lambda (parametry) (tělo funkce))`. Použití *ze cvičení*:
``` lisp
(defun print-sequence (seq)
  (labels ((iter (index)
             (if (>= index 20)
                 (princ "... ")
               (progn (princ (mem seq index))
                 (princ ", ")
                 (iter (1+ index))))))
    (iter 0)
    nil))

(defun even-members (fun)
  (lambda (index) (funcall fun (* index 2))))
```
Funkce `print-sequence` bere jako parametr funkci, která pro daný index vypočítá prvek dané posloupnosti. Funkce `even-members` bere jako parametr funkci posloupnosti a vrací tu samou funkci, ale jen pro sudá čísla.<br>
Když zavoláme funkci `(print-sequence (even-members (lambda (a) (- a 10))))` tak funkce vytiskne: `-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, ...`
 
# Hodina 12 (11)
## Jazyk Scheme
### Symboly
Mají jen jeden druh vazeb (v lispu 2 druhy funkční a hodnotové). Do proměnné se přiřazují hodnody pomocí operátoru **define**.
``` lisp
(define a power2)
(define a 10)
```
### Vyhodnocovací proces
V seznam se první argument vyhodnocuje, takže je možná místo prvního prvku na psat třeba **if**:
``` lisp
((if t + *) 3 3)
```
Výsledkem bude 6 (v lispu by program spadl, protože prvním argumentem není funkce)

### Procedura ss-eval
**ss-eval** vyhodnocuje výraz zadaný v argumentu

### 
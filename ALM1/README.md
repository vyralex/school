# Algoritmy 1 (ALM2)
## Co je to algoritmus?
Algoritmus je posloupnost instrukcí pro řešení problému.<bf>
## Základní otázky
- Co je to problém?
  - Z našeho pohledu je problém určité zadání, které je přesně fomulováno
  - Problém = množina přípustnýh vstupů a přiřazení
  - Na příklad, nalezení zaparkovaného auta, ne problém v manželství
- Co je to instrukce?
  - Jednoznačná instrukce (obvikle elementární)
- Co znamená řešit problém? (Algoritmem)
  - Algoritmus je daná sada instrukcí která pro určitý vstup řeší daný problém.
  - Vykonáváním instrukcí podle algoritmu se od vstupu `I` po konečném počtu kroků dobereme k `O`.

## Složitost algoritmu
- Časová složitost
  - Popisuje jak je algoritmus rychlý = efektivita algoritmu z hlediska času
- Paměťová složitost
  - Kolik paměti bude daný algoritmus potřebovat
  
## Časová složitost algoritmu
Vyjadřuje složitost vzhledem k velikosti vstupu.
Určuje kolik je potřeba použít instrukcí pro daný vstup.

## Asymptotická složitost algoritmů

### Asymptotická horní mez (symbol *O*)
- *O*(g(n)) = {f(n) | ∃c > 0 a n<sub>0</sub> ∈ N tak, že ∀n ≥ n<sub>0</sub> je 0 ≤ f(n) ≤ c*g(n)}
- Toto změněná, že pokud jsme schopni najít koeficient c kterým, když vynásobíme složitost funkce g(n), tak od určitého bodu n<sub>0</sub> až do nekonečna bude složitost c*g(n) větší, nebo rovno f(n)

### Asymptotická dolní mez (symbol Ω)
- *O*(g(n)) = {f(n) | ∃c > 0 a n<sub>0</sub> ∈ N tak, že ∀n ≥ n<sub>0</sub> je 0 ≤ c*g(n) ≤ f(n)}
- Toto změněná, že pokud jsme schopni najít koeficient c kterým, když vynásobíme složitost funkce g(n), tak od určitého bodu n<sub>0</sub> až do nekonečna bude složitost c*g(n) menší, nebo rovno f(n)

### Asymptotická oboustranná (*těsná*) mez (symbol Θ)
- *O*(g(n)) = {f(n) | ∃c<sub>1</sub> > 0 a ∃c<sub>2</sub> > 0 a n<sub>0</sub> ∈ N tak, že ∀n ≥ n<sub>0</sub> je 0 ≤ c<sub>1</sub> * g(n) ≤ f(n) ≤ c<sub>2</sub> * g(n)}
- Složitost je asymptoticky oboustranná mez, právě tehdy když je asymptotická horní mez a zároveň asymptotická dolní mez.

### Asymptotická ostrá horní mez (symbol *o*)
- Odhad musí být ostře větší než skutečná složitost.

### Asymptotická ostrá dolní mez (symbol *ω*)
- Odhad musí být ostře menší než skutečná složitost.

## Insert sort
Algoritmus má na vždy levé straně pole seřízené prvky, podívá se na první neseřízený a zařadí ho do seřízené části na správné místo. (Jako kdybychom měli v levé ruce karty a postupně tam přidávali další na správné místo)
``` pascal
Insertion-Sort(A[0..n − 1])
    for j ← 1 to n − 1 do
        t ← A[j]
        i ← j − 1
        while i ≥ 0 and A[i] > t do
            A[i + 1] ← A[i]
        i ← i − 1
        A[i + 1] ← t
```

## Select Sort
Algoritmus prohledává pole a hledá v něm nejmenší prvek, ten vymění s prvkem na první pozici, se podívá na celou neseřízenou část a na ní se algoritmus opět aplikuje.
``` pascal
Selection-Sort(A[0..n − 1])
    for j ← 0 to n − 2 do
        Min ← j
        for i ← j + 1 to n − 1 do
            if A[i] < A[Min] then
                Min ← i
        tmp ← A[j]
        A[j] ← A[iMin]
        A[iMin] ← tmp
```

## Bubble Sort
Algoritmus prochází pole od konce a porovnává sousední prvky, pokud je aktuální prvek menší než předchozí, tak je vymění, výsledek n-tého průchodu je, že na začátku pole bude n seřízený nejmenších prvků v poli.
``` pascal
Bubble-Sort(A[0..n − 1])
    for j ← 0 to n − 2 do
        for i ← n − 1 downto j + 1 do
            if A[i] < A[i − 1] then
                tmp ← A[i]
                A[i] ← A[i − 1]
                A[i − 1] ← tmp
``` 

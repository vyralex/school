# Úvod do informatiky
## Výrok
Výrok je tvrzení, o kterém můžeme rozhodnou, zda je pravdivé či nikoliv. Výrokům lze přiřezovat logické hodnoty: 1 = pravda a 0 = nepravda
- Mám červené auto (toto je výrok)
- Jak se máš? (toto není výrok)

## Logické spojky
Pomocí logických spojek lze vytvářet složitější výroky. 
Výroky se kterými se bude pracovat
- `p` je výrok: Venku prší
- `q` je výrok: Venku je bláto

Negace
- Symbol: `¬` (ne)
- Použití: `¬p` = Venku neprší.
- Logická hodnota: Opačná k výroku `p`.

Konjunkce
- Smybol `⋀` (... a ...)
- Použití: `p ⋀ q` = Venku prší a je tam bláto.
- Logická hodnota: Pokud jsou oba výroky pravdivé, pak je i výsledek pravdivý, jinak je nepravdivý.

Disjunkce
- Symbol: `⋁` (... nebo ...)
- Použití: `p ⋁ q` = Venku prší nebo je venku bláto
- Logická hodnota: Pokud je alespoń jeden z výroků pravdivý, pak je výsledek pravdivý, jinak je nepravdivý.

Implikace
- Symbol: `⇒` (Jestliže ..., pak ...)
- Použití: `p ⇒ q` = Jesliže venku prší, pak je tak bláto.
- Logická hodnota: Pokud je první výkor pravdivý, pak musí být pravdivý i druhý výrok.
  - Pokud není podmínka splněna je výsledek nepravdivý, jinak je pravdivý.

Ekvivalence
- Symbol: `⇔` (... právě tehdy, když ...)
- Požití: `p ⇔ q` = Venku prší právě tehdy, když je tam bláto.
- Logická hodnota: Výsledek je pravdívý pokud jsou ubě hodnoty pravdivé nebo nepravdivé současně.

NAND (negace konjunkce)
- Symbol: `↑` (Neí pravda že ... a ...)
- Použití: `p ↑ q` = Není pravda že venku prší a je tam bláto.
- Logická hodnota: Pokud jsou obě hodnotý pravdivé, pak je výsledek nepravdivý, jinak je pravdivý.

NOR (negace disjunkce)
- Symbol: `↓` (Neí pravda že ... nebo ...)
- Použití: `p ↓ q` = Není pravda že venku prší nebo je venku bláto.
- Logická hodnota: Pokud jsou je alespoň jedna z hodnot pravdivá, pak je výsledek nepravdivý, jinak je pravdivý.

## Kvantifikátory

**Obecký kvantifikátor `∀`** s proměnnou `x`<br>
"Pro každé x platí, že . . . " zapisujeme `∀x`.

**Existencní kvantifikátor** s proměnnou `x`<br>
"Existuje x , pro kter platí . . . "; zapisujeme `∃x`.

## Literál
Literál je každý výrok nebo jeho negace.

## Úplná disjunktivní normální forma
Je disjunkce úplný elementární konjunkcí.<br>
**Úplná elementární konjunkce** je konjunkce všech literálů, kde se každý výrok vyskytuje právě v jednom literálu.

## Úplná konjunktivní normální forma
Je konjunkce úplný elementární disjunkcí.<br>
**Úplná elementární disjunkce** je disjunkce všech literálů, kde se každý výrok vyskytuje právě v jednom literálu.

## Úplný systém logických spojek
Je množina logických spojek, kterými lze vyjádřit jakoukoliv formuli, tak že je s danou formulí tautologicky ekvivalentní.
Například `{¬, ⋁}` nebo `{↓}` atd...

## Množina
Je objekt skládající se z jiných objektů
Množino zapisujeme do složených závorek, kdybychom chtěly zapsat množinu M obsahující prvky a, b, c, tak to zapíšeme takto: `M = {a, b, c}`, prázdnou množinu zapisujeme jako `∅`.

### Základní vztahy mezi množinami
Rovnost `A = B` pokud všechny prvky množiny A jsou i prvky množiny B a naopak.
Inkluze `A ⊆ B` pokud všechny prvky množiny A jsou i prvky množiny B.

### Operace mezi množinami
Máme 2 množiny `A = {a, b, c}` a `B = {c, d, e}`.
- **Průnik** je množina všech prvků, které jsou v obou množinách `A ∩ B = {c}`.
- **Sjednocení** je množina všech prvků, které jsou alespoň v jedné množině `A ∪ B = {a, b, c, d, e}`.
- **Rozdíl** je množina všech prvků, které jsou v první množině, ale nejsou v druhé množině `A / B = {a, b}`.
- **Doplněk** množiny je množina všech prvků, které nejsou v dané množině.

## Relace
Je vztah mezi dvěma množinami, například průnik je relace. <br>
Každé relace je podmnožina kartézského součinu dvou množin.

## Funkce zobrazení
Zobrazení množiny `X` do množiny `Y`, je právě tehdy když pro každé `x ∈ X` existuje právě jedno `y ∈ Y`.<br>
Zapisujeme `R: X → Y`.<br>
Pokud máme `X = {1, 2, 3}` a `Y = {a, b, c}`, pak:
- `{<1, a>, <1, b>, <1, c>}` není zobrazení, protože máme pro prvek `1` více prvků z množiny `Y`.
- `{<1, a>, <2, a>, <3, a>}` je zobrazení, pro každý prvek z `X` máme právě jeden prvek (každý prvek z `X` se zobrazí do `a`).

### Typy zobrazaní
- Injektivní zobrazení je zobrazení, kde každý `x ∈ X` je zobrazeno na jiné `y ∈ Y`.
- Surjektivní zobrazení je zobrazení, kde je do každého `y ∈ Y` zobrazeno alespoň jedno `x ∈ X`.
- Bijektivní zobrazení je takové, které je injektivní i surjektivní současně.

### Binární relace
Pokud je `R` binární relace nad množinou `X`.
- R je **reflexivní**, pokud je každé `x ∈ X` platí, že je zobrazeno samo na sebe.
- R je **symetrická**, pokud platí, že pro každé `x ∈ X` které je zobrazeno na nějaké `y ∈ X`, tak i `y` je zobrazeno na `x`.
- R je **antisymetrická**, pokud pro každé `x, y ∈ X` platí, že pokud existuje relace `<x, y>` a `<y, x>`, pak `x = y`. (Pokud je `x` různé od `y`, pak nemůže být `x` v relaci s `y` a zároveň `y` v relaci s `x`)
- R je **tranzitivní**, pokud pro každé `x, y, z ∈ X`, platí že pokud existuje relace mezi `<x, y>` a `<y, z>`, pak existuje i relace mezi `<x, z>`. 

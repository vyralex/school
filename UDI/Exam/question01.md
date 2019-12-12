# Otázka 1
## Obsah
1. Úvod do logiky
2. Výroky
3. Logické spojky
4. Kvantifikátory
5. Pravdivostní hodnota výroku

## **Logika**
 - Logika je věda o správném usuzování
 - V logice jde o formu usuzování, ne o obsah usuzování.
 - Logika má symbolický charakter.

**Druhy logik**
1. Klasická logika – logika tak, jak ji známe z předmětu
   - Omezený počet logických spojek
   - Výroky nabývají hodnot `pravda` a `nepravda`
   - ...
2. Neklasická logika – Používá se více spojek, výroky mohou mít jiné hodnoty než je pravda a nepravda, atd..
   - modální logika: používá neklasické spojky "je možné, že . . . ", "je nutné, že . . . "
   - epistemická logika: používá neklasické spojky "ví se, že . . . ", "veří se, že . . . "
   - temporální logika (logika casu): zabývá se tvrzeními, ve kterých hraje roli čas.
   - fuzzy logika: zabývá se tvrzeními, které mohou mít kromě pravdivostních hodnot pravda a nepravda i jiné hodnoty.

**Vztah logiky a informatiky**

Informatik/programátor musí sdělit počítači co má dělat pomocí zdrojového kódu, který se vyhodnocuje pomocí pravidel logiky.

## Výroky
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
**Obecký kvantifikátor** `∀` s proměnnou `x`<br>
"Pro každé x platí, že . . . " zapisujeme `∀x`.

**Existencní kvantifikátor** `∃` s proměnnou `x`<br>
"Existuje x , pro kter platí . . . "; zapisujeme `∃x`.

## Pravdivostní hodnota výroku
- Pokud se jedná o atomický výrok, tak jeho pravdivostní hodnota musí být dána z venčí (externí zdroj informací).
- Pokud je výrok složitějších, tak se vyhodnocuje podle logických spojek a výroků které spojují.

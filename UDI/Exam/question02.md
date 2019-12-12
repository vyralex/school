# Otázka 2
## Obsah
1. Jazyk
2. Formule
3. Pravdivostní hodnota formule výrokové logiky

## Jazyk
Jazyk výrokové logiky se skládá z:
1. Výrokových symbolů jako jsou p, q, r, …, případně s indexy p<sub><sub>1</sub></sub>, p<sub><sub>2</sub></sub>, p<sub><sub>3</sub></sub>, ...
2. Logických spojek
3. Pomocných symbolů jako jsou závorky 

## Formule
Formule daného jazyka výrokové logiky je definována následovně:
- Každý výrokový symbol je formule (tzv. atomická formule)
- Jsou-li `ϕ` a `ψ` formule, jsou i výrazy `¬ϕ`, `(ϕ ⇒ ψ)`, popř. dále `(ϕ ∧ψ)`, `(ϕ ∨ψ)`, `(ϕ ⇔ ψ)` formule. 

## Pravdivostní hodnota formule výrokové logiky
Ohodnocením formule je rozumí libovolné zobrazení všech výrokových symbolů do množiny {0, 1}.

Formule je:
1. Tautologie, jestliže je pravdivá při libovolném ohodnocení.
2. Kontradikce, jestliže není pravdivá při žádném ohodnocení.
3. Splnitelné, jestliže je pravdivá alespoň při jednom ohodnocení.

### Sémantické vyplývání
Formule `ϕ` sémanticky vyplývá z množiny `T` formulí, označujeme `T |= ϕ`, jestliže ϕ je pravdivá při každém ohodnocení, při kterém jsou pravdivé všechny formule z `T`.

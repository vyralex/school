# Otázka 5
## Obsah
1. Vyjadřování spojek jinými spojkami
2. Úplné systémy spojek

## Vyjadřování spojek jinými spojkami
Z přednášky známe tyto "nahrazení"
1. `ϕ ∨ ¬ϕ` (zákon vylouceného třetího)
2. `¬(ϕ ∧ ¬ϕ)` (zákon sporu)
3. `¬¬ϕ ⇔ ϕ` (zákon dvojí negace)
4. `(ϕ ∧ ψ) ⇔ (ψ ∧ ϕ)` (komutativní zákon pro ∧)
5. `(ϕ ∨ ψ) ⇔ (ψ ∨ ϕ)` (komutativní zákon pro ∨)
6. `(ϕ ∧(ψ ∧ χ)) ⇔ ((ϕ ∧ ψ) ∧ χ)` (asociativní zákon pro ∧)
7. `(ϕ ∨(ψ ∨ χ)) ⇔ ((ϕ ∨ ψ) ∨ χ)` (asociativní zákon pro ∨)
8. `(ϕ ∧(ψ ∨ χ)) ⇔ ((ϕ ∧ ψ) ∨ (ϕ ∧ χ))` (distributivní zákon)
9. `(ϕ ∨(ψ ∧ χ)) ⇔ ((ϕ ∨ ψ) ∧ (ϕ ∨ χ))` (distributivní zákon)
10. `¬(ϕ ∧ ψ) ⇔ (¬ϕ ∨ ¬ψ)` (de Morganův zákon)
11. `¬(ϕ ∨ ψ) ⇔ (¬ϕ ∧ ¬ψ)` (de Morganův zákon)
12. `(ϕ ⇒ ψ) ⇔ (¬ϕ ∨ ψ)` (náhrada implikace)
13. `¬(ϕ ⇒ ψ) ⇔ (ϕ ∧ ¬ψ)` (náhrada negace implikace)
14. `(ϕ ⇒ ψ) ⇔ (¬ψ ⇒ ¬ϕ)` (zákon kontrapozice)
15. `(ϕ ⇔ ψ) ⇔ ((ϕ ⇒ ψ) ∧ (ψ ⇒ ϕ))` (náhrada ekvivalence)
16. `((ϕ ⇒ ψ) ∧ (ψ ⇒ χ)) ⇒ (ϕ ⇒ χ)` (tranzitivita implikace).

## Úplné systémy spojek
Množina booleovských funkcí {f1,...,fk } je funkcně úplná, pokud každou booleovskou funkci `f: {0, 1}`<sup>`n`</sup>` → {0, 1}` lze vyjádřit jako složení nekterých funkcí z `{f`<sub>`1`</sub>`, ..., f`<sub>`k`</sub>`}`.<br>
To znamená, že pokud je systém spojek úplný, pak pomocí něho můžeme zapsat libovolnou boolovskou funkci.

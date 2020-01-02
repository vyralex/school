# Otázka 23
## Obsah
1. Pojem algoritmu (vlastnosti, druhy)
2. Rekurze

## Pojem algoritmu (vlastnosti, druhy)
Algoritmus je přesný návod či postup, kterým lze vyřešit daný typ úlohy. (Algoritmem rozumíme předpis pro řešení „nejakého“ problému. Algoritmem je například předpis pro konstrukci trojúhelníka pomocí pravítka a kružítka ze tří daných prvků nebo třeba algoritmus pro setřídení posloupnosti čísel.) 

#### Vlastnosti
- **konečnost** (finitnost) každý algoritmus musí skoncit v konečném počtu kroků (v praxi je navíc chtěno, aby požadovaný výsledek byl poskytnut v „rozumném“ čase, ne za milion let).
- **jednoznačnost** (determinovanost) každý krok algoritmu musí být jednoznačně a přesně definován (v každé situaci musí být jasné, co a jak se má provést, jak má provádění algoritmu pokračovat).
- **obecnost** (hromadnost) algoritmus neřeší jen jeden konkrétní problém, ale celou třídu obdobných problémů (např. nejen jak spočítat \( 2 · 6 \), ale např. jak obecně spočítat součin dvou celých čísel).

#### Druhy
- rekurzivní algoritmy
  - využívají (volají) sami sebe
- hladové algoritmy
  - k řešení se propracovávají po jednotlivých rozhodnutích, která jsou nevratná
  - např. Kruskalův algoritmus pro hledání minimální kostry grafu
- algoritmy typu rozdel a panuj
  - dělí problém na menší podproblémy až po triviální podproblémy (které lze vyřešit přímo), dílčí řešení pak vhodným způsobem sloučí
- pravdepodobnostní algoritmy
  - provádějí některá rozhodnutí náhodně či pseudonáhodně
- paralelní algoritmy
  - rozdelení úlohy (třeba) mezi více počítačů
- genetické algoritmy
  - pracují na základě napodobování evolucních procesů, postupným „pěstováním“ nejlepších řešení pomocí mutací a křížení
- algoritmy dynamického programování
  - postupně řeší části problému od nejjednodušších po složitější s tím, že využívají výsledky již vyřešených jednodušších podproblémů
- heuristické algoritmy
  - nekladou si za cíl nalézt přesné řešení, ale pouze nějaké vhodné přiblížení
  - používají se v situacích, kdy dostupné zdroje (např. čas) nepostačují na využití exaktních algoritmů (nebo pokud nejsou žádné exaktní algoritmy vůbec známy)

## Rekurze
#### Dělení 1:
1. **Přímá** (volání sama sebe)
2. **Nepřímá** (2 programy se volají navzájem)
#### Dělení 2:
1. **Lineární** (Program se volá jen jedenkrát)
2. **Stromová** (Program se volá vícerkát, takže má stromovou strukturu)

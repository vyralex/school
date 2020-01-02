# Otázka 22
## Počítání pravděpodobnosti
- Pravděpodobnost javu `A` označujeme `P(A)`
- Počítá se jako počet "vyhovujících" jevů děleno počtem všech jevů.

#### Příklad 1
S jakou pravděpodobností padne na hrací kostce číslo 6?
- Existuje jen jadna možnost jak hodit na kostce číslo 6.
- Celkově může padnout 6 různých čísel.

Pradvěpodobnost je tedy \( \frac{1}{6} \)

#### Příklad 2
Jaká je pravděpodobnost, že při hodu sedmi kostkami padnou nejvýše dvě šestky?
- Budeme sčítat 3 jevy (2 šestky, 1 šestka, 0 šestek)
  - **0 šestek**: \( P(0) = (_{0}^{7})·(\frac{1}{6})^0·(\frac{5}{6})^7 \)
  - **1 šestka**: \( P(1) = (_{1}^{7})·(\frac{1}{6})^1·(\frac{5}{6})^6 \)
  - **2 šestky**: \( P(2) = (_{2}^{7})·(\frac{1}{6})^2·(\frac{5}{6})^5 \)

Pravděpodobnost je tedy \( P(0) + P(1) + P(2) = \frac{5^7 + 7·5^6 + 21·5^5}{6^7} = \frac{3125}{3456} = 0,904... \)

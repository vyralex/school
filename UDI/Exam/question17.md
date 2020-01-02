# Otázka 17

## Princip indukce
Indukce je metoda dokazování.<br>
Princip indukce umožnuje dokazovat tvrzení tvaru "pro každé přirozené číslo `n` platí `V(n)`, kde `V(n)` je nejaké tvrzení, které závisí na `n`.

## Příklad
Dokažme, že součet prvních `n` připozených čísel je roven `(1+n)*n/2`.
1. Indukční předpoklad
   - Neprve tvrzení dokážeme pro "nultý prvek"
   - `1 = (1 + 1) * 1 / 2`
   - `1 = 1`
2. Indukční krok
   - Dokážeme, že pokud tvrzení platí pro n-tý prvek, pak platí i pro n+1. prvek
   - Pokud `1 + 2 + ... + n = (1 + n) * n / 2`,
   - pak`((1+n)*n/2)+n+1 = (1+n+1)*(n+1)/2`
   - po upravení dostaneme: `(n*n)+3n+2=(n*n)+3n+2`, což platí vždy.
  
Tímtom jsme dokazaly, že součtový vzerec aritmetické posloupnosti opravdu platí.

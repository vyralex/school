# Otázka 19
## Obsah
1. Pravidla součtu a součinu
2. Permutace
3. Permutace s opakováním

## Pravidla součtu a součinu
#### Pravidlou součtu
Lze-li úkol `A` provést `m` způsoby a lze-li úkol `B` provést `n` způsoby, přicemž žádný z `m` způsobů provedení úkolu `A` není totožný s žádným z `n` způsobů provedení úkolu `B`, pak lze provést úkol `A` nebo úkol `B` lze `m + n` způsoby.

#### Pravidlo součinu
Lze-li úkol `C` rozložit na po sobě následující úkoly `A` a `B` (tj. provést `C` znamená provést nejdříve `A` a potom `B`) a lze-li úkol `A` provést `m` způsoby a úkol `B` lze provést `n` způsoby, pak lze úkol `C` provést `m · n` způsoby.

## Permutace
- Permutace `n` (navzájem různých objektů) je libovolné seřazení těchto objektů, tj. seřazení od prvního k n-tému. Počet permutací `n` objektů budeme značit `P(n)`.
- `P(n) = n!`.

## Permutace s opakováním
- Je dáno n objektů rozdělených do `r` skupin, které mají po řadě n<sub>1</sub>, ..., n<sub>r</sub> objektů, tj. n<sub>1</sub> + ... +n<sub>r</sub> = n. Objekty v každé ze skupin jsou navzájem nerozlišitelné. Každé seřazení těchto `n` objektů se nazývá permutace s opakováním. Počet takových permutací znacíme P(n<sub>1</sub>, ..., n<sub>r</sub>).
- Pro `n`<sub>`1`</sub>` + ... + n`<sub>`r`</sub>` = n` je `P(n`<sub>`1`</sub>`, ..., n`<sub>`r`</sub>`) = n! / (n`<sub>`1`</sub>`! · ... · n`<sub>`r`</sub>`!)`.

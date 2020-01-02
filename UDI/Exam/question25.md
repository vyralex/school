# Otázka
## Obsah
1. Pojem složitosti
2. Řádové porovnávání funkcí
3. Příklady časové složitosti

## Pojem složitosti
2 druhy:
1. Paměťová složitost (tou se zde nezabíváme)
2. Časová složitost - lze uvažovat jako počet operací

## Řádové porovnávání funkcí
#### Asymptotická horní mez (symbol \( O \))
\( O(g(n)) = \{f(n)\ |\ ∃c > 0\ a\ n_0 ∈ N\ tak,\ že\ ∀n ≥ n_0\ je\ 0 ≤ f(n) ≤ c · g(n)\} \)
#### Asymptotická dolní mez (symbol \( Ω \))
\( O(g(n)) = \{f(n)\ |\ ∃c > 0\ a\ n_0 ∈ N\ tak,\ že\ ∀n ≥ n_0\ je\ 0 ≤ c · g(n) ≤ f(n)\} \)
#### Asymptotická oboustranná (těsná) mez (symbol \( Θ \))
\( O(g(n)) = \{f(n)\ |\ ∃c_1 > 0\ a\ ∃c_2 > 0\ a\ n_0 ∈ N\ tak,\ že\ ∀n ≥ n_0\ je\ 0 ≤ c_1 · g(n) ≤ f(n) ≤ c_2 · g(n)\} \)

## Příklady časové složitosti
- \( O(1) \) – konstantní (indexování prvků v poli)
- \( O(log_2N) \) – logaritmická (vyhledání prvku v seřazeném poli metodou půlení intervalu)
- \( O(N) \) – lineární (vyhledání prvku v neseřazeném poli lineárním vyhledáváním)
- \( O(N · logN) \) – lineárně-logaritmická (seřazení pole \( N \) čísel dle velikosti; třídení sléváním či třídení haldou či quicksort)
- \( O(N^2) \) – kvadratická (třídení \( N \) čísel dle velikosti; přímý výběr či bublinkové třídení)
- \( O(N^3) \), \( O(N^4) \), \( O(N^5) \), ...
- \( O(2^N) \) – exponenciální (Fibonacciho posloupnost řešená pomocí stromové rekurze)
- \( O(N!) \) – faktoriálová (řešení problému obchodního
cestujícího hrubou silou).

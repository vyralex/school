# Paradigmata programovaní 4 (PAPR4)


## Hodina 1 (Úvod)

### Komunikace mezi procesy
- Sdílená paměť
- Zasílání zpráv

### Synchronizace
- Vzájemné vyloučení
  - K jednomu zdroji nemůže najednou přistoupit více procesů
- Podmíněná synchronizace
  - Vykonat procec můžu, až je splněná podmínka

### Synchozační primitiva
- Semofory
- Bariéry
  - Všechny procesy se setkají na jednom místě a až pak mohou pokračovat dále
- Monitory

### Synchronizační problémy
- Producent - Konzument
  - Konzument čeká, až producent něco vyprodukuje. Po té věc zkunzumuje a zase čeká.
- Čtenáři - Písaři
  - Sdílený zdroj, čtenáři mohou číst naráz, ale písaři mosí mít celý zdroj pro sebe

### Rozhraní
- STM = Sofrware transaction memory
  - Pro super počítače
  - Využití databázový transakcí
  - Oddělávájí synchronizační primitiva za cenu opakování transakcí
- MPI = Message passing interface
  - Posílám informace ostatním procesům

### Historie
Historie jsou možnosti, jak se dají prokládat paralelní procesy


## Hodina 2 (Vzájemné vyloučení)

### Podmina programu
Podmina programu je vlastnost, které je splněna pro každou možnou historii
- Podmínka bezpečnosti = nikdy se nestane nic špatného
- Podmínka živosti = vždy se stane něco dobrého
- Podmínka částečné správnosti = pokud program skončí, tak vrátí správný výsledek
- Podmínka ukončení = Program někdy skončí
- Podmínka částečné správnosti = program skončí a vrátí správný výsledek

### Místa
Místa jsou části programu, do kterých lze atomicky zapsat
- Množina zaposovaných míst = všechna místa, do který lze zapsat
- Části programu jsou nezávislé pokud mají disjunktní množiny zapisovaných míst

### Vzájemné vyloučení (Problém kritické sekce)
Do kritické sekce může vstoupit jen `n` procesů (většinou jeden).
Proces přijde do kritické sekce a zamkne ji, ostatní procesy, které chtějí do té samé kritické sekce musí čekat, dokud první proce neodejde a kritickou cekci neodemkne.

#### Podmínky kritické sekce
- Vzájemné vyloučení
- Absence deadlocku = Více procesů se snaží dostat k jednomu zdroji, ale ani jeden nemůže
- Absence zbytečného čekání = Pokud proces může vstoupit do kritické sekce, tak do ní vstoupí
- Podmínka živosti = pokud proces zažádá o vstup do kritické sekce, tak se do ní někdy dostane

### Semafory
Semafor reprezentuje celé číslo
- Má počáteční nezápornou hodnotu
- Hodnota se může inkrementovat i dekrementovat
- Hodnota se nedá přečíst

Pokud je při dekrementaci záporný vísledek, tak je proces zablokován. Pokud jsem na semaforu blokované procesy, tak se jeden odblokuje.


## Hodina 3 (Podmíněná synchronizace)

### Sygnalizace
Proces signalizu ostatním, že někam dorazil

### Bariéra
Místo v programu, kde se všechny příchozí procesy uspí, doku na bariéru nedorazí všechyny procesy


## Hodina 4 (Bariéry a Producent-Konyument)

### Bariéry
Lze nahradit semafory

#### Příklad pro 2 procesy (A a B):
    mutex_A = Semafor(0)<br>
    mutex_B = Semafor(0)
    | Proces A        | Proces B        |
    | --------------- |:---------------:|
    | mutex_B.release | mutex_A.release |
    | mutex_A.acqiure | mutex_B.acqiure |


#### Příklad pro 8 procesů (po kolech)
    Pro každé kole je potřeba nové pole semaforů
    1. Synchronizují se spolu procesy číslo 1 a 2, 3 a 4, 5 a 6, 7 a 8
    2. Synchronizují se spolu procesy číslo 1 a 3, 2 a 4, 5 a 7, 6 a 8
    3. Synchronizují se spolu procesy číslo 1 a 5, 2 a 6, 3 a 7, 4 a 8

### Producent-Konzument (Příklad)

- Producent má inicializované pole čísel.
- Konzument má jen pole.
- Úkolem je překopírovat producentovo pole do konzumentova

#### Podmínky
- Producent zapíše číslo do sdílené proměnné, jen pokud je prázdná
- Konzumen ze sdílené proměnné vezme číslo, jen pokud tam nějaké je

#### Globální proměnné
``` python
shared = None
space = semaphore(1)
item = semaphore(0)
```

#### Producent
``` python
array = [1, 2, 3, ...]
for x in array:
    space.acquire()
    shared = x
    item.release()
```

#### Konzument
``` python
array = [None, None, None, ...]
for i in range(len(array)):
    item.acquire()
    array[i] = shared
    space.release()
```


## Hodina 5 (Čtenáři-Písaři)

2 Typy procesů, které přistupují ke sdílenému zdroji
- Čtenáři čtou ze sdíleného zdroje
- Písaři mohou zapisovat do sdíleného zdroje

### Podmínky
- Číst lze, pokud se nezapisuje
- Zapisovat lze, pokud se nečte, ani se nezapisuje


 ```python
empty = semaphore(1)
lock = semaphore(1)
readers = 0

def writter(id: int):
    empty.acquire()
    write(id)
    empty.release()

def reader(id: int):
    lock.acquire()
    readers += 1
    if readers == 1:
        empty.acquire()
    lock.release()

    read(id)
    
    lock.acquire()
    readers -= 1
    if readers == 0:
        empty.release()
    lock.release()
 ```

Zde hrozí, že pokud čtenářů bude mnoho, tak se písaři vůbec nemusí dotat k zápisu,
proto přidáme turniket.

 ```python
empty = semaphore(1)
lock = semaphore(1)
readers = 0
turniket = semaphore(1)

def writter(id: int):
    turniket.acquire()
    empty.acquire()
    write(id)
    turniket.release()
    empty.release()

def reader(id: int):
    turniket.acquire()
    turniket.release()

    lock.acquire()
    readers += 1
    if readers == 1:
        empty.acquire()
    lock.release()

    read(id)
    
    lock.acquire()
    readers -= 1
    if readers == 0:
        empty.release()
    lock.release()
 ```

## Hodina 6 (Vačeřící filozofové)




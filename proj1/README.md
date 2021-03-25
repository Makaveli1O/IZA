# proj1

## Zadanie

Naimplementujte program v jazyku swift, ktorý pre zadaný vstupný reťazec a nedeterministický konečný automat odsimuluje prechod stavmi nutnými pre prijatie reťazca. Pokiaľ je reťazec akceptovaný končeným automatom, vypíše sa na stdout postupnosť stavov. Pokiaľ reťazec nie je akceptovaný tak program končí chybou. Testované automaty budú obsahovať najviac jednu postupnosť stavov pre prijatie vstupu.

### Spustenie programu

Program je možné spustiť pomocou príkazu `swift run proj1 <vstupny_retazec> <nazov_suboru>` v domovskom priečinku programu (priečinok obsahujúci súbor *Package.swift*).

- `<vstupny_retazec>` - obsahuje jednotlivé symboly oddelené `,` (čiarkou), napr:
    - `swift run proj1 a,b,c automata.json`:  vstupný reťazec obsahuje tri symboly,
    - `swift run proj1 "Prvy,Druhy,Treti,+1š_,Symbol s medzerou" automata.json`: vstupný reťazec obsahuje päť symbolov,
    - `swift run proj1 "" automata.json`:  vstupný reťazec neobsahuje žiadny symbol.
- `<nazov_suboru>` - cesta k súboru obsahujúceho reprezentáciu konečného automatu uloženú vo formáte JSON.

### JSON atribúty

- states - pole reťazcov obsahujúce jednotlivé stavy,
- symbols - pole reťazcov obsahujúce jednotlivé symboly,
- transitions - pole prechodov, kde každý prechod ($`pa \rightarrow q`$) obsahuje atribúty:
    - from - aktualny stav $`q`$,
    - with - aktualny symbol $`a`$,
    - to - nový stav $`q`$,
- initialState - počiatočný stav,
- finalStates - pole koncových stavov.

#### Konečný automat č. 1

- Jazyk automatu: $`L=a^*`$

```javascript
{
  "states" : [
    "A"
  ],
  "symbols" : [
    "a"
  ],
  "transitions" : [
    {
      "with" : "a",
      "to" : "A",
      "from" : "A"
    }
  ],
  "initialState" : "A",
  "finalStates" : [
    "A"
  ]
}
```

#### Konečný automat č. 2

- Jazyk automatu: $`L=(ab)^+c^+`$

```javascript
{
  "states" : [
    "S",
    "AB",
    "C",
    "D"
  ],
  "symbols" : [
    "a",
    "b",
    "c"
  ],
  "transitions" : [
    {
    "with" : "a",
    "to" : "AB",
    "from" : "S"
    },
    {
    "with" : "a",
    "to" : "D",
    "from" : "S"
    },
    {
      "with" : "b",
      "to" : "AB",
      "from" : "S"
    }, {
      "with" : "a",
      "to" : "AB",
      "from" : "AB"
    },
    {
      "with" : "b",
      "to" : "AB",
      "from" : "AB"
    },
    {
      "with" : "c",
      "to" : "C",
      "from" : "AB"
    },
    {
      "with" : "c",
      "to" : "C",
      "from" : "C"
    }
  ],
  "initialState" : "S",
  "finalStates" : [
    "C"
  ]
}
```

### Výstup programu

Program na stdout vypíše jednotlivé stavy, ktorými prešiel počas simulácie vstupného reťazca na konečenom automate. Za každým stavom bude symbol nového riadku LF (\n) a to vrátane posledného symbolu. Ukážkový výstup pre vstupný reťazec *aaa* a ukážkový automat č. 1 je:

```
A
A
A
A
 
```
<!--Na poslednom riadku je medzera, kvôli správnemu renderovaniu-->

Pre reťazec abc a automat č. 2 sa očakáva výstup:

```
S
AB
AB
C
 
```
<!--Na poslednom riadku je medzera, kvôli správnemu renderovaniu-->

### Chybové stavy

Pri detekovaní chyby sa program správne ukončí, na stderr vypíše informácie o chybe a vráti chybový kód podľa následujúcej tabuľky:

| Typ chyby                                    | Návratový kód |
| :------------------------------------------- |:-------------:|
| Vstupný reťacez nie je akceptovaný automatom |       6       |
| Nesprávne arumenty                           |       11      |
| Chyba pri práci so súborom                   |       12      |
| Chyba pri dekódovaní automatu                |       20      |
| Automat obsahuje nedefinovaný stav           |       21      |
| Automat obsahuje nedefinovaný symbol         |       22      |
| Iná chyba                                    |       99      |

## Kostra programu

Pre riešenie využite kostru programu s doporučenou štruktúrou modulov. Každý modul má pripavený samostatný priečinok v priečinku *Sources*. 

### Moduly

Potrebné implementovať:

- *FiniteAutomata* - knižnica pre reprezentáciu a dekódovanie končeného automatu
- *proj1* - modul obsahujúci hlavný kód pre beh programu
- *Simulator* - knižnica pre simuláciu konečného automatu


Preimplementovaný modul: 

- *MyFiniteAutomatas* - Príklady končených automatov, vstupov a výstupu použitých v testoch 

### Testovanie

V kostre sú pripravené aj štyri testovacie sady, ktoré je možné spustiť pomocou príkazu `swift test` v domovskom priečinku projektu. Sady sa nachádzajú v priečinku *Tests/proj1Tests*:

- *FiniteAutomataTests* - dve sady testov pre simulátor,
- *proj1Tests* - dve sady testov pre výslednú binárku.

Doporučuje sa doplniť si aj vlastné testy.

### GitLab CI/CD

V kostre je priložený aj súbor *.gitlab-ci.yml*, ktorý automatický spúšta testy po každom pushnutí do repozitára na gitlabe. Pokiaľ budete využívať službu gitlab tak Vám to môže pomôcť odhaliť chyby hneď ako sa vyskytnú.

### Mac Xcode

Pre vytvorenie projektu pre Xcode *.xcodeproj* na systéme MacOS je možné použíť príkaz `swift package generate-xcodeproj` v domovskom priečinku projektu alebo otvoriť súbor Package.swift.

## Odovzdanie

Odovzdáva sa *xlogin00.zip* s Vaším loginom, ktorý bude obsahovať:

- *Package.swift*
- *Sources/*
- *Tests/*

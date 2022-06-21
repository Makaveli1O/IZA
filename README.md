# IZA 8/10
Programování zařízení Apple


Zadanie
Naimplementujte program v jazyku swift, ktorý pre zadaný vstupný reťazec a nedeterministický konečný automat odsimuluje prechod stavmi nutnými pre prijatie reťazca. Pokiaľ je reťazec akceptovaný končeným automatom, vypíše sa na stdout postupnosť stavov. Pokiaľ reťazec nie je akceptovaný tak program končí chybou. Testované automaty budú obsahovať najviac jednu postupnosť stavov pre prijatie vstupu.

# Spustenie programu
Program je možné spustiť pomocou príkazu swift run proj1 <vstupny_retazec> <nazov_suboru> v domovskom priečinku programu (priečinok obsahujúci súbor Package.swift).


<vstupny_retazec> - obsahuje jednotlivé symboly oddelené , (čiarkou), napr:


# swift run proj1 a,b,c automata.json
vstupný reťazec obsahuje tri symboly,

# swift run proj1 "Prvy,Druhy,Treti,+1š_,Symbol s medzerou" automata.json
vstupný reťazec obsahuje päť symbolov,

# swift run proj1 "" automata.json
vstupný reťazec neobsahuje žiadny symbol.



<nazov_suboru> - cesta k súboru obsahujúceho reprezentáciu konečného automatu uloženú vo formáte JSON.


## JSON atribúty

states - pole reťazcov obsahujúce jednotlivé stavy,
symbols - pole reťazcov obsahujúce jednotlivé symboly,
transitions - pole prechodov, kde každý prechod (pa→qpa \rightarrow qpa→q) obsahuje atribúty:

from - aktualny stav qqq,
with - aktualny symbol aaa,
to - nový stav qqq,


initialState - počiatočný stav,
finalStates - pole koncových stavov.

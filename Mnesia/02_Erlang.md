# Erlang

Erlang ist eine funktionale Programmiersprache. Allerdings nicht nur eine Sprache, sondern ein komplettes Laufzeitsystem. Sie wurde von Joe Armstrong für Ericcson entwickelt.
Sie wurde für einen sehr speziellen Anwenungsgrund konzipiert, nämlich die Verwendung in Telekommunkitationsnetzen. Daher sind folgende Anforderungen bereits in die Konzeption der Sprache eingeflossen:

* Ausfallsicherheit
* Nebenläufigkeit
* Fehlertoleranz
* Updates im laufenden Betrieb


## Datentypen
Wie jede gängige Programmiersprache stellt auch Erlang bestimmte Basis-Datentypen zur Verfügung.

### Atoms
Atoms sind symbolische Konstanten, ihnen wird kein Wert zugeordnet, sondern lediglich ihr Name. Das ähnlichste Äquivalent aus der C oder Java Welt sind *Enums*. Atoms können unter anderem genutzt werden um einen State anzuzeigen, oder einen Zustand, dem kein eigener Wert innewohnt (z.B. Wochentage).

### Zahlentypen
Erlang unterscheided Ganzzahlen (Integer) und Gleitkommazahlen (Float), wobei bei manchen Operationen einen automatische umwandlung erfolgt. Das Ergebnis einer Division zweier Integer wird beispielsweise immer als Float angegeben.

### Tuple
Möchte man verschiedene Information gekapselt verwalten, bietet sich unter Erlang der Datentyp *Tuple* an. Sie verhalten sich ähnlich wie *Structs* in C, sind allerdings anonym. SIe werden mit geschweiften Klammern umrandet.

``` erlang
Hund = {hund,
          {name, "Bello"},
          {race, labrador}
          {colour, brown}}.
```

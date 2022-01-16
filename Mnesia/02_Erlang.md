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
Hund = {dog,
          {name, "Bello"},
          {race, labrador}
          {colour, brown}}.
```

### List
Listen können verwendet werden, um eine Menge von gleichen Elementen zu speichern. Eine Vereinfachung im Arbeiten mit Listen ist die Unterteilung in **[H|T]**, wobei *H* für Head, also das erste Element der Liste und *T* für Tail, die restlichen Elemente der Liste steht. Dies erlaub in vielen Anwendungsfällen einen eleganten umgang mit Listen.
``` erlang
Suitcase = [{socks,3}, {trousers,2}]
```

### Strings
Strings sind Erlang eine Sonderlösung, eigentlich sind es nur Integerlisten, wobei die Zahlen der ISO-8859-1 Kodierung entsprechen. Wenn in der Erlang Shell eine Liste mit gültigen Codes eingegeben wird, wird der entsprechende String zurückgegeben.
``` erlang
7> [72,97,108,108,111].
"Hallo"
```

### Binaries
Binaries sind eine Datenstruktur, um große Datenmengen effizient (platzeffiezient) abzulegen. Es können Strings und Integer abgelegt werden. In diesem Fall sind Strings ASCII kodiert und Integer können nicht größer als 255 sein.  Binaries können außerdem verwendet werden, um UTF-8 kodierte Strings zu definieren.
``` erlang
17> Z = <<"Tür"/utf8>>. 
<<"Tür"/utf8>>
```

### TODO: Evtl noch etwas zu Records?

## Programmstruktur
### Module
Die Programmstruktur ist relativ einfach. Abläufe werden in Funktionen definiert, diese Funktionen wiederum werden in sogenannten *Modulen* zusammengefasst. Module werden in Dateien mit dem Suffix **.erl** abgespeichert. Um dieses Modul nutzen zu können, muss es vorher kompiliert werden. Anschließend ist eine *.beam* Datei erstellt worden. Analog zu Java  .java -> .class gibt es bei Erlang .erl -> .beam.
Ein Modul wird definiert durch einen Namen und einer Liste an Funktionen die es bereitstellt. Bei diesen Funktionen wird außerdem angegeben, wieviele Parameter sie erwarten.
``` erlang
-module(elephant).
-export([toot/0]).

toot() -> io:format("Tooot").
```

### Funktionen
In Erlang haben Funktionen eine Bezeichnung, sowie eine Anzahl an Variablen. Erlang arbeitet extensiv mit Pattern-Matching, d.h. beim Aufruf einer Funktion wird meist schon zu Beginn in eine bestimmte *Clause* gesprungen
``` erlang
animal_noise(elephant) -> "Tooot";
animal_noise(cat) -> "Meow";
animal_noise(dog) -> "Wuff";
animal_noise(Unknown) -> "???".

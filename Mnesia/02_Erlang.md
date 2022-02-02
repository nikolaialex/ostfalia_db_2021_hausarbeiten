
<img src="assets/erlang-logo.svg" width="300" />

# Erlang

Erlang ist eine funktionale Programmiersprache. Allerdings nicht nur eine Sprache, sondern ein komplettes Laufzeitsystem. Sie wurde von Joe Armstrong für Ericcson entwickelt.
Sie wurde für einen sehr speziellen Anwendungsgrund konzipiert, nämlich die Verwendung in Telekommunikationsnetzen. Daher sind folgende Anforderungen bereits in die Konzeption der Sprache eingeflossen:

## Kernkonzepte
* Ausfallsicherheit
* Nebenläufigkeit
* Fehlertoleranz
* Updates im laufenden Betrieb

Jeder dieser Begriffe ist für sich bereits ein beeindruckendes Konzept in der Informatik. Da in dieser Ausarbeitung damit gearbeitet wird, folgt, sollen sie daher kurz definiert werden.

<dl>
  <dt>Ausfallsicherheit</dt>
  <dd>Die Eigenschaft, Verfügbarkeit eines Dienstes zu gewährleisten. Joe Armstrong, der Erfinder von Erlang, rühmt sich damit, dass Erlang-Code in einem Sytem, dass für 20 Jahre eingesetzt wurde eine Verfügbarkeit von "nine nines"[], also Eine Ausfallsicherheit von 99,9999999% erreicht zu haben</dd>
</dl>

<dl>
  <dt>Nebenläufigkeit</dt>
  <dd>Nebenläufigkeit ist der große und oftmals unbekannte Bruder der Parallelität. Nebenläufigkeit meint die Fähigkeit eines Systems, mehrere Prozesse unabhängig, bzw. getrennt von einander abzuarbeiten. Es ist eines **der** Kernkonzepte von Erlang und spielt auch für *Mnesia* eine große Rolle.</dd>
</dl>

<dl>
  <dt>Fehlertoleranz</dt>
  <dd>Die Fähigkeit eines Systems kontinuierlich zu funktionieren und in einem Fehlerfall durch verschiedene Mechanismen wieder einen funktionierenden Zustand zu erreichen</dd>
</dl>

<dl>
  <dt>Updates im laufenden Betrieb</dt>
  <dd>Ein weiteres sehr interessantes Konzept der Programmiersprache, die leider diese Ausarbeitung sprengen würde ist die Fähigkeit von Erlang, Frameworks/Richtlinien bereitzustellen, nach deren Implementierung Updates in das laufende System einspielen zu können.</dd>
</dl>

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
Binaries sind eine Datenstruktur, um große Datenmengen effizient (platzeffizient) abzulegen. Es können Strings und Integer abgelegt werden. In diesem Fall sind Strings ASCII kodiert und Integer können nicht größer als 255 sein.  Binaries können außerdem verwendet werden, um UTF-8 kodierte Strings zu definieren.
``` erlang
17> Z = <<"Tür"/utf8>>.
<<"Tür"/utf8>>
```

### Records

Eine weitere wichtige Datenstruktur, die auch intensiv von *Mnesia* genutzt werden sind die sog. **Records**. Möchte man Daten strukturiert ablegen, bieten sich bisher *Tuple* an, allerdings können diese leicht unübersichtlich werden, falls die Anzahl der Elemente zu groß wird. Da die Position der einzelnen Elemente anonym ist, muss sich gemerkt werden an welcher Position welches Datum liegt. In diesem Fall kann der Datentyp **Record** genutzt werden, da jedem Wert ein Key zugerodnet wird.

``` Erlang
-record(Hund, {
  name,
  rasse,
  alter,
  farbe,
}).
```
### EVTL Hier noch was zu ETS/DETS?
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
```

### Green Threads
Ein Kernkonzept, dass in die Grundstruktur von Erlang eingeflossen ist, ist die *Nebenläufigkeit* von Programmcode. In Erlang wird dies vorzugsweise via *Green Threads* gelöst. Bei diesem Konzept handelt es sich um Threads, die von der Erlang Virtual Machine erstellt und verwaltet werden. Sie sind Teil der Grundstruktur der Sprache und sehr einfach zu verwalten.
Gelöst wird dies durch sogenanntes **Message Passing** und **Prozesse**. Jede Funktion kann sehr leicht als eigener Prozess gestartet werden. Jeder neue Prozess hat dabei eine eigene Id, über die er angesprochen werden kann, indem Nachrichten an diesen Prozess geschickt werden. Diese Nachrichten werden dann in einem *first in, first out*-Prinzip abgearbeitet.

## OTP
Die Sprache Erlang steht nicht nur alleine, sie hat auch ihr eigenes Ökosystem, die sogenannte **O**pen **T**elecom **P**latform. Es stellt mehrere Bibliotheken und Vorgehensweise bereit, um Anwendungen verteilt und fehlertolerant implementieren zu können, auch bei skalierender Anforderung.

[**Weiter**](./03_verteilte_Datenbanken.md)

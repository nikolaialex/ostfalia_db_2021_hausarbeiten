# Allgemeine Gegenüberstellung von RDBS und GDB

In der Verwendung von Graphdatenbanken findet man die selben Interaktionsmethoden wie in relationalen Datenbanksystemen, 
namentlich Create, Read, Update and Delete (CRUD). Unter der Haube befindet sich jedoch anstatt von Tabellen, die
die Informationen organisieren, ein Graph Model.
Der wesentliche Unterschied hierbei ist, dass die Verbindung von Informationen, also Kanten des Graphs, zwischen den einzelnen
Datensätzen besteht und nicht, wie in einem relationalem Ansatz, auf einer höheren Ebene, den Tabellen. Diese fehlende
Ebene macht die Graphdatenbank performanter in der Geschwindigkeit, jedoch nur bei bestimmten Datenabfragen (hierzu
auch mehr in der Untersuchung mittels [Benchmark Tests](#Benchmark-Tests)). Die Gegenseite dieses Aspekts ist natürlich die dadurch entstehende Größe
einer Graphdatenbank, da alle Kanten einzeln gespeichert werden müssen. Diese verschiedenen Auswirkungen müssen, um eine optimale
Wahl der Datenbank zu treffen, stets im Nutzungskontext der Datenbank abgewogen werden.

## Objektive und subjektive Aspekte zum Vergleich von RDBS und GDB

Datenbanksysteme können anhand verschiedener Aspekte verglichen werden.
Einige dieser Aspekte beziehen sich auf objektive Eigenschaften, wie beispielsweise die Geschwindigkeit von Queries.
Subjektive Eigenschaften hingegen sind solche, die im Zusammenhang mit externen Faktoren stehen, wie zum Beispiel
die Sicherheit eines Datenbanksystems, die nur im Zusammenhang mit dem Nutzungskontext dieser Datenbank eingeschätzt
werden kann.

Zur Gegenüberstellung von Relationalen Datenbanksystemen und Graph-Datenbanken möchten wir einige Aspekte herausstellen
und anhand dieser Vor- und Nachteile der verschiedenen Systeme aufzeigen.
Zunächst möchten wir folgende **objektive Eigenschaften** betrachten:

### Geschwindigkeit
Die Geschwindigkeit eines Datenbanksystems erschließt sich aus der Schnelligkeit mit der bestimmte Queries ausgeführt
werden. Diese Queries können jegliche CRUD Interaktionen sein.
Je nach Nutzungskontext eines Datenbanksystems kann es von großer Bedeutung sein, dass eine Query schnell die gewünschten
Ergebnisse liefert. Dauert eine Abfrage zu lange, kann dies beispielsweise im Nutzungskontext eines Online-Shops heißen,
dass der Kunde die Seite schon verlassen hat.
Die Geschwindigkeit ist nicht für jede Art von Query gleich. Es bestehen Unterschiede darin, nach welcher Art von Daten
gesucht wird: Strings oder numerische Daten. Auch die Traversion einer Datenbank kann in bestimmten Fällen ein häufiger
Anwendungsfall sein, dessen Geschwindigkeit also von Bedeutung sein kann.
Deshalb ist es wichtig, abzuwägen, wie essentiell die Geschwindigkeit einer Datenbank für den eigenen Anwendungsfall ist.
### Größe/Disk Space
Ebenfalls abzuwägen gilt die Größe der Datenbank, je nachdem wie viel Disk Space bzw. Server Space einem zur Verfügung
steht. Man nehme als Beispiel einen Anbieter wie den Kurznachrichtendienst Twitter, dessen Datenbank auf MySQL basiert,
und täglich circa 400 Millionen Tweets verarbeitet (Stand 2012) [[1]](#winterford). Bei solch einer Menge an Daten kann es von großer Bedeutung sein,
durch die Wahl der richtigen Datenbank Disk Space einzusparen.

Zu den **subjektiven Aspekten**, die wir betrachten wollen, gehören Flexibilität, Ease of Use und Support.

### Flexibilität
Die Flexibilität einer Datenbank beschreibt die Möglichkeit der Anpassung des unterliegenden Schemas. Bei einer SQL Datenbank
sind dies die Tabellen, ihre Spalten und die Verbindung zu anderen Tabellen. Das Anpassen eines Datentyps in verschiedenen Spalten
oder auch das Hinzufügen oder Aufteilen von Tabellen kann dazu führen, dass größere Änderungen am gesamten Schema vorgenommen werden müssen.
### Ease of Use
Die Ease of Use bezeichnet die Einfachheit der Interaktion mit der Datenbank, also im Wesentlichen die Verwendung
von Queries und allen anderen Interaktionsmöglichkeiten.
### Support
Der gegebene Support für eine Datenbank variiert je nach Anbieter, wird jedoch auch dadurch beeinflusst, wie weit verbreitet
die Nutzung der jeweiligen Datenbank ist. Je mehr Nutzer, desto größer wird oft auch der Support durch eine Community
der Nutzer. Eine größere Menge an Menschen, die sich mit der Software auskennen, trägt dazu bei, kontinuierlichen Support
zu haben.

## Gegenüberstellung

| Aspekt       | RDBS                                                                                                                                                                                                        | Graph-Datenbank                                                                                                                                                              |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Support      | große Community, da RDBS weiter verbreitet sind; oft offizieller Support (bspw. MySQL)                                                                                                                      | weniger Support bei vielen Graphdatenbanken; keine fest bestehende Community, d.h. sollte eine Graphdatenbank als Projekt nicht mehr existieren, bricht auch der Support ein |
| Ease of Use  | Viele SQL Datenbanken verwenden die gleiche oder ähnliche Query Language, somit ist die Logik einfach übertragbar; Tabellen sind einfach zu verstehen und können zum Teil auch als Graph dargestellt werden | Kann nicht als Tabelle dargestellt werden, schwer verständlich; Keine übertragbare Query Language, sondern oft eine individuelle API                                         |
| Flexibilität | Änderungen im Schema sind möglich, jedoch häufig aufwendig                                                                                                                                                  | Änderungen im Schema sind leicht vorzunehmen                                                                                                                                 |

[[2]](#vicknair)
## Benchmark Tests

| Benchmark                                                     | RDBS                                                                                                            | Graph-Datenbank                         |
|---------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------|
| Suche nach Strings mit zufälligen Daten (nur Buchstaben)      | Deutlich schneller                                                                                              | Deutlich langsamer                      |
| Suche nach Strings mit “realen” Daten (inklusive Leerzeichen) | Deutlich langsamer                                                                                              | Deutlich schneller                      |
| Suche nach Numerics                                           | Deutlich schneller                                                                                              | Deutlich langsamer                      |
| Traversal (Durchlaufen der DB)                                | Nicht für Traversal designed; deutlich langsamer, da viele Queries ausgeführt werden müssen, oft sogar rekursiv | Deutlich schneller                      |
| Suche nach Nodes mit bestimmten Eigenschaften                 | vergleichbar                                                                                                    | vergleichbar                            |
| Scalability (Größe/Disk Space)                                | kleiner                                                                                                         | Ca. 1.25-2x so viel Disk Space wie RDBS |

[[2]](#vicknair)
<hr>
<a name="winterford">[1] </a>  Winterford, B. (2012, October 5). Twitter, PayPal Reveal Database Performance. iTnews. Retrieved January 5, 2022, from https://www.itnews.com.au/news/twitter-paypal-reveal-database-performance-317811#:~:text=Cole%20revealed%20that%20Twitter's%20MySQL,and%20a%20sole%20MySQL%20developer. <br>
<a name="vicknair">[2] </a>  Vicknair, C., Macias, M., Zhao, Z., Nan, X., Chen, Y., & Wilkins, D. (2010). A comparison of a graph database and a relational database. https://doi.org/10.1145/1900008.1900067 <br>

<hr>

[< Grundlagen](./2_Grundlagen.md) | [Graphdatenbanken am Beispiel von Neo4j >](./4_Neo4J.md)

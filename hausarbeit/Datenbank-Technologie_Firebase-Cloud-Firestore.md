II



![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.001.png)



**Firebase Cloud Firestore**


**Datenbank-Technologien**



Georges A. K. Bonga

Matrikel: 20223343




Betreuer: Prof. 




Brandenburg an der Havel, 10. Februar 2022

**Inhaltsverzeichnis**

[1**	**Einleitung	1****](#_Toc95443345)**

[1.1	NoSQL Datenbanken?	1](#_Toc95443346)

[1.2	Firebase Cloud Firestore?	2](#_Toc95443347)

[**2**	**Cloud Firestore-Datenmodell und Datentypen	4****](#_Toc95443348)

[**3**	**Zugriff und Sicherheit Regeln	7****](#_Toc95443349)

[**4**	**Entwicklungsumgebung und Cloud Firestore Abfragen	11****](#_Toc95443350)

[4.1	Entwicklungsumgebung	11](#_Toc95443351)

[4.2	Abfragen	12](#_Toc95443352)

[4.2.1	Daten schreiben	13](#_Toc95443353)

[4.2.2	Daten lesen	17](#_Toc95443354)

[4.2.3	Transaktionen und Batched Writes	20](#_Toc95443355)

[**5**	**Cloud Firestore Nutzung, Grenzen und Preis	21****](#_Toc95443356)

[**6**	**Vor – und Nachteile von Firebase Cloud Firestore	22****](#_Toc95443357)

[6.1	Vorteile von Cloud Firestore	22](#_Toc95443358)

[6.2	Nachteile von Cloud Firestore	23](#_Toc95443359)









#1. Einleitung
Heutzutage muss fast jede Applikation Daten speichern oder auf Daten zugreifen, die irgendwo gespeichert sind. Für die Speicherung der Daten waren SQL-Datenbanken lange Zeit die Standardlösung. Mit der Zeit haben sich immer mehr Alternative entwickelt, zum Beispiel, NoSQL Datenbanken. In dieser Arbeit wird die NoSQL Datenbank Cloud Firestore vorgestellt. 

1. ## **NoSQL Datenbanken?**
In der Vergangenheit waren SQL-Datenbanken der Standard. In SQL-Datenbanken werde Elemente in Tabelle gespeichert, die ein bestimmtes Schema haben. Es ist genau definiert welche Spalten jede Zeile haben muss und welche Datentypen in den Zellen gespeichert werden. Aus diesem Grund kann man in der Regel nur einen einzigen Objekttyp in einer Tabelle Speichern und bei jeder Änderung des Datenmodells, müssen alle alten Daten angepasst werden.

In einer NoSQL Datenbank, gibt es keine Einschränkung was die Datentypen angeht, die in dir Datenbank gespeichert werden können. Es gibt auch keine festen Schemata, wie in SQL-Datenbanken. In einer NoSQL-Datenbank gibt es verschiedene Möglichkeiten Daten zu speichern. Man kann Daten als Key-Value Paare, als eine verschachtelte Baum-Struktur, als JSON-Objekte oder als etwas anderes speichern. Daten, die in der SQL-Welt in unterschiedlichen Tabellen gespeichert wären, können alle zusammen in NoSQL Datenbanken gespeichert werden. In einer NoSQL Datenbank müssen nicht alle Einträge die gleichen Felder haben oder die gleiche Länge. Das gibt Entwicklern eine große Flexibilität, weil bei Änderungen nicht gleich alle alten Einträge angepasst werden müssen.
1. ## **Firebase Cloud Firestore?**
Firebase Cloud Firestore ist eine, in der Cloud gehostete, horizontal skalierbare NoSQL Datenbank[^1]. Sie wurde von Google entwickelt. Eine Cloud Firestore Datenbank besteht aus Dokumenten und Sammlungen von Dokumenten, die in einer Baumstruktur gespeichert sind. Dokumente ähneln JSON Objekte. Sie bestehen aus Key-Value Paare, die Felder genannt werden. In einer Cloud Firestore Datenbank kann man sehr unterschiedliche Datentypen speichern. Die Tabelle 1 zeigt eine Übersicht der Datentypen, die in Cloud Firestore verwendet werden können.


|**Datentyp**|**Sortierreihenfolge**|**Anmerkungen**|
| :- | :- | :- |
|Array|By element values|An array cannot contain another array value as one of its elements.<br><br>Within an array, elements maintain the position assigned to them. When sorting two or more arrays, arrays are ordered based on their element values.<br><br>When comparing two arrays, the first elements of each array are compared. If the first elements are equal, then the second elements are compared and so on until a difference is found. If an array runs out of elements to compare but is equal up to that point, then the shorter array is ordered before the longer array.<br><br>For example, [1, 2, 3] < [1, 2, 3, 1] < [2]. The array [2] has the greatest first element value. The array [1, 2, 3] has elements equal to the first three elements of [1, 2, 3, 1] but is shorter in length.|
|Boolean|false < true|—|
|Bytes|Byte order|Up to 1,048,487 bytes (1 MiB - 89 bytes). Only the first 1,500 bytes are considered by queries.|
|Date and time|Chronological|When stored in Cloud Firestore, precise only to microseconds; any additional precision is rounded down.|
|Floating-point number|Numeric|64-bit double precision, IEEE 754.|
|Geographical point|By latitude, then longitude|At this time, we do not recommend using this data type due to querying limitations. It is generally better to store latitude and longitude as separate numeric fields. If your app needs simple distance-based geoqueries, see Geo queries|
|Integer|Numeric|64-bit, signed|
|Map|By keys, then by value|Represents an object embedded within a document. When indexed, you can query on subfields. If you exclude this value from indexing, then all subfields are also excluded from indexing.<br><br>Key ordering is always sorted. For example, if you write {c: "foo", a: "bar", b: "qux"} the map is sorted by key and saved as {a: "bar", b: "qux", c: "foo"}.<br><br>Map fields are sorted by key and compared by key-value pairs, first comparing the keys and then the values. If the first key-value pairs are equal, the next key-value pairs are compared, and so on. If two maps start with the same key-value pairs, then map length is considered. For example, the following maps are in ascending order:<br><br>{a: "aaa", b: "baz"}<br>{a: "foo", b: "bar"}<br>{a: "foo", b: "bar", c: "qux"}<br>{a: "foo", b: "baz"}<br>{b: "aaa", c: "baz"}<br>{c: "aaa"}|
|Null|None|—|
|Reference|By path elements (collection, document ID, collection, document ID...)|For example, projects/[PROJECT\_ID]/databases/[DATABASE\_ID]/documents/[DOCUMENT\_PATH].|
|Text string|UTF-8 encoded byte order|Up to 1,048,487 bytes (1 MiB - 89 bytes). Only the first 1,500 bytes of the UTF-8 representation are considered by queries.|
Tabelle 1: Cloud Firestore unterstützte Datentypen

Die Tabelle 1 zeigt auch die Sortierreihenfolge der Datentypen, die unterstützt werden. Es kommt aber vor, dass unterschiedliche Datentypen in Abfragen gemischt werden. In diesem Fall gilt die folgende Sortierreihenfolge:
-
- 1. Null values
- 1. Boolean values
- 1. Integer and floating-point values, sorted in numerical order
- 1. Date values
- 1. Text string values
- 1. Byte values
- 1. Cloud Firestore references
- 1. Geographical point values
- 1. Array values
- 1. Map values
1. # **Cloud Firestore-Datenmodell und Datentypen**
Cloud Firestore ist eine dokumentorientierte NoSQL-Datenbank. Das bedeutet, dass Daten in einer Cloud Firestore Datenbank in Dokumente gespeichert werden. Diese Dokumente werden in Sammlungen (collections) organisiert[^2].

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.002.png)

Abbildung 1: Cloud Firestore Datenmodell[^3]

Für eine Cloud Firestore Datenbank, gelten folgende Regeln:

- - Dokumente können Untersammlungen (subcollections) enthalten oder verschachtelte Objekte.
- - Sammlungen können nur Dokumente enthalten
- - und Dokumenten können nicht größer als 1 MB sein. 
- - Ein Dokument kann kein Dokument enthalten.
- - Es kann maximum 40.000 Indexe in einem Dokument geben
- - Zwei Dokumente in einer Sammlung / Kollektion können nicht den gleichen Namen haben.

Die Größe der Dokumente ist begrenzt, weil Cloud Firestore für die Speicherung großer Sammlungen von vielen kleinen Dokumente optimiert ist.

Kollektionen müssen nicht explizit erstellt oder gelöscht werden. Bei einer Zuweisung wird die Kollektion automatisch erstellt, wenn sie noch nicht existiert. Wenn alle Dokumente gelöscht werden, existiert die Sammlung auch nicht mehr.

In einem Dokument, unterstützt Cloud Firestore verschieden Datentypen. In einem Dokument kann man Boolean, Zahlen, Strings, Binären Blob, geo Punkte, und Zeitstempel speichern.

Für eine Chat-Applikation könnte man zum Beispiel die Benutzerdaten in einem Dokument speichern. Alle Benutzer könnten dann in einer Sammlung/Kollektion gespeichert werden. So ein Dokument könnte die folgende Struktur haben:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.003.png)schneider

`		`firstname : "Max"

`		`lastname : "Schneider"

`		`geburtsdatum : "10.10.2010"

Das ist aber nur eine Option. Das Dokument könnte auch eine andere Struktur haben:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.003.png)

schneider

`		`name : "Max"

`			`lastname : "Schneider"

`			`lastname : "Schneider"

`		`geburtsdatum : "10.10.2010"

Solche komplexen, verschachtelten Objekte nennt man Maps in Cloud Firestore.

Cloud Firestore Dokumente können in der Regel so behandelt werden, wie JSON. In einer Sammlung /Kollektion, hat man Dokumenten. Eine Sammlung von Benutzer für eine Chat App könnte wie folgt aussehen:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.004.png)

Benutzer

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.003.png)schneider

`	`name : "Max"

`			`lastname : "Schneider"

`			`lastname : "Schneider"

`		`geburtsdatum : "10.10.2010"

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.003.png)

schneider

`	`name : "Max"

`			`lastname : "Schneider"

`			`lastname : "Schneider"

`		`geburtsdatum : "10.10.2010"



1. # **Zugriff und Sicherheit Regeln**
Eine Cloud Firestore Datenbank kann in der Firebase Konsole erstellt werden. Dort muss man einfach auf „Create Database“ klicken.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.005.png)

Abbildung 2: Datenbank erstellen in der Developer Console

Bei Cloud Firestore spielt die Sicherheit eine große Rolle, deshalb wird man gleich am Anfang damit konfrontiert. Wenn man auf Create Database klickt, muss man zuerst die Sicherheitsregeln für die Datenbank auswählen.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.006.png)

Abbildung 3: Auswahl des Sicherheitsmodus bei der Erstellung einer Datenbank

Es gibt in der Regel zwei Modi zur Auswahl: 
-
- - Produktionsmodus: Die Datenbank ist privat und kann nur von zugelassenen Anwendungen erreicht werden.
- - Testmodus: die Datenbank ist offen und kann von allen erreicht werden, die einen Link haben

Der Testmodus ist aber nur für 30 Tage verfügbar. Damit die Datenbank länger erreichbar ist, muss man die Sicherheitsregeln aktualisieren, sonst wird der Zugang deaktiviert.

Nach den Sicherheitsregeln kommt die Auswahl des Standortes der Datenbank. 

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.007.png)

Abbildung 4: Auswahl des Standortes für die Datenbank

Es ist möglich sich für eine Region zu entscheiden oder für einen geographischen Standort. Wenn man sich für eine Region entscheidet, wie Europa zum Beispiel, werden die Daten in mehreren Datenzentrenk dieser Region repliziert. Cloud Firestore unterstützt momentan zwei Regionen (Siehe Abbildung 5): „Europa“ und die „USA“

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.008.png)

Abbildung 5: Multiregionale Cloud Firestore Standorte

Wenn man sich für einen geographischen Standort /regionalen Standort entscheidet, stehen die folgenden Optionen zur Verfügung (Abbildung 6):

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.009.png)

Abbildung 6: Cloud Firestore Standorte[^4]

Bei regionalen Standorten werden die Daten nicht in einem anderen Datenzentrum repliziert. Bei einem Ausfall des Standortes, wären alle Daten nicht mehr verfügbar.

Nach der Auswahl des Standortes, wird die Datenbank erstellt und steht direkt zu Verfügung (siehe Abbildung 7).

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.010.png)

Abbildung 7: Eine leere Cloud Firestore Datenbank

Wenn eine Datenbank so erstellt ist, ist sie nur für 30 Tage erreichbar. Um sie weiter nutzen zu können, müssen die Sicherheitsregeln aktualisiert werden. Entwickler haben hier zwei Optionen abhängig von den Clientbibliotheken, die verwendet werden.
-
- - Für Mobil- und Webclientbibliotheken sollen die Firebase-Authentifizierung und die Cloud Firestore Sicherheitsregeln für die serverlose Authentifizierung, Autorisierung und Datenvalidierung verwendet werden.
- - Für Sever-Clientbibliotheken soll die Identitäts- und Zugriffsverwaltung (IAM) verwendet werden, um den Zugriff auf die Datenbank zu verwalten.
1. # **Entwicklungsumgebung und Cloud Firestore Abfragen**
Bevor man Abfragen verwendet, muss zuerst eine Datenbank erstellt werden. Das geht sehr einfach in der Firebase Konsole. Danach muss man die Entwicklungsumgebung einrichten.
1. ## **Entwicklungsumgebung**
Damit eine Anwendung mit Cloud Firestore arbeiten kann, muss Firebase, während der Entwickelung, dem Projekt hinzugefügt werden. Dann müssen Bibliotheken hinzugefügt werden, die die Anwendung für Cloud Firestore braucht. Firebase unterstützt mehrere Programmiersprachen und Plattformen wie iOS, Android Java, Node.js. oder Go.

Für eine Android Anwendung, wenn Firebase dem Projekt hinzugefügt wurde, müssen folgende Zeilen in der Gradle-Datei auf der Module Ebene hinzugefügt werden.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.011.png)

Abbildung 8: Cloud Firestore einem Android Projekt hinzufügen (Ohne BoM)

Wenn man mehrere Firebase Bibliotheken verwendet, muss man für jede Bibliothek manuell eine Version eingeben. Um die Versionen nicht einzeln manuell zu schreiben, kann man BoM (Bill of Materials) verwenden (siehe Abbildung 9).

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.012.png)

Abbildung 9: Cloud Firestore einem Android Projekt hinzufügen (Mit BoM)

BoM erlaubt es für alle Firebase Bibliotheken nur eine einzige Version zu schreiben.

In dem Code, bevor Abfragen verwendet werden können, muss Cloud Firestore initialisiert werden. Das geschieht mit der folgenden Zeile:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.013.png)

Abbildung 10: Initialisierung von Cloud Firestore in Java Android

Nach der Initialisierung kann die Datenbank verwendet werden.
1. ## **Abfragen**
Cloud Firestore erlaubt es, in vielen Sprachen, mit der Datenbank mit Hilfe von Abfragen zu interagieren. Cloud Firestore Abfragen sind expressiv, effizient und flexibel.

Obwohl Cloud Firestore eine verschachtelte Struktur hat, sind die Cloud Firestore Abfragen so genannte „Shallow Queries“. Das bedeutet, dass diese Abfragen erlauben es, Daten zu lesen, ohne die ganze Sammlung oder die darunter liegenden Element auch lesen zu müssen.

Cloud Firestore Abfragen sind gleich schnell egal wie viele Elemente in der Datenbank gespeichert sind. Um diese Leitung zu erreichen, werden alle Daten in der Datenbank indexiert.

Die Ergebnisse von Abfragen können sortiert oder gefiltert werden. Wenn eine Abfrage zu viele Ergebnisse liefert, kann man diese Ergebnisse paginieren. Bei Änderungen in der Datenbank, müssen nicht alle neu geladen werden. Mit den Realtime Listeners von Cloud Firestore werden nur die geänderten Daten neu geladen. Cloud Firestore unterstützt auch den offline Modus. Das bedeutet, dass geladene Daten immer noch in den Anwendungen verfügbar sind, wenn es keine Internetverbindung gibt.

In Cloud Firestore Datenbanken gibt es einfache Abfragen und es gibt auch Transaktionen, die verwendet werden können, um Daten zu lesen und zu schreiben.

In der verschachtelten Struktur der Daten in Cloud Firestore Datenbanken, jedes Element muss einen eindeutigen Namen haben. 

1. ### **Daten schreiben**
Die Schreiboperationen, die in einer Cloud Firestore Datenbank möglich sind, sind: set, add und update.

**„set":**

Mit dem Befehl „set“, kann man in einer Cloud Firestore Datenbank ein Dokument erstellen oder überschreiben. Wenn die Sammlung, in der das Dokument geschrieben wird, noch nicht existiert, wird die Sammlung erstellt. Wenn das Dokument noch nicht existiert, wird es erstellt, sonst wird es überschrieben.

Das folgende Code-Beispiel zeigt wie man eine Sammlung „benutzer“ erstellen kann und dort Dokumente erstellen, die Benutzerdaten enthalten.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.014.png)

Abbildung 11: Java Android Beispiel Code

Manche IDEs erleichtern die Arbeit und zeigen Sammlungen, Dokumenten, Keys, und Values an. In dem aktuellen Beispiel wurde Android Studio benutzt. Diese Hilfe ist besonders wichtig, wenn man eine tief verschachtelte Struktur.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.015.png)

Abbildung 12: Verschachtelte Struktur eines set-Befehls in Android Studio

In der Firestore Konsole, hat man die Möglichkeit die gespeicherten Daten zu visualisieren. Die Abbildung 13 zeigt die Daten in der Firebase Konsole, die mit dem Code der Abbildung 11 gespeichert wurden.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.016.png)

Abbildung 13: Visualisierung der Daten in der Firebase Konsole

Mit dem set-Befehl werden standardmäßig die Daten erstellt oder überschrieben, aber mit diesem Befehl und die Option „SetOptions.merge()“ ist es auch möglich Daten zusammenzuführen oder zu ergänzen.

In dem Beispiel der Abbildung 11, hatten die Daten des Mannes kein Feld „Größe“. Das kann mit dem folgenden Code ergänzt werden, ohne die anderen Felder aktualisieren zu müssen

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.017.png)

Abbildung 14: set-Befehl mit SetOptions.merge()

„SetOptions.merge()“ kann auch verwendet werden, wenn man nicht weiß, ob ein Dokument existiert, und man die Daten nicht überschreiben will.

Die Abbildung 15 zeigt die Daten des Mannes (Abbildung 11), vor und nach der Ausführung des Codes der Abbildung 14. Auf der Abbildung 15 kann man sehen, dass die Größe der Person 1 hinzugefügt wurde, ohne die anderen Daten zu ändern.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.018.png)

Abbildung 15: Daten vor und nach dem set-Befehl mit SetOptions.merge()

Das set-Befehl kann auch mit Fehlerbehandlung geschrieben werden, wie auf der Abbildung 16.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.019.png)

Abbildung 16: set-Befehl mit Fehlerbehandlung

Oft arbeitet man mit Klassen und es ist dann einfacher das set-Befehl statt mit Map oder Dictionary, direkt mit Klassen zu verwenden. Damit das Möglich wird, müssen die Klassen einen Constructor ohne Argumente und, getter und setter für alle Attribute haben. Für das Beispiel der Abbildung 11, könnte man folgende Klasse haben:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.020.png)

Abbildung 17: Beispiel-Klasse "Person"

Um die Daten einer Person zu speichern wie in dem Beispiel der Abbildung 11, würde man nur den folgenden Code brauchen:

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.021.png)

Abbildung 18: Verwendung vom set-Befehl mit einer Klasse

**add:**

Mit dem set-Befehl muss man in der Regel einen Dokumentennamen vergeben. Manchmal will man aber, dass Cloud Firestore die Dokumentennamen automatisch generiert. In solchen Fällen benutzt man das add-Befehl.

Wenn man das set-Befehl verwendet ohne Dokumentennamen zu vergeben, hat man genau die gleiche Funktion wie das add-Befehl. Die zwei Zeilen auf der Abbildung 19 sind äquivalent.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.022.png)

Abbildung 19: add-Befehl mit dem äquivalenten set-Befehl

**update:**

Das Update-Befehl wird verwendet, um bestimmte Felder eines Dokumentes ohne das gesamte Dokument zu aktualisieren. Für Felder, die sicher existieren, ist ein set-Befehl mit SetOptions.merge() äquivalent.

Wenn man zahlen verwendet, kann man auch die Funktion „increment“ verwenden, um den Wert zu ändern.
1. ### **Daten lesen**
Wenn man Daten in einer Datenbank speichert, will man sie irgendwann auch wieder lesen. Cloud Firestore bietet zwei Möglichkeiten an, Daten zu lesen. Man kann eine Funktion aufrufen, um Daten zu lesen oder man kann ein „Listener“ verwenden, um bei jeder Änderung, Daten zu lesen.

Wenn man eine Funktion verwendet, um Daten zu lesen, hat man die Möglichkeit ein einziges Dokument zu lesen oder auch mehrere Dokumente zu lesen. Wenn man mehrere Dokumente lesen will, verwendet man Schlüsselwörter wie „where()“ in der Abfrage, um nur Dokumente zu lesen, die eine bestimmte Bedingung erfüllen. Die Abbildung 20 zeigt ein Beispiel Code, der verwendet werden kann, um die „person1“ zu lesen, die wir in 4.2.1 gespeichert haben.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.023.png)

Abbildung 20: Ein Dokument lesen

Cloud Firebase unterstützt den Offline-Modus. Um diese Funktionalität zu ermöglichen, werden Daten im Cache gespeichert, aber standardmäßig werden die Daten immer direkt von der Datenbank gelesen, außer wenn man wirklich offline ist. Um auch mit einer verfügbaren Internetverbindung Daten vom dem Cache Speicher zu lesen, kann man die „source-option“ von get() verwenden. Die Abbildung 21 zeigt eine modifizierte Version des Beispiels der Abbildung 20. In dieser Version werden Daten aus dem Cache-Speicher gelesen.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.024.png)

Abbildung 21: Ein Dokument aus dem Cache lesen

Um jetzt alle Personen mit der Größe „165 cm“ zu lesen, die wir gespeichert haben, können wir „whereEqualTo("groesse", "165 cm") verwenden.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.025.png)

Abbildung 22: Mehrere Dokumente lesen

Um alle Dokumente einer Kollektion zu lesen, kann man die where()-Bedingung weglassen. In dem Beispiel der Abbildung 22, würde man nur whereEqualTo("groesse", "165 cm") weglassen. Der Rest würde gleichbleiben.

Um bei jeder Änderung ein Dokument zu lesen, muss man einen „Listerner“ verwenden. Wenn wir „person1“ bei jeder Änderung lesen wollen, kann der Code der Abbildung 23 verwendet werden.

![](Aspose.Words.7cac81d1-9848-4fd2-9327-ec355b8799ec.026.png)

Abbildung 23: Dokument bei jeder Änderung lesen

Cloud Firestore hat viele weiteren Möglichkeiten Lese-operationen zu kombinieren, zu filtern, die nicht alle hier vorgestellt werden können. Es gibt auch die Möglichkeit die Anzahl der Ergebnisse zu begrenzen oder die Möglichkeit die Ergebnisse zu paginieren.
1. ### **Transaktionen und Batched Writes**
Transaktionen und Batched Writes sind Cloud Firestore „Funktionen“, die es ermöglichen mehrere Operationen atomisch auszuführen. Das bedeutet, entweder werden alle Operationen ausgeführt oder gar keine Operation wird ausgeführt.
-
- - **Transaktionen** sind Sätze von Lese- und Schreiboperationen in einem oder mehreren Dokumenten.
- - **Batched Writes** sind Sätze von und Schreiboperationen in einem oder mehreren Dokumenten

Transaktionen und Batched Writes können in Cloud Firestore in maximum 500 Dokumente schreiben.

**Transaktionen:**

Transaktionen bestehen in der Regel aus get-Operationen gefolgt von set-, update- oder delete-Operationen. 

In Cloud Firestore gibt es Regeln, die bei der Verwendung von Transaktionen beachtet werden müssen. 
-
- - Wenn eine Transaktion Dokumente liest, und mindestens eins von diesen Dokumenten während der Transaktion geändert wird, wird die Transaktion noch einmal ausgeführt.
- - Leseoperationen sollten vor Schreiboperationen kommen.
- - Transaktionen sollten den Zustand einer Anwendung direkt ändern.
- - Transaktionen funktionieren nicht, wenn die Anwendung offline ist.

**Batched Writes:**

Batched Writes sind fast wie Transaktionen aber unterstützen keine Lese-Operationen. Sie sind atomische Operationen wie Transaktionen aber sie haben ein paar Vorteile im Vergleich zu Transaktionen. 

Batched Writes werden nicht von Lese-Operationen beeinflusst. Das bedeutet, dass Batched Writes nicht wiederholt werden müssen, wenn Dokumente geändert werden, die gerade von einer anderen Operation gelesen werden.

1. # **Cloud Firestore Nutzung, Grenzen und Preis**
Cloud Firestore ist nicht kostenlos. Die Kosten für die Cloud Firestore Nutzung werden von mehreren Faktoren beeinflusst. Folgende Faktoren beeinflussen die Kosten von Cloud Firestore:
-
- - Die Anzahl der Dokumente, die gelesen, geschrieben und gelöscht werden
- - Die Menge an Speicherplatz, die die Datenbank verwendet, einschließlich Overhead für Metadaten und Indizes.
- - Die Menge an Netzwerkbandbreite, die verwendet wird.

Die Cloud Firestore Kosten hängen auch von dem Standort ab, wo die Daten gespeichert sind. Die Tabelle 2 zeigt die Cloud Firestore Preise pro Aktion für ein paar Standorte.


|**Aktion / Funktion**|**USA (Mehrere Regionen)**|**Montréal**|**São Paulo**|**Frankfurt**|
| :- | :- | :- | :- | :- |
|Lesen|0,06 $ pro 100.000 Dokumente|0,033 $ pro 100.000 Dokumente|0,045 $ pro 100.000 Dokumente|0,039 $ pro 100.000 Dokumente|
|Schreiben|0,18 $ pro 100.000 Dokumente|0,099 $ pro 100.000 Dokumente|0,135 $ pro 100.000 Dokumente|0,117 $ pro 100.000 Dokumente|
|Löschen|0,02 $ pro 100.000 Dokumente|0,011 $ pro 100.000 Dokumente|0,015 $ pro 100.000 Dokumente|0,013 $ pro 100.000 Dokumente|
|Speichern|0,18 $/GiB/Monat|0,099 $/GiB/Monat|0,135 $/GiB/Monat|0,117 $/GiB/Monat|
Tabelle 2: Cloud Firestore Preise pro Aktion und Region

Für alle Cloud Firestore Aktionen oder Funktionen gibt es kostenlose Kontingente. Diese Preise der Tabelle 2 werden aber nur angewendet, nachdem die kostenlose Kontingente verbraucht wurden. Die Grenzen für kostenlose Kontingente sind in der Tabelle 3 aufgelistet.


||**Grenze**|
| :- | :- |
|Gespeicherte Daten|1 GB|
|Lesen|50.000 pro Tag|
|Schreiben|20.000 pro Tag|
|Löschen|20.000 pro Tag|
|Netzwerk Verwendung|10 GiB pro Monat|
Tabelle 3: Cloud Firestore kostenlose Kontingente

1. # **Vor – und Nachteile von Firebase Cloud Firestore**
Wie jede Technologie, hat Cloud Firestore Vor- und Nachteile
1. ## **Vorteile von Cloud Firestore**
Die ersten Vorteile von Cloud Firestore sind die Vorteile einer NoSQL-Datenbank. Mit Cloud Firestore haben Entwickler mehr Flexibilität bei Änderungen der Struktur der Daten, weil es kein festes Schema gibt, wie bei SQL-Datenbanken.

Cloud Firestore ist Serverlos. Die Datenbank ist komplett in der Google Cloud, und komplett verwaltet. Entwickler müssen sich nicht um die Hardware oder die Verfügbarkeit der Datenbank kümmern. Sie können schneller mit der Entwicklung ihrer Apps starten, und die Daten können leicht von jedem Gerät aufgerufen werden oder zwischen Benutzer geteilt werden.

Echtzeit- /Live-Synchronisierung: Mit Cloud Firestore können Daten fast in Echtzeit synchronisiert werden. Anwendung können so entwickelt werden, dass die Synchronisierung automatisch passiert, wenn es Änderungen gibt, oder die Synchronisierung kann auch manuell gestartet werden. Der Entwickler kann frei entscheiden welche Strategie verwendet werden soll.

Unterstützung von Offline-Modus: Cloud Firestore unterstützt den Offline-Modus. Diese Eigenschaft ist direkt in Cloud Firestore integriert. Sie muss nicht mehr von Entwickler selbst implementiert werden. Die Apps, die mit Cloud Firestore entwickelt werden, funktionieren weiter, wenn man offline ist, da die Daten weiter verfügbar sind.

SDK und Server Client-Bibliotheken für viele Sprachen: Cloud Firestore hat mobile und web SDKs. Damit wird die Android, iOS und Web-Entwicklung mit Cloud Firestore vereinfacht. Alle diese SDKs sind gut dokumentiert. Es gibt Fälle, wo man zwischen Firebase und die Kunden einen Server haben will. Für diese Fälle hat Firestore Server Client Bibliotheken, die in vielen Sprachen verfügbar sind (C#, Go, Java, Node.js, PHP, Python, und Ruby).

Browser-Tool, um die Daten zu visualisieren: In der Firebase Konsole, hat Cloud Firestore einen sehr übersichtlichen Browser, um durch die Daten zu navigieren und diese Daten zu bearbeiten.

Multiregionale Datenreplikation: Cloud Firestore benutzt die Google Cloud Infrastruktur, und speichert die Daten in mehreren Standorten für mehr Zuverlässigkeit.

Wenn eine Anwendung mehr Leistung braucht, kann Cloud Firestore automatisch skalieren, um leistungsfähig zu bleiben. 

Zu Firebase gehören viele andere Produkte, die zusammen mit Cloud Firestore arbeiten. Das ist zum Beispiel der Fall für Firebase Authentication, womit man seine Nutzer identifizieren und authentifizieren kann. Cloud Firestore bringt auch alle Vorteile der Google Cloud Plattform. Zum Beispiel Cloud Funktionen, die es ermöglichen einen Code oder Operationen in der Datenbank auszuführen.
1. ## **Nachteile von Cloud Firestore**
Obwohl Cloud Firestore sehr viele Vorteile hat, gibt es leider auch Nachteile.

**Kein JOIN und SQL.** Das Cloud Firestore eine NoSQL Datenbank ist, gibt es keine SQL-Abfragen. Es gibt auch kein JOIN.

**Cloud Firestore ist nicht kostenlos.** Cloud Firestore kann kostenlos getestet werden; weil es für fast alle Firebase Produkte und Funktionen ein freies Kontingent gibt. Für kleine Applikationen oder für Testzwecke kann das reichen aber, wenn die Applikation anfangen zu wachsen, muss man irgendwann bezahlen. Die kosten werden hauptsächlich von der Menge der Abfragen berechnet. Die Struktur der Datenbank beeinflusst die kosten.

**Bei jedem Export wird eine Lese-Operation pro Dokument gezählt**. Wenn man automatische Exporte konfiguriert, sollte man vorsichtig sein, wenn die Menge der Daten groß ist, weil Exporte Kosten verursachen könnten. Die Kosten, die durch Exporte verursacht werden, werden nicht in der Konsole angezeigt.

**Cloud Firestore unterstützt Keine Volltextsuche.** Wenn man Cloud Firestore für die Entwicklung einer Anwendung verwendet, die eine Volltextsuche haben soll, ist man auf externe Drittanbieter wie Elastic, Algolia oder Typesense angewiesen.

1. # **Zusammenfassung**
Cloud Firestore ist eine NoSQL-Datenbank für sehr viele Optionen für Entwickler anbietet, besonders, wenn man flexible sein will. Die NoSQL-Datenbank ist im Vergleich zu SQL-Datenbanken flexibler bei Änderungen oder bei Skalierungen. Außerdem verschwendet man bei Cloud Firestore keine Zeit für die Verwaltung der Hardware, das Cloud Firestore komplett in der Cloud von Google verwaltet wird. Cloud Firestore kann automatisch skalieren, wenn mehr Leistung gebraucht wird. Mit der nativen Unterstützung des Offline-Modus wird die Arbeit der Entwickler noch einfacher gemacht, aber Entwickler müssen bei den Abfragen und bei der Struktur der Daten aufpassen, weil sie mit einer ungünstigen Struktur höhere Kosten verursachen können.

**Literaturverzeichnis**



**Abbildungsverzeichnis**

[Abbildung 1: Cloud Firestore Datenmodell	4](#_Toc95443313)

[Abbildung 2: Datenbank erstellen in der Developer Console	7](#_Toc95443314)

[Abbildung 3: Auswahl des Sicherheitsmodus bei der Erstellung einer Datenbank	7](#_Toc95443315)

[Abbildung 4: Auswahl des Standortes für die Datanbank	8](#_Toc95443316)

[Abbildung 5: Multiregionale Cloud Firestore Standorte	8](#_Toc95443317)

[Abbildung 6: Cloud Firestore Standorte	9](#_Toc95443318)

[Abbildung 7: Eine leere Cloud Firestore Datenbank	10](#_Toc95443319)

[Abbildung 8: Cloud Firestore einem Android Projekt hinzufügen (Ohne BoM)	11](#_Toc95443320)

[Abbildung 9: Cloud Firestore einem Android Projekt hinzufügen (Mit BoM)	11](#_Toc95443321)

[Abbildung 10: Initialisierung von Cloud Firestore in Java Android	12](#_Toc95443322)

[Abbildung 11: Java Android Beispiel Code	13](#_Toc95443323)

[Abbildung 12: Verschachtelte Struktur eines set-Befehls in Android Studio	13](#_Toc95443324)

[Abbildung 13: Visualisierung der Daten in der Firebase Konsole	14](#_Toc95443325)

[Abbildung 14: set-Befehl mit SetOptions.merge()	14](#_Toc95443326)

[Abbildung 15: Daten vor und nach dem set-Befehl mit SetOptions.merge()	15](#_Toc95443327)

[Abbildung 16: set-Befehl mit Fehlerbehandlung	15](#_Toc95443328)

[Abbildung 17: Beispiel-Klasse "Person"	16](#_Toc95443329)

[Abbildung 18: Verwendung vom set-Befehl mit einer Klasse	16](#_Toc95443330)

[Abbildung 19: add-Befehl mit dem äquivalenten set-Befehl	17](#_Toc95443331)

[Abbildung 20: Ein Dokument lesen	18](#_Toc95443332)

[Abbildung 21: Ein Dokument aus dem Cache lesen	18](#_Toc95443333)

[Abbildung 22: Mehrere Dokumente lesen	19](#_Toc95443334)

[Abbildung 23: Dokument bei jeder Änderung lesen	19](#_Toc95443335)



**Tabellenverzeichnis**

[Tabelle 1: Cloud Firestore unterstützte Datentypen	3](#_Toc95443336)

[Tabelle 2: Cloud Firestore Preise pro Aktion und Region	21](#_Toc95443337)

[Tabelle 3: Cloud Firestore kostenlose Kontengente	21](#_Toc95443338)



**Abkürzungsverzeichnis**


[^1]: https://firebase.google.com/docs/firestore
[^2]: https://firebase.google.com/docs/firestore/data-model
[^3]: https://firebase.google.com/docs/firestore/data-model#documents
[^4]: https://firebase.google.com/docs/projects/locations
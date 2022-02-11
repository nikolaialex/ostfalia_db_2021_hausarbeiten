
# 4. Cloud Firestore Abfragen

Bevor man Abfragen verwendet, muss zuerst eine Datenbank erstellt werden. Das geht sehr einfach in der Firebase Konsole. Danach muss man die Entwicklungsumgebung einrichten.
<br>

## 4.1	Entwicklungsumgebung


Damit eine Anwendung mit Cloud Firestore arbeiten kann, muss Firebase, während der Entwickelung, dem Projekt hinzugefügt werden. Dann müssen Bibliotheken hinzugefügt werden, die die Anwendung für Cloud Firestore braucht. Firebase unterstützt mehrere Programmiersprachen und Plattformen wie iOS, Android Java, Node.js. oder Go.
Für eine Android Anwendung, wenn Firebase dem Projekt hinzugefügt wurde, müssen folgende Zeilen in der Gradle-Datei auf der Module Ebene hinzugefügt werden.


![](media/image11.png)

Abbildung 8: Cloud Firestore einem Android Projekt hinzufügen (Ohne BoM)

<br>
<br>

Wenn man mehrere Firebase Bibliotheken verwendet, muss man für jede Bibliothek manuell eine Version eingeben. Um die Versionen nicht einzeln manuell zu schreiben, kann man BoM (Bill of Materials) verwenden (siehe Abbildung 9).

![](media/image12.png)

Abbildung 9: Cloud Firestore einem Android Projekt hinzufügen (Mit BoM)

<br>
<br>

BoM erlaubt es für alle Firebase Bibliotheken nur eine einzige Version zu schreiben.
In dem Code, bevor Abfragen verwendet werden können, muss Cloud Firestore initialisiert werden. Das geschieht mit der folgenden Zeile:

<br>

![](media/image13.png)

Abbildung 10: Initialisierung von Cloud Firestore in Java Android

<br>
<br>

## 4.2	Abfragen

Cloud Firestore erlaubt es, in vielen Sprachen, mit der Datenbank mit Hilfe von Abfragen zu interagieren. Cloud Firestore Abfragen sind expressiv, effizient und flexibel.

<br>
Obwohl Cloud Firestore eine verschachtelte Struktur hat, sind die Cloud Firestore Abfragen so genannte „Shallow Queries“. Das bedeutet, dass diese Abfragen erlauben es, Daten zu lesen, ohne die ganze Sammlung oder die darunter liegenden Element auch lesen zu müssen.

<br>

Cloud Firestore Abfragen sind gleich schnell egal wie viele Elemente in der Datenbank gespeichert sind. Um diese Leitung zu erreichen, werden alle Daten in der Datenbank indexiert. <br>
Die Ergebnisse von Abfragen können sortiert oder gefiltert werden. Wenn eine Abfrage zu viele Ergebnisse liefert, kann man diese Ergebnisse paginieren. Bei Änderungen in der Datenbank, müssen nicht alle neu geladen werden. Mit den Realtime Listeners von Cloud Firestore werden nur die geänderten Daten neu geladen. Cloud Firestore unterstützt auch den offline Modus. Das bedeutet, dass geladene Daten immer noch in den Anwendungen verfügbar sind, wenn es keine Internetverbindung gibt.<br>

In Cloud Firestore Datenbanken gibt es einfache Abfragen und es gibt auch Transaktionen, die verwendet werden können, um Daten zu lesen und zu schreiben.
In der verschachtelten Struktur der Daten in Cloud Firestore Datenbanken, jedes Element muss einen eindeutigen Namen haben. 

<br>
<br>

### 4.2.1	Daten schreiben

Die Schreiboperationen, die in einer Cloud Firestore Datenbank möglich sind, sind: set, add und update.

<br>

**„set":**<br>
Mit dem Befehl „set“, kann man in einer Cloud Firestore Datenbank ein Dokument erstellen oder überschreiben. Wenn die Sammlung, in der das Dokument geschrieben wird, noch nicht existiert, wird die Sammlung erstellt. Wenn das Dokument noch nicht existiert, wird es erstellt, sonst wird es überschrieben.
Das folgende Code-Beispiel zeigt wie man eine Sammlung „benutzer“ erstellen kann und dort Dokumente erstellen, die Benutzerdaten enthalten.

![](media/image14.png)

Abbildung 11: Java Android Beispiel Code

<br><br>
Manche IDEs erleichtern die Arbeit und zeigen Sammlungen, Dokumenten, Keys, und Values an. In dem aktuellen Beispiel wurde Android Studio benutzt. Diese Hilfe ist besonders wichtig, wenn man eine tief verschachtelte Struktur.

![](media/image15.png)

Abbildung 12: Verschachtelte Struktur eines set-Befehls in Android Studio

<br><br>

In der Firestore Konsole, hat man die Möglichkeit die gespeicherten Daten zu visualisieren. Die Abbildung 13 zeigt die Daten in der Firebase Konsole, die mit dem Code der Abbildung 11 gespeichert wurden.

![](media/image16.png)

Abbildung 13: Visualisierung der Daten in der Firebase Konsole

<br><br>

Mit dem set-Befehl werden standardmäßig die Daten erstellt oder überschrieben, aber mit diesem Befehl und die Option „SetOptions.merge()“ ist es auch möglich Daten zusammenzuführen oder zu ergänzen.
In dem Beispiel der Abbildung 11, hatten die Daten des Mannes kein Feld „Größe“. Das kann mit dem folgenden Code ergänzt werden, ohne die anderen Felder aktualisieren zu müssen

![](media/image17.png)

Abbildung 14: set-Befehl mit SetOptions.merge()

<br><br>

„SetOptions.merge()“ kann auch verwendet werden, wenn man nicht weiß, ob ein Dokument existiert, und man die Daten nicht überschreiben will.
Die Abbildung 15 zeigt die Daten des Mannes (Abbildung 11), vor und nach der Ausführung des Codes der Abbildung 14. Auf der Abbildung 15 kann man sehen, dass die Größe der Person 1 hinzugefügt wurde, ohne die anderen Daten zu ändern.

![](media/image18.png)


Abbildung 15: Daten vor und nach dem set-Befehl mit SetOptions.merge()

<br>
<br>

Das set-Befehl kann auch mit Fehlerbehandlung geschrieben werden, wie auf der Abbildung 16.

![](media/image19.png)

Abbildung 16: set-Befehl mit Fehlerbehandlung

Oft arbeitet man mit Klassen und es ist dann einfacher das set-Befehl statt mit Map oder Dictionary, direkt mit Klassen zu verwenden. Damit das Möglich wird, müssen die Klassen einen Constructor ohne Argumente und, getter und setter für alle Attribute haben. Für das Beispiel der Abbildung 11, könnte man folgende Klasse haben:

<br><br><br><br>

#### [Zum Anfang](README.md "zur Startseite") | [Inhaltsverzeichnis](00_Inhaltsverzeichnis.md "zum Inhaltsverzeichnis")

# 6 Wordcount mit Spark und Python

In diesem Kapitel wird beispielhaft die Installation und Verwendung von _Spark_ auf Basis folgender Komponenten
demonstriert:

* Java zur Unterstützung von Spark
* Spark in der aktuellen Version 3.2.0
* FindSpark zum einfachen Zugriff auf Spark (Python Bibliothek)
* PySpark als Bibliothek zur Arbeit mit Spark (Python Bibliothek)

Für diese Aufgabe wird auf Grund der einfachen Verfügbarkeit
[_Google Colaboratory_](03_Mögliche_Umgebungen_für_Spark.md#spark-mit-google-colaboratory-colab "zum Abschnitt")
verwendet, die Programmierung erfolgt mit Python. Das hierbei entstehende 
[_Jupyter Notebook_](notebook/Wordcount_mit_Spark_RDD.ipynb "zum Notebook")
ist Teil dieser Arbeit und kann frei verwendet werden. Insbesondere der erste Teil, in dem die Arbeitsumgebung selbst
aufgesetzt wird, bietet hierbei eine einfache Basis zur Wiederverwendung, um erste Erfahrungen mit Spark zu sammeln.

Als Beispielaufgabe dient eine einzelne Textdatei mit allen
[literarischen Werken von Shakespeare](https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt "zum Download")
. Diese Textdatei ist an mehreren Stellen im Internet frei verfügbar. Für dieses Beispiel wird auf das Angebot des
Massachusetts 
[Institute of Technology (MIT)](https://ocw.mit.edu "zur Webseite")
zurück gegriffen.

Insgesamt enthält die Datei:

* 5.333.743 Zeichen ohne Zeilenende in
* 929.396 Wörter in
* 124.457 Zeilen.

## Vorbereiten des Notebooks

Alle Arbeiten, die der Vorbereitung des Notebooks dienen, snd im Abschnitt _Vorbereitung des Notebooks_ hinterlegt. Für
diesen Abschnitt kann auf das Kapitel 
[_Google Colaboratory_](03_Mögliche_Umgebungen_für_Spark.md#spark-mit-google-colaboratory-colab "zum Abschnitt")
dieser Arbeit zurück gegriffen werden.

Im 
[_Jupyter Notebook_](notebook/Wordcount_mit_Spark_RDD.ipynb "zum Notebook") finden sich die hierfür erforderlichen
Arbeitsschritte im Abschnitt **Vorbereitung des Notebooks**.

## Auszählen der Wörter

Um die Aufgabe umzusetzen sind zwei Arbeitsschritte erforderlich. Entsprechend finden sich im 
[_Jupyter Notebook_](notebook/Wordcount_mit_Spark_RDD.ipynb "zum Notebook")
zwei Abschnitte.

Im ersten Abschnitt **Einlesen und Vorbereiten der Textdatei** werden zunächst zwei Methoden definiert.

* Der ersten Methode **_get_file_from_url_** werden als Parameter eine URL sowie ein Speicherort angegeben. Bei Ihrem
  Aufruf lädt die Methode eine Datei von der angegebenen URL herunter und speichert sie in Google Drive ab.
* Die zweite Methode **_cut_file_** nimmt als Parameter einen numerischen Start- und Endwert sowie die Angabe einer
  Quell- und Zieldatei entgegen. Bei Ihrem Aufruf entfernt die Methode alle Zeilen vor bzw. nach den durch Start- und
  Endwert definierten Zeilenbereich aus der Quelldatei und speichert das Ergebnis in die Zieldatei.

Beide Dateien dienen der Vorbereitung der zu bearbeitenden Datei und stehen in keinen direkten Zusammenhang mit der
Nutzung von Spark. Daher soll an dieser Stelle nicht weiter auf sie eingegangen werden.

---

In dem folgenden Block wird dann im Anschluss die Datei mit den gesammelten Werken von Shakespeare von der Seite des MIT
herunter geladen:

```python
# Datei von der Quelle nach Colab laden

file_url = "https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt"
place_to_save = "/content/shakespeare.txt"

get_file_from_url(file_url, place_to_save)

print("")
print("Datei wurde vorbereitet...")
```  

Anschließend wird sie am Anfang und Ende beschnitten. Dies ist notwendig, da am Anfang der Datei noch einführender Text
vorhanden ist, welcher das Ergebnis verfälschen könnte. Die beschnittene Datei wird als _shakespeare_neu.txt_
gespeichert.

```python
# Unnötige Zeilen am Ende und am Start entfernen

file_source = "/content/shakespeare.txt"
file_target = "/content/shakespeare_neu.txt"

cut_file(244,124438,file_source, file_target)

print("")
print("Die Arbeitsdatei ist vorbereitet...")
```

---

Im Abschnitt **Auszählen der Wörter** findet sich nun der eigentliche Code, welcher mit Hilfe von Spark die Datei
auszählt und die ersten 30 häufigsten Vorkommen ausgibt.

Um mit Spark arbeiten zu können, muss als erstes eine Verbindung zu Spark in Form eines
[SparkContext](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.SparkContext.html "zur Dokumentation")
aufgebaut werden. In dem hier verwendeten Code wird ein
[SparkContext](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.SparkContext.html "zur Dokumentation")
erzeugt, welcher die Bezeichnung _WordCounter_ erhält. Er soll lokal laufen und hierbei parallel alle verfügbaren Kerne
verwenden. Dieser Block kann in einer Anwendung nur ein Mal ausgeführt werden.

```python
# Erzeugen eines Spark Kontext

sc = SparkContext("local[*]","WordCounter")
sc.setLogLevel("ERROR")

print("Der Spark Kontext wurde angelegt...")
```

Statt _local[*]_ kann auch die Anzahl der zu nutzenden Kerne direkt angegeben werden. Die alleinige Angabe von local
bewirkt, dass nur ein Kern genutzt wird. Gerade bei sehr großen Dateien wird die Verarbeitung jedoch gerade nicht lokal
stattfinden und an dieser Stelle entfernte Rechner definiert werden.

---

Der letzte Block des 
[_Jupyter Notebook_](notebook/Wordcount_mit_Spark_RDD.ipynb "zum Notebook") 
nutzt nun tatsächlich Spark um die Wortvorkommen auszugeben.

Die Methode
[_textFile_](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.SparkContext.textFile.html "zur Dokumentation")
ermöglicht das Lesen von in UTF-8 codierten Textdateien und gibt ein RDD in Form einer Liste von String zurück. In
diesen Fall entsprechen die Strings den Zeilen der Textdatei. Die Methode
[_map_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.map.html "zur Dokumentation")
führt auf jedes Element des zugrunde liegenden RDD - also den Zeilen der Textdatei - die angegebene Funktion aus.

In dem hier vorliegenden Fall findet zunächst eine Reihe von Ersetzungen (replace), dann eine Konvertierung in
Kleinbuchstaben (lower) und am Schluss eine Filterung (filter) auf leere Zeilen statt. Als Ergebnis wird ein neues 
RDD vom Typ String zurückgegeben. Das ursprüngliche RDD wird nicht verändert. Es ist immutable. Die Verwendung 
einer FluentApi bewirkt eine übersichtliche Strukturierung des Codes.

```python
lines=sc.textFile(file_target)
  .map( lambda x: x.replace(',',' ').replace('.',' ').replace('-',' ').lower())
  .filter(lambda linex: linex.strip() != "")
```

---

Nach dem Einlesen werden die ersten 30 Listeneinträge des zurück gegebenen RDD's ausgegeben. Jeder Eintrag entspricht
hierbei einer zeile der Datei. Da es sich tatsächlich um eine Liste handelt, kann hierzu eine einfach _for Schleifen_
verwendet werden. Besondere Aufmerksamkeit muss hierbei dem Aufruf von
[_collect_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.collect.html "zur Dokumentation")
entgegengebracht werden.

Das von Spark erzeugte RDD ist ein verteiltes Dataset. In diesen Beispiel ist es auf den Kernen der CPU verteilt, kann
aber grundsätzlich auch auf weit verteilte Rechner liegen.
[_Collect_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.collect.html "zur Dokumentation")
sammelt nun alle Elemente des RDD ein und macht sie so verfügbar. Sofern das zugrundeliegende Objekt wie hier ein RDD
ist, sollte man bedenken, dass alle Daten in den Hauptspeicher geladen werden.

```python
top_out = 30

print("")
print("Ausgabe der ersten {} Zeilen des Textes".format(top_out))
print("")

for line in lines.collect()[0:top_out]:
  print(line)
```

Nach der Ausführung erhalten wir die folgende Ausgabe:

![rdd_zeilen.png](assets/rdd_zeilen.png "Ausgabe der ersten Zeilen der Textdatei")

---

In der folgenden Codesequenze wird jedes Listenelement des RDD durch
[_flatMap_](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.RDD.flatMap.html "zur Dokumentation")
in seine einzelnen Wörter aufgeteilt. Für jedes Wort wird ein Tupel erzeugt und zurückgegeben. Da es sich um eine
[_flatMap_](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.RDD.flatMap.html "zur Dokumentation")
handelt, verfügt das zurück gegebene RDD nur noch über eine sehr lange Liste von Tupel. Die Funktion
[_reduceByKey_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.reduceByKey.html "zur Dokumentation")
merged im Anschluss die einzelnen Tupel. Als Ergebnis erhält man eine Liste von Tupel mit eindeutigen Wörtern und deren
Vorkommen.

```python
words=lines.flatMap(lambda line: line.split(" ")) \
  .map(lambda word: (word, 1)) \
  .reduceByKey(lambda a,b:a+b)
```

Mit der Methode
[_sortBy_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.sortBy.html "zur Dokumentation")
wird auf die Anzahl der Wortvorkommen sortiert. Das zurück gegebene RDD sorted_counts kann im Anschluss ausgegeben
werden, nachdem mit
[_collect_](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.RDD.collect.html "zur Dokumentation")
alle Werte eingesammelt wurden.

```python
sorted_counts = words.sortBy(lambda wordCounts: wordCounts[1], ascending=False)

top_length = 30

print("")
print("Ausgabe der {} größten Vorkommen".format(top_length))
print("")

i = 0
for word, count in sorted_counts.collect()[0:top_length]:
  print("{} : {} : {} ".format(i, word, count))
  i += 1
```

Das Ergebnis ist eine Liste aller Wörter mit deren Vorkommen in absteigender Reihenfolge. Hierbei steht an erster Stelle
das Leerzeichen als häufigster Vertreter.

![rdd_wörter.png](assets/rdd_wörter.png "Ausgabe der Wortliste in absteigender Reihenfolge")

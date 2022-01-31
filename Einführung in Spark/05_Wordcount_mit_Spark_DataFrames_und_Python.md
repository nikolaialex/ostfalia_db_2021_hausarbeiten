#### [Zum Anfang](README.md "zur Startseite") | [Inhaltsverzeichnis](00_Inhaltsverzeichnis.md "zum Inhaltsverzeichnis")

# 5 Wordcount mit Spark DataFrames und Python

An dieser Stelle wird eine Variante des zuvor im Kapitel [Wordcount mit Spark und Python](04_Wordcount_mit_Spark_RDDs_und_Python.md "zum Kapitel") beschriebenen Beispiels vorgestellt.

Im Gegensatz zur vorherigen Anwendung finden sich einige entscheidende Änderungen in der Art, wie auf Spark zugegriffen und damit gearbeitet wird. ***Statt RDDs*** kommen nunmehr die neueren ***Data Frames*** zum Einsatz. Um unnötige Wiederholungen zu vermeiden, wird auf die Erklärung bereits zuvor verwendeter Codebestandteile verzichtet. 

Auch der hier vorgestellte Code ist als lauffähiges [_Jupyter Notebook_](notebook/Wordcount_mit_Spark_DataFrame.ipynb "zum Notebook") Teil dieser Arbeit und frei verwendbar.

## Session statt Context

[_zurück_](05_Wordcount_mit_Spark_DataFrames_und_Python.md#5-wordcount-mit-spark-dataframes-und-python "Zurück")

Der wichtigste Unterschied zum vorhergehenden Beispiel ist die Nutzung der neueren [***Spark Session***](https://spark.apache.org/docs/latest/sql-getting-started.html "zur Dokumentation") 
statt eines [***Spark Context***](https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.SparkContext.html "zur Dokumentation"). Das Kapitel [Datenstrukturen](02_Datenstrukturen.md) geht hierauf näher ein. Zugriff hierauf erhält man mit Hilfe der Bibliothek [pyspark.sql](https://spark.apache.org/docs/2.4.0/api/python/pyspark.sql.html "zur Dokumentation").

Die folgende Codesequenz erzeugt eine [Spark Session](https://spark.apache.org/docs/latest/sql-getting-started.html "zur Dokumentation") mit der Bezeichnung *Wordcount*. Ist diese Session noch nicht vorhanden, so wird sie erstellt, ansonsten die vorhandene zurückgegeben:

```python
# Erzeugen einer Spark Session

from pyspark.sql import SparkSession
session = SparkSession.builder.appName("Wordcount").getOrCreate()

print("Die Spark Session wurde angelegt...")
```

## DataFrame Methoden statt Map

[_zurück_](05_Wordcount_mit_Spark_DataFrames_und_Python.md#5-wordcount-mit-spark-dataframes-und-python "Zurück")

Zunächst wird die Datei mit Hilfe der Funktion [***Session.read.text***](https://spark.apache.org/docs/latest/sql-getting-started.html#creating-dataframes "zur Dokumentation") eingelesen. Die Funktion liefert ein direkt nutzbares und typisiertes [***Spark DataFrame***](https://spark.apache.org/docs/latest/sql-programming-guide.html "zur Dokumentation") zurück. Hieraus werden die ersten 30 Zeilen mit der Funktion [***DataFrame.show***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.show.html "zur Dokumentation") zurückgegeben:

```python
# Auszählen der Wörter

import pyspark.sql.functions as func

df = session.read.text(file_target)

print("")
print("Schema der eingelesenen Datei:")
df.printSchema()
print("")

top_out = 30
top_length = 30

print("")
print("Ausgabe der ersten {} Zeilen des Textes".format(top_out))
print("")

df.show(n=top_out,truncate=False)
```

Anschließend folgen eine Reihe von ***Ersetzungen*** (*replace*), eine ***Konvertierung in Kleinbuchstaben*** (*lower*) und am Schluss eine ***Filterung*** (*filter*) auf leere Zeilen. Hierbei wird jedes Mal ein neues [DataFrame](https://spark.apache.org/docs/latest/sql-programming-guide.html "zur Dokumentation") zurückgegeben:

```python
df=df.withColumn('value', func.translate('value', ',', ' '))
df=df.withColumn('value', func.translate('value', '.', ' '))
df=df.withColumn('value', func.translate('value', '-', ' '))
df=df.withColumn('value', func.lower('value'))
```

Mit Hilfe der Methode [***withColumn***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.withColumn.html "zur Dokumentation") wird die übergebene Funktion ähnlich der zuvor behandelten [Map Funktion](02_Datenstrukturen.md#transformationen-und-aktionen-rdds "zum Abschnitt") auf alle Datensätze angewendet. Jeder Datensatz entspricht einer ***Zeile der Textdatei***.

Diese Funktion ***splittet*** zunächst die einzelne Zeile durch ihre Leerzeichen. Im Anschluss sorgt die Funktion [***explode***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.functions.explode.html "zur Dokumentation") dafür, dass ähnlich der zuvor behandelten [FlatMap Funktion](02_Datenstrukturen.md#transformationen-und-aktionen-rdds "zum Abschnitt"), aus dem zurück gegebenen Array mit *n* Spalten ein Array mit nur *einer* Spalte - *value2* - und *n* Reihen erzeugt wird.

```python
print("")
print("Ausgabe der {} größten Vorkommen".format(top_length))
print("")

df=df.withColumn('value2',func.explode(func.split(func.col('value'), ' ')))\
```

Die Funktion [***groupBy***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.groupBy.html "zur Dokumentation") gruppiert die in *value2* enthaltenen Werte (*Wörter*) und [***count***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.count.html "zur Dokumentation") aggregiert die Anzahl der einzelnen Vorkommen. Abgeschlossen wird die Anweisung mit einem [***sort***](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.sort.html "zur Dokumentation") und der Ausgabe der nun sortierten Liste. 

Auch hier macht die Nutzung der ***Fluent API*** den Code gut lesbar. Ebenso fällt die Ähnlichkeit zu 
[Panda DataFrames](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html "zur Dokumentation") auf.

```python
df=df.withColumn('value2',func.explode(func.split(func.col('value'), ' ')))\
  .groupBy('value2')\
  .count()\
  .sort('count', ascending=False)\
  .show(n=top_length,truncate=False)
```

Das Ergebnis ist eine ***Liste aller Wörter*** mit deren ***Vorkommen*** in ***absteigender Reihenfolge***. Hierbei steht an erster Stelle das Leerzeichen als häufigster Vertreter.

![dataframe_wörter.png](./assets/dataframe_wörter.png "Ausgabe der Wortliste in absteigender Reihenfolge im Notebook")

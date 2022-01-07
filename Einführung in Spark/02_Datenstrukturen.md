#### [Zum Anfang](README.md "zur Startseite") | [Inhaltsverzeichnis](00_Inhaltsverzeichnis.md "zum Inhaltsverzeichnis")

# 2 Datenstrukturen

In den folgenden Unterkapiteln wird ein Überblick über die wichtigsten Konzepte und Datentrukturen von Spark gegeben.
Wegen der starken Verbindung von Hadoop und Spark wird zu Anfang zunächst kurz auf Hadoop als ganzes und detailierter
auf dessen auch für Spark wichtigen Filesystem HDFS eingegangen. Den Schwerpunkt bildet jedoch ein Überblick über
die wichtigsten Datenstrukturen von Spark.

Eine vertiefende und vollständige Behandlung beider System kann und soll hierbei nicht geleistet werden. Hierzu sei auf
die offizielle Dokumentation sowie weitere Quellen im Internet hingewiesen. Eine erste Orientierung kann hierbei die
[Linksliste](https://github.com/ChristianKitte/SparkProjekt/blob/main/Anhang_Linkliste.md "zum Kapitel")
am Ende dieses Repositories geben.

Insbesondere werden im Rahmen von Erweiterungen hinzugefügte Datentrukturen, welche im Kapitel
[Spark](01_Spark_Umfeld.md "zum Kapitel")
diskutierten werden, hier nicht berücksichtigt. Dies betrifft in erster Linie die Erweiterungen im Kontext von 
[GraphX](01_Spark_Umfeld.md#graphx "zum Abschnitt")
und
[Spark Streaming](01_Spark_Umfeld.md#spark-streaming "zum Abschnitt")

Ergänzend zu dieser Einleitung, werden in den Kapiteln

* [Praxisbeispiel mit RDDS](04_Wordcount_mit_Spark_RDDs_und_Python.md "zum Kapitel")
* [Praxisbeispiel mit DataFrames](05_Wordcount_mit_Spark_DataFrames_und_Python.md "zum Kapitel")

zwei konkrete Beispiele zur Nutzung von Spark mit Python umgesetzt. Beide Beispiele liegen auch in Form von Python
Notebooks vor und können direkt in Google Colab geöffnet und ausgeführt werden.

* [Hadoop](02_Datenstrukturen.md#hadoop "zum Abschnitt")
* [Spark](02_Datenstrukturen.md#spark "zum Abschnitt")

## Hadoop

[_zurück_](02_Datenstrukturen#2-Datenstrukturen "Zurück")

* [Yet Another Resource Negotiator (YARN)](02_Datenstrukturen.md#yet-another-resource-negotiator-yarn "zum Abschnitt")
* [Hadoop Distributed File System (HDFS)](02_Datenstrukturen.md#hadoop-distributed-file-system-hdfs "zum Abschnitt")
* [Hadoop Map Reduce](02_Datenstrukturen.md#hadoop-map-reduce "zum Abschnitt")

![Apache Hadoop Logo](./assets/hadoop-logo-no-back-1000.png)

(Das Apache Hadoop Loge ist ein eingetragenes Logo
der [Apache Software Foundation](https://www.apache.org "zur Webseite")

Laut
[Wikipedia](https://de.wikipedia.org/wiki/Apache_Hadoop "zu Wikipedia")
ist
[Hadoop](https://hadoop.apache.org "zur Webseite")
ein in Java geschriebenes Open Source Framework zur verteilten Verarbeitung sehr großer Datenmengen. Es
wurde in 2006 gegründet und gehört seit 2008 zu den Top Level Projekten von Apache. Aktuell (Dezember 2021) 
liegt es in der Version 3.3.1 vor.

Entgegen der weit verbreiteten Meinung ist
[Hadoop](https://hadoop.apache.org "zur Webseite") 
kein Datenbanksystem im engeren Sinne, sondern muss eher als ein Framework für die 
[Batchverarbeitung](https://de.wikipedia.org/wiki/Stapelverarbeitung "zu Wikipedia") 
sehr großer, verteilter Datenmengen mit Hilfe seines Dateisystems
[HDFS](02_Datenstrukturen.md#hadoop-distributed-file-system-hdfs "zum Abschnitt")
angesehen werden. Dies macht es auch als Echtzeitsystem ungeeignet. Hierbei ist es hoch skalierbar und kann auch 
sehr großen Datenmengen performant verarbeiten. Wie auf einer Grafik der Seite   
[datasolut.com](https://datasolut.com/apache-hadoop-einfuehrung "zur Webseite")
dargestllt wird, existieren insgesammt vier Kompoenten:

![hadoop_aufbau.png](assets/hadoop_aufbau.png "Aufbau von Apache Hadoop")

Alle Ressourcen werden von einen zentralen Ressourcen Manager 
[YARN](02_Datenstrukturen.md#yet-another-resource-negotiator-yarn "zum Abschnitt")
verwaltet. Die zu verarbeitenden Daten werden im 
[HDFS Filesystem](02_Datenstrukturen.md#hadoop-distributed-file-system-hdfs "zum Abschnitt") 
abgelegt und anschließend mit 
[Map Reduce](02_Datenstrukturen.md#hadoop-map-reduce "zum Abschnitt") 
verarbeitet und serialisiert.

Daneben existieren unter den Begriff
[Hadoop Common](https://mvnrepository.com/artifact/org.apache.hadoop/hadoop-common "zum Maven Repository")
eine Sammlung von für den Betrieb notwendigen Tools und Routinen als Maven Repository. Hierzu gehören Javafiles
und -skripte für den Start des Systems.

### Yet Another Resource Negotiator (YARN)

[YARN (Yet Another Resource Negotiator)](https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YARN.html "zur Dokumentation") 
hat die Aufgabe, die zur Bearbeitung benötigten Ressourcen eines Clusters, also CPU Zeit und Speicher, in ausreichenden 
Maße bereitzustellen und einen Job zuzuweisen. Er erfüllt somit eine sehr wichtige und für die Performance des Systems 
relevante Aufgabe. Eine weitere 
[tiefergehende Betrachtung](https://www.computerweekly.com/de/definition/Apache-Hadoop-YARN-Yet-Another-Resource-Negotiator "zur Webseite")
aus dem Jahr 2018 ist auf 
[ComputerWeekly.de](https://www.computerweekly.com/de "zur Webseite") 
zu finden. Dieser Seite wurde auch die folgende Übersicht entnommen, welche die Funktionsweise von YARN skizziert:

![hadoop_yarn.png](assets/hadoop_yarn.png "Übersicht über die Funktionsweise von YARN")

Zentrales Element ist der Resourcenmanager selbst. NodeManager der beteiligten Cluster teilen ihren Status mit. Für 
jede Anwendung wird ein Application Manager erstellt, welcher die benötigten Ressourcen beim Ressourcen Manager 
anfragt. Container weisen dann die Ressourcen der Anwendung zu.

### Hadoop Distributed File System (HDFS)

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Hadoop "Zurück zum Kapitelanfang")

Hadoop nutzt zur Speicherung seiner Daten das
[Hadoop Distributed Filesystem (HDFS)](https://hadoop.apache.org/docs/r3.3.1 "zur Dokumentation")
. Hierbei handelt es sich um ein hochverfügbares, verteiltes Dateisystem, welches die Verwaltung mehrere Millionen 
Dateien auf mehreren tausend Servern ermöglicht.

Die folgende Abbildung wurde der Seite 
[Quobyte](https://www.quobyte.com/storage-explained/what-is-hdfs "zur Webseite") 
entnommen und gibt eine Übersicht über den Aufbau des Dateisystems wieder:

![hadoop_hdfs.png](assets/hadoop_hdfs.png "Übersicht über den Aufbau des HDFS Dateisystems")

Wie in der Abbildung zu sehen ist, besteht das Dateisystem aus drei primären Bestandteilen. Bei dem ersten 
Bestandteil handelt es sich um einen als **_DataNode_** bezeichneten Service. Dieser ist für die Speicherung der Daten 
in feste Blöcke zuständig und sichert deren Replizierbarkeit. Dieser Service läuft daher in der Regel auf jeden
genutzten Server. Ein einziger **_NameNode_** enthält alle notwendigen Metadaten über existierenden DataNodes und
kann somit als eine Art "_Gesamtverzeichnis_" angesehen werden. Der Zugriff auf die Daten erfolgt über einen **_HDFS 
Client_**, der Teil der Hadoop Distribution ist.

Trotz der vielen Vorteile wird
[HDFS](https://hadoop.apache.org/docs/r3.3.1 "zur Dokumentation")
zunehmend von Cloudbasierten, intelligenten Dateisystemen wie beispeilsweise 
[AWS S3](https://aws.amazon.com/de/s3 "zur Website")
oder
[Microsoft Blob Storage](https://azure.microsoft.com/de-de/services/storage/blobs "zur Website")
verdrängt.

### Hadoop Map Reduce

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Hadoop "Zurück zum Kapitelanfang")

Für die Datenverarbeitung nutzt Hadoop das ursprünglich in seinen Grundzügen von Google stammende
[Map Reduce](https://research.google/pubs/pub62 "zur Webseite").
Bei 
[Hadoop Map Reduce](https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html "zur Dokumentation") 
handelt es sich im Prinzip um zwei nacheinander stattfindende Prozesse:

* einen Map Job
* einen Reduce Job

Zunächst werden mit dem Map Job benötigten Daten aus den Datenbestand gefiltert und extrahiert. Auf der so  
selektierten Datenbasis werden die definierten Operationen ausgeführt und zusammengefasst. Dieser Schritt 
kann als eine Reduktion der ursprünglichen Datenbasis aufgefasst werden, wovon die Bezeichnung Reduce abgeleitet 
werden kann.

Auf der Webseite 
[datasolut.com](https://datasolut.com/apache-hadoop-einfuehrung "zur Webseite")
existieren hierzu zwei Grafiken, welche diesen Vorgang gut verdeutlichen:

![hadoop_map_reduce.png](assets/hadoop_map_reduce.png "Grafische Übersicht über Hadoop Map Reduce Prozess")

Die anfallenden Aufgaben können hierbei aufgeteilt und parallel auf mehrere, verteilte Rechner ausgeführt und 
anschließend zu einem Gesamtergebnis zusammengeführt werden. Die zweite Grafik auf der genannten Seite 
verdeutlicht dies an einem Wordcount Beispiel.

![hadoop_word_count.png](assets/hadoop_word_count.png "Grafische Übersicht eines Word Counts mit Hadoop Map Reduce")

Es ist wichtig, zwei Dinge zu verstehen:

* Das Ergebnis eines Map Reduce ist immer ein reduzierter, dafür aber berechneter Datenbestand. Würde in einer
  Anwendung zwei Map Reduce Vorgänge hintereinander ausgeführt, ohne das Zwischenergebnis zu speichern, so kann kein
  Rückschluß auf das Zwischenergebnis oder den ausgeführten Aktionen gemacht werden.
* Der Map-Begriff im Kontext von Hadoop unterscheidet sich stark von dem in Spark. Im Kontext von Hadoop dient
  es der Filterung und Selektion von Daten aus dem gesamten Datenbestand. Im Kontext von Spark definiert es eine
  Aktion, welche auf jedes Element eines RDD, Dataframe oder Datasets ausgeführt werden soll. Das in 
  [Kapitel 4](04_Wordcount_mit_Spark_RDDs_und_Python.md "zum Kapitel") 
  vorgestellte, praktische Beispiel verdeutlicht dies gut.

## Spark

[_zurück_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück")

* [Spark RDDs](02_Datenstrukturen.md#spark-rdds "zum Abschnitt")
* [Spark Dataframes](02_Datenstrukturen.md#spark-dataframes "zum Abschnitt")
* [Spark Datasets](02_Datenstrukturen.md#spark-datasets "zum Abschnitt")
* [Spark DataFrame vs Spark DataSet](02_Datenstrukturen.md#spark-dataframe-vs-spark-dataset "zum Abschnitt")
* [Optimierungen](02_Datenstrukturen.md#optimierungen "zum Abschnitt")
* [Transformationen und Aktionen](02_Datenstrukturen.md#transformationen-und-aktionen "zum Abschnitt")

### Spark RDDs

In den folgenden Kapiteln wird eine Übersicht über die wichtigsten Datenstrukturen in Spark gegeben, deren 
Verständnis für die Funktionsweise und Bewertung von Spark als ganzes wichtig sind. Starkes Gewicht wird hierbei auf 
den RDDs als Kernkomponente von Spark gelegt.

Auch bei Verfügbarkeit anwenderfreundlicher Strukturen wie den Spark DataFrames und Spark DataSets mit ihrer eigenen 
API ist für ein gutes Verständnis von Spark dies Wissen wichtig. Insbesondere, wenn stark auf Ebene der RDDs in die 
Verarbeitung eingegriffen werden soll oder muss.

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Spark "Zurück zum Kapitelanfang")

RDD steht für Resilient Distributed Dataset (auf deutsch etwa “robuster verteilter Datensatz”) und stellt das zentrale
Konzept und Objekt für die Abstraktion von Datasets innerhalb von Spark da. RDD nutzen lazy evaluation. Code wird somit
erst dann ausgeführt, wenn eine Action angestoßen wird. So können Transformationen effektiv umgesetzt werden. Von
Nachteil ist hierbei, das Daten nicht typisiert sind und ein RDD über keine Schemainformationen verfügt.

RDDs verfügen über die Fähigkeit, beschädigte Spark Knoten oder Partitionen zu ersetzen. Als Legacy Code ermöglicht RDD
eine Low-Level Kontrolle über die Ausführung und Verarbeitung unstrukturierter Daten und ist für alle Arten von
Anwendungen geeignet und über seiner API zugänglich.

Die Arbeit von Spark kann letztlich auf das Anlegen neuer sowie der Transformation und das Ausführen Operationen auf
vorhandenen RDDs betrachtet werden. Hierbei ist das RDD immutable. Jede Aktion auf ein RDD verändert das zugrunde
liegende RDD nicht, sondern gibt stets ein neues RDD zurück. Hierbei nutzt Spark in starken Maße die Übergabe von
Funktionen.

Es gibt verschiedene Wege, um ein RDD zu erstellen. Gemein ist allen, dass Spark bei der Erstellung die Arbeitsdaten
verteilt und später alle Operationen automatisch verteilt und parallelisiert ausführt. Der generelle Workflow ist
hierbei:

* Erstellen des RDD
* Anwenden von Transformationen
* Ausführen von Aktionen

#### Erzeugen von RDDs

Grundsätzlich existieren zwei Möglichkeiten, um ein RDD zu erzeugen. Zum einen ist dies die Verwendung einer
existierenden Collection, zum anderen das Referenzieren eines extern vorliegenden Datasets.

Bei der Verwendung von Collections werden die Daten bereits im Vorfeld aus den jeweiligen Quellen gelesen und in Form
einer geeigneten Collection gehalten. Mithilfe der Methode parallelize wird dann aus der Collection ein RDD erstellt.
Diese Methode eignet sich insbesondere für Datenbestände, welche mit normalen Werkzeugen gut zu handhaben sind:

```python
sc = SparkContext("local", "SampleApp")
integers = list(range(1,6)
integers_rdd = sc.parallelize(integers)
```

Für sehr große Daten ist die Verwendung der textFile Methode sinnvoller. Mit ihrer Hilfe können auch sehr große,
entfernte Daten einem RDD zugeführt werden:

```python
sc = SparkContext("local", "SampleApp")
lines_rdd = sc.textFile("text.txt")
```

Diese Methode eignet sich auch für externe Datenspeicher wie Amazon S3, HDFS, Cassandra, Elasticsearch sowie JDBC.

### Spark Dataframes

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")v

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Spark "Zurück zum Kapitelanfang")

Die Arbeit auf Basis der zuvor behandelten RDDs ist gut geeignet, wenn man nahe an Spark arbeiten und den größtmöglichen
Einfluss haben möchte. Auf der anderen Seite erfordert die Einarbeitung und der Umgang mit diesem Objekt eine gewisse
Einarbeitung.

Mit der Version 1.3 führte Spark DataFrames ein, welche die sogenannten SchemaRDDs ersetzten. Ab der Version 2.0 dient
die SparkSession als allgemeiner Einstiegspunkt in eine Spark Anwendung. Sie löst den bis dahin genutzen HiveContext
(unstrukturierte Daten) und SQLContext (strukturierte Daten) ab. DataFrames sollen die Arbeit und den Umgang mit Spark
vereinfachen und bieten eine Abstraktion der Datensicht in Spark, nutzen jedoch intern die API der RDDs. Daher können
sie nicht nur auf Basis eines bereits vorhandenen RDDs, sondern auf Basis aller von Spark unterstützten Datenquelle wie
beispielsweise einer Hive Tabelle erzeugt werden. APIs für DataFrames sind für Scala, Java, Python sowie R verfügbar.

Wie zuvor dargestellt, geht man bei der Arbeit mit Spark Dataframes den Weg über eine Spark Session und deren
**_build Methode_**. Anschließend stehen unter anderen eine Reihe von Funktionen wie **_read_** zur Verfügung, um
Textdateien einzulesen.

```python
from pyspark.sql import SparkSession
import pyspark.sql.functions as func

session = SparkSession.builder.appName("Anwendungsname").getOrCreate()
dataframe = session.read.text("Pfad zu einer Datei")
```

Spark Dataframes können hierbei sowohl das Schema der vorhandenen Daten ableiten oder aber ein Schema für die Daten
zugewiesen bekommen. Letzteres ist besonders bei sehr großen Datenbeständen sinnvoll. Zusätzlich kommen bei DataFrames
einQuery-Optimizer für relationale SQL Abfragen sowei ein Catalyst-Optimierer zum Einsatz, der den effizientesten Plan
zur Ausführung der Datenoperationen ermittelt. DataFrames sind daher den RDDs bei der Ausführung überlegen.

Als Nachteil ist jedoch ihre Nähe zu RDDs zu sehen, da sie letztlich eine Kollektion von Row Objekten eines RDD sind.
Erst zur Ausführung greift die Typisierug. Siehe hierzu auch den Artikel von
[Heise](https://www.heise.de/ratgeber/Apache-Spark-2-0-Zweiter-Akt-einer-Erfolgsgeschichte-3292006.html?seite=all 
"zur Webseite")
.

Dataframes sind somit kein Ersatz der RDDs, sondern können als eine Abstraktionsschicht auf die Daten und deren Handling
mit RDDs angesehen werden. Dies verdeutlicht auch die folgende Abbildung.

![spark_dataset.png](./assets/spark_dataframe.png "Einordnung des Spark DataSet")

Besonders im Umfeld von Python sind Dataframes als Pandas DataFrames bekannt und in der Tat zeigen sich im Umgang eine
Reihe von Gemeinsamkeiten aber auch Unterschiede. Der wichtigste ist, dass ein Spark Dataframe eine verteilte Kollektion
von Daten ist, welche konzeptuell ein zweidimensionalen Array mit Reihen und benannten Spalten eines Datenbestandes
entsprechen. Es wurde für die Verarbeitung sehr großer Datenstände optimiert.

### Spark Datasets

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Spark "Zurück zum Kapitelanfang")

Mit der Version 1.6 wurden Anfang 2016
[Spark DataSet](https://spark.apache.org/docs/latest/api/scala/org/apache/spark/sql/Dataset.html "zur 
Webseite")
eingeführt. DataSets stellen eine Erweiterung der DataFrames dar und bieten zur Kompiler Zeit Typsicherheit. Ebenso wie
DataFrames sind DataSets Bestandteil von SparkSQL und bieten so die Möglichkeit zur Nutzung von SQL zur Abfrage
strukturierter Daten. Hierbei handelt es sich bei DataSets ebenso wie bei DataFrames um immutable und verteilte
Datensammlungen und profitieren durch stattfindende Optimierungen. Für die Übertragung der DataSet Objekte ist eine
Serialisierung notwendig. Hierfür nutzt Spark einen eigenen leistungsstarken Decoder.

DataSets orten sich eher in Richtung einer stark typisierten objektorientierten Kapselung von Daten ein. Als Konsequent
existiert so nur eine API für Java und Scala. Dies Manko gleicht Python jedoch von Haus aus bereits durch ein
umfangreiches Ökosystem wie Pandas aus.

### Spark DataFrame vs Spark DataSet

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Spark "Zurück zum Kapitelanfang")

Chronologisch existierten Spark DataFrames bereits vor der Einführung der DataSets. Als Erweiterung vereinfachen sie
den Zugriff auf RDDs mit Funktionen wie agg (Aggregat), select (Auswahl), sum (Summe) und avg (Mittelwert). Für Ihre 
Erzeugung nutzte man zunächst einen Spark- oder SQLContext. Später jedoch SparkSession.

Mit der Einführung der Spark DataSets entstand eine weitere Abstraktion, welche das DataFrame erweiterte, jedoch auch in
Richtung eines objektorientierten Aufbaus änderte. Es wurde die Entscheidung getroffen, beide als Spark DataSet zu
vereinen. In der aktuellen Version existiert somit ein DataSet Objekt, welches sowohl einen stark typisierten Zugriff (
DataSet) und einen nicht typisierten (DataFrame) Zugriff anbietet. Ein DataFrame Objekt wird hierbei als ein
DataSet[row] aufgefasst. Auf der Seite
[Knoldus Inc.](https://medium.com/@knoldus/spark-type-safety-in-dataset-vs-dataframe-174137517821 "zur Webseite")
wird hierauf vertiefend eingegangen und der Sachverhalt schön visuelle verdeutlicht:

![spark_dataset_dataframe.png](./assets/spark_dataset_dataframe.png "Synthese von DataSet und DataFrame")


Eine Übersicht über RDD, DataFrames sowie DataSets lässt sich der folgenden Tabelle entnehmen:


|                                 | RDD                          | Spark DataFrames        | Spark DataSets                  |
| --------------------------------- | ------------------------------ | ------------------------- | --------------------------------- |
| Funktionalität                 | Verteilte Sammlung von Daten | Organisation in Spalten | Erweiterung des DataFrame (OOP) |
| Seit Version                    | 1.0                          | 1.3                     | 1.6                             |
| Typesicherheit zur Kompilerzeit | Nein                         | Nein                    | Ja                              |
| APIs verfügbar                 | Nein                         | Ja                      | Ja                              |
| Spark SQL                       | Nein                         | Ja                      | Ja                              |
| Catalyst Optimizer              | Nein                         | Ja                      | Ja                              |
| Tungsten component              | Nein                         | Ja                      | Ja                              |
| Sprachen                        | Java, Scala, Python, R       | Java, Scala, Python, R  | Java, Scala                     |

### Optimierungen

#### [_zurück zum Seitenanfang_](02_Datenstrukturen.md#2-Datenstrukturen "Zurück zum Seitenanfang")

#### [_zurück zum Kapitelanfang_](02_Datenstrukturen.md#Spark "Zurück zum Kapitelanfang")

Spark ist für die schnelle, verteilte und optimierte Verarbeitung sehr großer Datenbestände entwickelt worden. Um die
Ziel zu erreichen, muss der verwendete Code hochgradig optimiert sein. Zwei in diesen Zusammenhang immer wieder genannte
Optimierungen sind der Catalyst Optimizer sowie die Tungsten Komponenten. Beide sollen hier kurz besprochen werden.

#### Catalyst Optimizer

Die Aufgabe des Catalyst Optimizers ist die Optimierung der Ausführung von Berechnungen innerhalb von Spark. Bei der
Konzeption des Optimierers wurde darauf geachtet, dass dieser durch eigene Methoden erweitert und angepasst werde kann.

Der Optimierer ist ein Bestandteil von Spark SQL. In einem aufwendigen Prozess werden anstehende Transaktionen zunächst
analysiert und anschließend optimiert. Als Ergebnis steht am Ende generierter Java Bytecode, welcher auf jeder Maschine
ausführbar ist. Zur Generierung des Bytecodes wird ein spezielles Features von Scala,
[Quasiquotes](https://docs.scala-lang.org/overviews/quasiquotes/intro.html "zur Webseite")
genutzt. Dies ermöglicht die einfache Erstellung von Syntaxbäumen, welche dann mit Hilfe des Scala Compilers zu Java
Bytecode kompiliert wird.

Auf der folgenden Abbildung von
[data-flair](https://data-flair.training/blogs/spark-sql-optimization "zur Webseite")
findet sich eine etwas vereinfachte Darstellung des Prozessen:

![image.png](./assets/spark_catalyst_optimizer.png "Spark SQL Ausführungsplan")

Der Ausführungsplan unterteilt sich in vier Phasen:

In der ersten Phase werden die anstehenden Transformationen analysiert. Als Ergebnis steht ein logischer Ausführungsplan
am Ende der Verarbeitung. Auf diesen werde in der zweiten Phase die vorhandene Regeln zur Optimierung ausgeführt. Es
entsteht der optimierte logische Ausführungsplan.

Aus dem optimierten logischen Plan werden in der dritten Phase ein oder mehr physikalische Pläne erstellt, welche anhand
des Kostenmodells einer Bewertung unterzogen werden. Am Ende wird der günstigste Plan verwendet und in der vierten Phase
Bytecode generiert, welcher auf jeder Maschine lauffähig ist.

#### Tungsten component

Hinter dem Begriff Tungsteen verbirgt sich ein Sammelprojekt für verschieden Aktivitäten mit dem Ziel, die Performance
von Spark zu verbessern. Grundgedanke ist hierbei, dass weniger Ein- und Ausgabe sowie Netwerke ein Problem darstellen,
sondern in starken Maße Speicher und die Rechenleistung.

In Anlehnung an
[Databricks](https://databricks.com/de/glossary/tungsten "zur Website")
umfasst das Projekt um Moment Aktivitäten in Bereichen:

- Speichermanagement und binäre Verarbeitung um Overheads beim Objekt Modell und der Garbage Collection zu beseitigen
- Bessere Ausnutzung des Speichers durch Verbesserung der eingesetzten Algorithmen
- Nutzung von Codegenerierung um von modernen Compilern und CPUs zu profitieren
- Veringerung der CPU Aufrufen durch die Vermeidung virtueller Funktionsdispatcher
- Speichern von Zwischenwerten in CPU Registern statt im Speicher. Hierdurch verringert sich die Zahl der notwendigen
  Zyklen
- Ausnutzen moderner CPUs und Compilers um Schleifenausführungen zu optimieren

Diese Abschnitt kann nur eine kurze Übersicht über das Projekt wiedergeben. Eine interessante und tiefergehende
Einfühung in Tungsten ist auf der Website von Databrick
[hier](https://databricks.com/blog/2016/05/23/apache-spark-as-a-compiler-joining-a-billion-rows-per-second-on-a-laptop.html "zur Webseite")
zu finden.

### Transformationen und Aktionen

Auf der Ebene der RDDs kennt Spark zwei grundsätzliche Operationen. Die Transformation führt eine Aktion auf 
Daten aus und liefert ein neues RDD zurück. Eine Aktion hingegen ermöglicht den Zugriff auf den vorhandene Daten und 
kann Berechnungen ausführen und das Ergebnis zurückliefern. Als Parameter werden in starken Maße Funktionen übergeben.

Hierbei werden die Transformationen nicht unverzüglich, sondern erst zu einen späteren Zeitpunkt ausgeführt. Dieser
Zeitpunkt ist in der Regel die Ausführung einer Aktion, welche ein Ergebnis zurückliefert. Spark führt somit ein lazy
computing aus.

Dieses Vorgehen ermöglicht Spark, zu einem möglichst späten Zeitpunkt mit der Bearbeitung zu beginnen und eröffnet so
die Möglichkeit, Transformationsschritte zu optimieren. Grundsätzlich werden hierbei in der Grundeinstellung die
Berechnungen bei jedem Aufruf der Action wiederholt, jedoch existiert auch die Option einer Persistierung und
Wiederverwendung der Ergebnisse.

Eine gute Übersicht über die verfügbaren Transformationen und Aktionen findet sich neben der eigentlichen Dokumentation
von Spark
[hier](https://blog.knoldus.com/deep-dive-into-apache-spark-transformations-and-action "zur Webseite")

Ein Punkt für Verwirrung kann die Anwendbarkeit der Transformationen und Aktionen auf Spark DataFrames und DataSets 
sein. Beide Datenstrukturen basieren auf RDDs und nutzen diese nach wie vor im Hintergrund. Der Vorteil dieser 
Strukturen liegt jedoch in der von Ihnen veröffentlichten API, welche den Umgang mit Spark stark vereinfacht. 
Etwas Vereinfacht kann daher gesagt, das bei der Arbeit mit RDDs Transformationen und Aktionen genutzt werden, 
bei der Arbeit mit DataFrames und DataSet deren API. 

#### Übergabe von Funktionen

Spark macht in sehr starken Umfang Gebrauch von der
[Übergabe von Funktionen](https://spark.apache.org/docs/latest/rdd-programming-guide.html#passing-functions-to-spark 
"zur Webseite")
. Dieses Konzept eröffnet zum einen einen sehr umfangreiche Möglichkeiten zur Bearbeitung der Daten, ist jedoch
andererseits nicht jeden sehr vertraut und zudem Sprachabhängig.

Im Context von Python gibt es drei Möglichkeiten, eine Funktion zu definieren und zu übergeben:

1. Nutzen einer
   [Lambda Expression](https://docs.python.org/2/tutorial/controlflow.html#lambda-expressions "zur Webseite")

```python
# Die Methode flatMap iteriert durch jedes Element line und gibt das durch
# split(" ") erzeugte array zurück.

words=lines.flatMap(lambda line: line.split(" "))
```

2. Definition und Übergabe einer lokalen Funktion

```python
# Die Methode main_function ist die Hauptmethode. 
#
# Der darin enthaltene lokalen Methode do_split wird ein String übergeben. Die 
# Methode ruft die Split Methode des String auf und gibt das Ergebnis zurück.
#
# Der Methode flatMap wird die Funktion do_split übergeben. Sie iteriert durch 
# jedes Element, übergibt es an do_split und gibt das Ergebnis zurück.

def main_function():
    def do_split(line):
        return line.splitt(" ")

    words=lines.flatMap(do_split)
```

3. Definition und Übergabe einer Top-Level Funktion in einem Modul.

```python
# Der globalen Methode do_split innerhalb eines Moduls wird ein String übergeben. Die 
# Methode ruft die Split Methode des String auf und gibt das Ergebnis zurück.
#
# Der Methode flatMap wird die globale Funktion do_split übergeben. Sie iteriert durch 
# jedes Element, übergibt es an do_split und gibt das Ergebnis zurück.
  
if __name__ == "__main__":
    def main_function():
        def do_split(line):
            return line.splitt(" ")

    words=lines.flatMap(do_split)
```

#### Übersicht über Transformationen

Im Folgenden werden einige gebräuchliche Transformationen vorgestellt.

##### Filter, Map und FlatMap

Zu zu den wichtigsten, aber häufig zu Anfang irritierensten Transformationen zählen die Funktionen Filter, Map und
FlatMap. Daher soll im Folegnden kurz auf die einzelnen Funktionen eingegangen werden. Ihnen allen ist gemain, dass
ihnen eine Funktion in Form einer Lambda Expression als Parameter übergeben wird, welche die eigentliche Transformation
oder Selektierung ausführt.

###### filter

Bei der Filtermethode wird der Funktion eine Filtermethode übergeben, die auf alle Elemente des RDD angewendet wird. Als
Ergebnis wird ein neues RDD auf Basis der selektierten Elemente zurückgegeben.

![spark_filter.png](./assets/spark_filter.png "Prinzip der Filterung eines RDD")

Der folgende Code würde ein neues RDD zurückgeben, in dem alle (String)Items, welche leer sind, herausgefiltert sind:

```python
sc = SparkContext("local", "SampleApp")
lines = sc.textFile("text.txt")
lines2 = lines.filter(lambda linex: linex.strip() != "")
```

###### map

Bei der Map Methode wird die übergebene Funktion auf alle Elemente des RDD angewendet. Hierbei erfolgt genau eine
Transformation von einem Zustand in einen anderen. Als Ergebnis wird auch hier ein RDD mit den neuen Werten zurück
gegeben.

![spark_map.png](./assets/spark_map.png "Prinzip des Map Transformation")

Der folgende Code würde ein neues RDD mit Integer Werten zurückgeben. Für jedes (String)Item in lines würde in dem neuen
RDD lengths ein (Int)Item für die Länge des entsprechenden Wertes aus lines stehen.

```python
sc = SparkContext("local", "SampleApp")
lines = sc.textFile("text.txt")
lengths = lines.map(lambda line: len(line))
```

Der Typ der zurückgegebenen Elemente muss hierbei nicht dem Typ der ursprünglichen Elemente entsprechen. Wird
beispielsweise für Textelemente die Länge ermittelt, so handelt es sich bei dem zurückgegebenen Elementen um
Zahlenwerte.

###### flatMap

Flat Map unterscheidet sich zu Map dadurch, dass die übergebene Funktion mehr als ein Element zurück geben kann.

![spark_flat_map.png](./assets/spark_flat_map.png "Prinzip der FlatMap Transformation")

Der folgende Code würde für jedes (String)Item des RDD lines den enthaltenen Text auf Basis der Leerstellen splitten und
ein neues RDD mit einer Spalte und n Zeilen zurückgeben.

N würde hierbei der Summe der Längen der jeweils durch splitt erstellten Arrays von Wörtern entsprechen. Als Ergebnis
würde man ein neues (String)RDD wörter erhalten. Jedes seiner Items entspräche dabei ein Wort, seine Länge der Anzahl
der Wörter.

```python
sc = SparkContext("local", "SampleApp")
lines = sc.textFile("text.txt")
wörter = lines.flatMap(lambda line: line.split(" "))
```

#### Übersicht über Aktionen

Im Folgenden werden einige gebräuchliche Aktionen vorgestellt.

##### collect

Die Verarbeitung der Daten kann je nach Größe der Daten verteilt erfolgen. In solch einen Fall liegen die Ergebnisse
der Transformationen ebenfalls verteilt vor und müssen zunächst zusammen gebracht werden. Dies "Einsammeln" geschieht
mit dem Collect Befehl.

##### count, first und take

Die Aktionen ermöglichen einen Überblick über die vorliegenden Daten. Während Count lediglich die Anzahl der vorhandenen
Elemente zurück gibt, gibt first das erste Element und take n-Elemente des zugrundeliegenden RDD wieder.

```python
count_words=lines.count()
```

##### reduce 

Die Reduce Aktion dient der Aggregierung der vorhandenen Daten, indem auf Basis zweier Elemente ein Ergebnis 
berechnet wird.  

```python
words=lines.flatMap(lambda line: line.split(" ")) \
  .map(lambda word: (word, 1)) \
  .reduceByKey(lambda a,b:a+b)
```

In diesem Beispiel wird mit reduceByKey eine Variation von reduce verwendet, welche jedoch prinzipiell auf die gleiche
Art und Weise funktioniert: Der Funktion werden zwei Elemente (a, b) übergeben. Darauf basierend wird der 
Rückgabewert (a+b) berechnet. 

##### foreach

Der Befehl foreach iteriert durch jedes Item des RDD und ermöglicht so eine Elementweise Verarbeitung der Daten. 

```python
top_out = 30

print("")
print("Ausgabe der ersten {} Zeilen des Textes".format(top_out))
print("")

for line in lines.collect()[0:top_out]:
  print(line)
```

In diesem Beispiel werden die Aktionen collect und foreach verwendet, um durch alle Elemente zu iterieren. Hierbei
erkennt man, das es sich um eine Flow API handelt, welche hierdurch sehr übersichtlich wird.

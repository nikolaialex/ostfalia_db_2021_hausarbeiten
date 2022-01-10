#### [Zum Anfang](README.md "zur Startseite") | [Inhaltsverzeichnis](00_Inhaltsverzeichnis.md "zum Inhaltsverzeichnis")

# 3 Mögliche Umgebungen für Spark

In den folgenden drei Unterkapiteln werden Wege aufgezeigt, wie eine produktiv einsetzbare Umgebung für Spark auf 
einfachen Wege eingerichtet werden kann. 

Hierbei wird zunächst die Möglichkeiten aufgezeigt, Spark im Umfeld eines Clouddienstleisters zu betreiben. Dies 
ist vor allem für Unternehmen oftmals eine sinnvolle Lösung, kann aber auch für den ersten Kontakt ansich 
eine kostengünstige und einfach umzusetzende Lösung sein. Anschließend werden Lösungen auf Basis von Google und 
Docker vorgestellt. Beide verbindet, dass sie kostenlos und einfach verfügbar sind.

Spark kann zudem auch auf einen lokalen Rechner eingerichtet werden. Dieser Weg hat jedoch den Nachteil, dass er 
eine Reihe von Downloads, Installationen und Einstellungen bedarf. Für einen ersten Kontakt ist dies nicht optimal
und wird daher hier nicht berücksichtigt. 

* [_Spark in der Cloud_](03_Mögliche_Umgebungen_für_Spark.md#spark-in-der-cloud "zum Abschnitt")
* [_Spark mit Google Colaboratory (Colab)_](03_Mögliche_Umgebungen_für_Spark.md#spark-mit-google-colaboratory-colab "zum Abschnitt")
* [_Spark mit Docker_](03_Mögliche_Umgebungen_für_Spark.md#spark-mit-docker "zum Abschnitt")

## Spark in der Cloud

[_zurück_](03_Mögliche_Umgebungen_für_Spark.md#3-mögliche-umgebungen-für-spark "Zurück")

Insbesondere für Unternehmen kann sich der Einsatz von Spark im Umfeld einer Cloud sinnvoll sein. In der Regel 
können Lösungen zunächst kostengünstig implementiert und mit zunehmenden Nutzen hoch skaliert werden. Die einfache 
Verfügbarkeit macht diese Optionen aber auch für einen ersten Kontakt interessant, da oftmals kostenlose Testzeiträume 
angeboten werden. Grundsätzlich handelt es sich jedoch in der Regel nicht um eine kostenlose Lösung. 

In diesen Abschnitt sollen kurz auf die Angebote von Microsoft Azure, Amazon AWS sowie Google Cloud 
als größte Anbieter von Cloudlösungen eingegangen werden. Eine tiefergehende Beschäftigung würde jedoch 
den Rahmen dieser Arbeit sprengen. Vielmehr sollen erste Anhaltspunkte für den Einstieg gegeben werden.

### Microsoft Azure

Hinter 
[Microsoft Azure](https://azure.microsoft.com/de-de "zur Webseite") 
verbirgt sich die Cloudsparte von Microsoft mit seine cloudbasierten Services und Anwendungen.
Innerhalb von Azure wird Spark in den Bereich Machine Learning unter den Begriff 
[Azure Databricks ein.](https://azure.microsoft.com/de-de/services/databricks "zur Webseite")
einsortiert.

Azur ermöglicht eine einfache, angeleitete und sehr schnelle Einrichtung von autoskalierten Spark Clustern und 
somit ein schnelles Ergebnis. Zusätzlich findet sich sehr umfangreiche 
[Dokumentation](https://docs.microsoft.com/de-de/azure/databricks "zur Webseite") 
zur Arbeit mit Azure Databricks alias Spark.

Daneben bietet Azur die Integration eines Zeppelin Notebooks und ermöglicht somit ein ähnlich komfortables Arbeiten 
wie im Umfeld von Google Colab weiter unten auf dieser Seite. 

Neben der Integration von Git Hub, können im Umfeld von Azure Databricks weitere Dienste von Azure einfach  
genutzt und integriert werden. Hierzu gehören unter anderen:
- **Azure Synapse Analytics** (Auslastung)
- **Azure Machine Learning** (KI Algorithmen und Unterstützung für eine Vielzahl von KI Frameworks)
- **Azure Data Factory** (Datenintegration)
- **Azure Data Lake Storage** (Datenhaltung)

Wie alle Cloudanbieter richten sich die 
[Kosten](https://azure.microsoft.com/de-de/pricing/details/databricks "zur Webseite") 
in erster Linie nach den benötigten Platz, der Leistungsfähigkeit 
sowie der Rechenzeit. Somit ist es notwendig, eine sehr genaue Erwartung zu haben, um einen angenäherten Preis zu 
bestimmen. 

Azure eignet sich auf Grund seines aufgeräumten Designs, der deutschen Sprache, der umfangreichen Verfügbarkeit sowie 
des 30 tägigen kostenlosen Testzeitraums aber auch für ein erstes Kennenlernen von Spark im Enterprisebereich. 

### Amazon AWS

Hinter dem Begriff 
[Amazon Web Services oder kurz AWS](https://aws.amazon.com "zur Webseite")
steht die Cloudsparte von Amazon. Wie bei Microsofts Azure werden auch hier verschiedenen Dienstleistungen angeboten, 
darunter auch ein Hosting von Spark. Anders als bei Azure wird hier jedoch nicht mit Databricks zusammen gearbeitet, 
sondern Spark nativ unterstützt.

Bei Amazon ist für den Einsatz von Spark 
[Amazon EMR](https://docs.aws.amazon.com/de_de/emr/latest/ManagementGuide/emr-what-is-emr.html "zur Webseite") 
notwendig. Amazon EMR steht hierbei für Amazon Elastic MapReduce. Hierbei handelt es sich um eine Plattform, welche 
speziell der Ausführung von Framework wie Spark mit sehr großen Datenkontingenten dienen. Technisch gesehen handelt 
es sich um verwaltete Cluster, welche schnell erstellt werden und zusammenarbeiten können.   

Über die Nutzung von Amazon besteht die Möglichkeit, mit Spark umfangreiche Verarbeitungspipelines aufzubauen und 
hierfür auf allen ebenen Zugriff und Unterstützung durch die Amazon Cloud zu erreichen. Für das Interaktive Arbeiten 
sind Jupyter oder Zeppelin Notebooks verfügbar.

Amazon fokussiert auf der 
[Übersichtsseite für Spark](https://aws.amazon.com/de/elasticmapreduce/details/spark "zur Webseite") 
auf vier Funktionalitäten:
- **S3_Sketch_Available**: Zielt auf ein Hohe Performance auf Basis gerichteter azyklischer Graphen und RDDs
- **S3_Sketch_High_Performance**: Ermöglicht die Einbindung von Java, Scala und Python. Spark SQL ist verfügbar ebenso 
  wie eine interaktive Umgebung via Notebooks. Die Schnelle Entwicklung von Anwendungen steht hier im Vordergrund.
- **S3_Sketch_Simple**: Fokussiert auf die schnelle Erstellung von Workflows. Folgerichtig sind hier die Bibliotheken für 
  maschinelles Lernen (MLib), Stream Verarbeitung (Spark Streaming) sowie der Graphverarbeitung (GraphX) einfach 
  zugreifbar.
- **Integration in Amazons EMR-Funktionssatz**: Bietet eine tiefe Integration Amazon EMR. Arbeitsschritte von Spark 
  können hierbei an die sogenannte Step-API von Amazon EWS zur Ausführung übermittelt werden. Hierbei erfolgt die 
  gesamte Verwaltung von Spark und der verwendeten Infrastruktur. 

Bei Amazon AWS handelt es sich grundsätzlich um einen kostenpflichtigen Dienst. Je nach Leistungsfähigkeit und 
Funktionalität müssen für die Nutzung 
[Entgelte](https://aws.amazon.com/de/emr/pricing "zur Webseite") 
entrichtet werden. Wie zuvor ist es daher wichtig zu wissen, was genau in Anspruch genommen werden wird.

Daneben bietet auch Amazon kostenlose Testzeitraume und begrenzte bzw. dauernd kostenlose Dienstleistungen an. Eine 
[Übersicht](https://aws.amazon.com/de/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=tier%23always-free&awsf.Free%20Tier%20Categories=*all&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all&refid=7f46dc7a-cf36-47f2-8b7b-74dceeb857ff#Free_Tier_details "zur Webseite") 
geht hierauf detaillierter ein. Zudem stehen umfangreiche Ressourcen in deutscher Sprache für die Einarbeitung in 
Amazon AWS, jedoch eher weniger 
[speziell für Spark](https://aws.amazon.com/de/big-data/what-is-spark "zur Webseite") 
zur Verfügung. 

Alles in allen ist auch Amazon für ein erstes Kennenlernen geeignet. Nach Meinung des Autors zeigt sich jedoch die 
Oberfläche von Microsofts Azure aufgeräumter. Daher wird der Einstieg hier eher als komplizierter angesehen.

### Google Cloud

Unter dem Begriff 
[Google Cloud](https://cloud.google.com "zur Webseite")
finden sich das Angebot von Google für den Cloudbereich. Ebenso wie die zuvor behandelten Anbieter, verfügt auch
Google über eine beachtliche Zahl an Diensten auf Cloudbasis. Positiv ist auch hier, dass alle besuchten Seiten auf 
Deutsch waren sowie das Vorhandensein einer bemerkenswert umfangreichen 
[Dokumentation](https://cloud.google.com/docs "zur Webseite").

Um auf Basis der Google Cloud mit Spark zu arbeiten bedient man sich des 
[Dataproc Dienstes](https://cloud.google.com/dataproc "zur Webseite")
Hierbei handelt es sich nach Google um einen verwalteten und hoch skalierten Dienst, welcher jedoch nicht nur für Spark 
oder Hadoop reserviert ist, sondern auch weitere Open Source Projekte zugänglich macht. Google fokussiert somit nicht  
auf die reine Nutzung von Spark, sondern bietet eher eine ganze 
[Umgebung](https://cloud.google.com/dataproc#section-9 "zur Webseite") 
für den "Data Scientisten" unter Einbindung von Spark und anderen Apache Projekten und Open Source Anwendungen an, 
zeigt aber auch die Möglichkeiten zur Anbindung an die eigenen Angebote auf.

Ebenso wie bei den zuvor behandelten Cloudanbietern handelt es sich auch bei Google Cloud um einen grundsätzlich 
[kostenpflichtige Dienste](https://cloud.google.com/dataproc/pricing "zur Webseite"). 
Auch hier erfolgt die Preisfindung auf Basis der Leistungsfähigkeit und des verwendeten Dienstes, so dass 
eine genaue Planung der tatsächlich benötigten Ressourcen sinnvoll ist.

Ebenfalls bietet Google einen 
[kostenlosen Testzeitraum und Testguthaben](https://console.cloud.google.com/freetrial "zur Webseite")
, welches 90 Tage nutzbar ist, sowie eine Vielzahl an 
[freien monatlichen Kontingenten](https://cloud.google.com/free "zur Webseite")
für verschiedene Dienste an. Interessant ist die klare Versicherung, dass die anzugebene Kreditkarte nur
dann belastet werde, wenn ein manuelles Upgrade auf ein kostenpflichtiges Konto erfolgt sei. Diese Versicherung findet
man bei den vorherigen Anbietern nicht in dieser Klarheit.

Nach Meinung des Autor handelt es sich bei dem Angebot von Google um ein sehr aufgeräumtes Angebot ähnlich dem von
Microsofts Azure, wobei dies direkter auf die Spark Nutzung abzielt und je nach Ziel sinnvoller sein 
kann. 

## Spark mit Google Colaboratory (Colab)

[_zurück_](03_Mögliche_Umgebungen_für_Spark.md#3-mögliche-umgebungen-für-spark "Zurück")

Ein einfache Möglichkeit, um mit Spark zu arbeiten, bietet
[Google Colaboraty](https://colab.research.google.com/?utm_source=scs-index "zur Webseite")
oder einfach Google Colab. Bei Google Colab handelt es sich um eine von Google kostenlos zur Verfügung gestellte
Umgebung für ein Jupyter Notebook.

Das Notebook eignet sich zum collaborativen Arbeiten und kann wie andere Dokumente innerhalb von Drive einfach
freigegeben werden. Aus den Notebook ist grundsätzlich ein Zugriff auf das eigene Drive möglich, jedoch nicht zwingend
notwendig.

Der Vorteil bei dieses Vorgehens ist die vorhandene Infrastruktur für das Notebook und die Möglichkeit einer doch
beachtenserten Rechenleistung der darunter liegenden virtuellen Maschine. Als Betriebssystem dient Linux. Sowhl Python
als auch Jupyter ist mit den gängigsten Bibliotheken vorinstalliert.

Als größter Nachteil ist die Flüchtigkeit der Daten zu nennen. jedes Ergebnis, aber auch jede gemachte Installation und
Download von Daten wird nach einer Zeit der Inaktivität gelöscht. Daher empfielt es sich, in seinen Routinen immer auch
die Vorbereitung des Notebooks zu hinterlegen.

Alle im folgenden beschriebenen Arbeitsschritte finden sich auh als lauffähiges Beispiel im
[_Jupyter Notebook mit RDD_](notebook/Wordcount_mit_Spark_RDD.ipynb "zum Notebook")
oder
[_Jupyter Notebook mit DataFrame_](notebook/Wordcount_mit_Spark_DataFrame.ipynb "zum Notebook")
im Abschnitt **Vorbereitung des Notebooks**.

### Vorbereiten des Notebooks

Für den Einsatz von Spark sind in jedem Fall drei Voraussetzungen notwendig:

+ [Java](https://openjdk.java.net "zur Webseite") muss instaliert sein, damit Spark ausgeführt werden kann.
+ [Spark](https://spark.apache.org "zur Webseite") muss installiert sein
+ die Bibliothek [FindSpark](https://pypi.org/project/findspark "zur Webseite") muss installiert sein
+ die Bibliothek [PySpark](https://spark.apache.org/docs/latest/api/python "zur Webseite")
  muss installiert sein. Auf den Seiten von Apache.org findet man
  [weiter gehende Informationen zu PySpark](https://spark.apache.org/docs/latest/api/python "zur Webseite")

#### Installation von Java und Spark

[Spark](https://spark.apache.org "zur Webseite") wurde in der Programmiersprache
[Java](https://openjdk.java.net "zur Webseite") geschrieben. Für seine Ausführung ist es daher notwendig,
eine Java Umgebung einzurichten. Hierfür muss eine Installationsdatei für Java heruntergeladen und installiert werden.
Spark selbst hingegen benötigt als Java Programm keine Installation, sondern lediglich eine korrekt installierte Java
Laufzeit.

```Python 
# Installation  von Java
!apt-get install openjdk-8-jdk-headless -qq > /dev/null

print("Java ist installiert...")

# Download und Entpacken von Spark (Versionsnummer anpassen!)
!wget -q https://archive.apache.org/dist/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz
!tar xf spark-3.2.0-bin-hadoop3.2.tgz

print("Spark ist verfügbar...")
```

Nach der Installation und für den Betrieb ist es sehr wichtig, alle Systemvariablen für Spark und Java korrekt zu
setzen. Der folgende Code zeigt beide genannten Schritte.

```Python 
# Setzen der Systemvariablen für Java und Spark
import os
os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-8-openjdk-amd64"
os.environ["SPARK_HOME"] = "/content/spark-3.2.0-bin-hadoop3.2"

print("Umgebungsvariablen sind gesetzt...")
```

#### Installation der benötigten Python Bibliotheken

Nach Ausführung beider Schritte existiert eine Umgebung mit einer funktionierende Spark Installation. Um einfach mit
Spark und Python arbeiten zu können, fehlen noch zwei Bibliotheken.

[PySpark](https://spark.apache.org/docs/latest/api/python "zur Webseite") ist ein Interface für die Nutzung
von Spark mit Python. Es ermöglicht also die Programmierung von Sparkanwendungen mit Python. Hierbei werden die meißten
der Features von Spark unterstützt.

```Python 
# Installation von findspark und pyspark

!pip install findspark
print("FindSpark wurde installiert...")

!pip install pyspark
print("PySpark wurde installiert...")
```

Damit
[PySpark](https://spark.apache.org/docs/latest/api/python "zur Webseite")
von Python genutzt und importiert werden kann, müssen beide voneinander wissen. Hier
kommt [FindSpark](https://pypi.org/project/findspark "zur Webseite") ins Spiel.

#### Initialisierung der Programmierumgebung

Laut Aussage des [Git Repository](https://github.com/minrk/findspark "zum Repository")
von FindSpark bieten sich Grundsätzlich zwei Wege an. Mit dem ersten wird die PySpark so verlinkt, dass Python es finden
kann. Dies ist im allgemeinen bei den verwendeten Packages. Bei Verwendung des zweiten Weges wird der Pfad zu
[PySpark](https://spark.apache.org/docs/latest/api/python "zur Webseite")
mit im Systempfad hinterlegt.

[FindSpark](https://pypi.org/project/findspark "zur Webseite")
verwendet die zweite Option und fügt den Pfad zu PySpark zur Laufzeit dem Systempfad hinzu. Hierzu wird der Befehl
init() genutzt.

```Python 
# Initialisieren von findspark

try: 
  import findspark
  from pyspark import SparkContext, SparkConf
  
  findspark.init()
  
  print("FindSpark und PySpark wurden initialisiert")
except ImportError: 
  raise ImportError("Fehler bei der Initialiserung von FindSpark und PySpark")
```

### Vor- und Nachteile

Als Vorteile dieser Vorgehensweise sind zu nennen:

* kostenlos
* überall verfügbar
* Möglichkeit zur colaborativen Zusammenarbeit
* einfache Nutzung, da sowohl das Notebook als auch die Python Umgebung vorhanden
* eignet sich für Lehrzwecke, kleine Projekte, Prototyping und Verteilung von Beispielen
* Leistungsfähiges virtuelles System

Als Nachteile sind zu nennen:

* keine dauernde Serialisierung der Ergebnisse, Installationen oder Daten
* Vor der Arbeit ist das System erst wieder zu erstellen
* Google Ökosystem steht im Ruf nicht sehr annonym zu sein

## Spark mit Docker

[_zurück_](03_Mögliche_Umgebungen_für_Spark.md#3-mögliche-umgebungen-für-spark "Zurück")

Die Verwendung von Google Colaboratory zeigte bereits eine einfache Möglichkeit, ein Spark Umgebung für die Verwendung
mit Python zu erstellen. Verfügbar war diese Lösung jedoch nur innerhalb des Google Ökosystems.

Spark mit Docker bietet eine weitere einfache Möglichkeit, um Docker auf einen lokalen Rechner verfügbar zu machen. In
diesen Abschnitt wird gezeigt, wie mit Hilfe von Docker eine in _Jupyter Notebook_ verfügbare Sparkumgebung angelegt
werden kann.

Bei Docker arbeitet man mit sogenannten Containern, welche einen Prozess visualisieren. Die Basis eines Containers
bildet ein Image. Ein gute Einführung zu Docker findet sich auf den Seiten von
[Docker](https://docs.docker.com/get-started/overview "zur Webseite").

Einer der Vorteile von Docker ist die sehr große Sammlung bereits fertiger Images
im [Docker Hub](https://hub.docker.com "zur Webseite"). Hier finden sich für viele
Anwendungsfälle bereits vorgefertigte Lösungen.

Unabhängig von Spark ist für die Ausführung eines Docker Containers die Installation einer Docker Runtime notwendig.
Diese ist in Form eines _Docker Desktop_ für die Plattformen Mac, Windows und Linux verfügbar. Die Installation von
Docker ist nicht Teil dieser Arbeit, jedoch findet sich eine gute Einführung
auf [Docker](https://docs.docker.com/get-started/overview "zur Webseite").

### Dockerimage

Als Basis dient das [_Jupyter Notebook Python, Spark Stack_](https://hub.docker.com/r/jupyter/pyspark-notebook  "zur Webseite")
Notebook. Es beinhaltet ein fertig konfiguriertes Linux System mit installierten Java, Python und Spark. Es ist also
nicht nötig, manuelle Einstallungen oder Installationen auszuführen, um Spark innerhalb eines 
[_Jupyter Notebooks_](https://jupyter.org/index.html "zur Webseite") auszuführen.

### Download und erster Start

Dieser Schritt setzt die Installation des _Docker Desktop_ wie oben beschrieben voraus. In einer Eingabekonsole wird der
folgende Befehl eingegeben:

``` 
docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes --name pyspark jupyter/pyspark-notebook
```

Bei der ersten Ausführung wird das Image _jupyter/pyspark-notebook_ direkt vom _Docker Hub_ herunter geladen, sofern es
noch nicht lokal vorhanden ist. Anschließend wird auf Basis des heruntergeladenen Image ein Container erstellt. Dieser
Container horcht auf dem _Port 8888_ und [_
JupyterLab_](https://jupyterlab.readthedocs.io/en/stable "zur Webseite") ist
aktiv. Der Name des erstellten Containers lautet _pyspark_.

Nach dem ersten Zugriff auf den Container, kann dieser wie im folgenden gezeigt, einfach gestartet werden:

```
docker start -a pyspark
```

Möchte man bei der Arbeit mit Jupyter Notebook auf eigene Daten oder Verzeichnisse zugreifen, so müssen sie vor dem
Start für den Container zugänglich gemacht werden. Hierfür gibt es eine Reihe von Möglichkeiten.

Um innerhalb eines Containers mit eigenen Daten zu arbeiten, müssen diese aus dem Container zugreifbar sein. Hierfür
gibt es
[verschiedene Möglichkeiten](https://docs.docker.com/storage "zur Webseite")
. Ein einfacher Weg ist das Kopieren der Dateien oder Verzeichnisse in den Container. Hierzu darf dieser nicht gestartet
sein:

```
cp [DOWNLOAD VERZEICHNIS] pyspark:/home/jovyan/work
```

### Zugriff auf das Jupyter Notebook

Während des Startvorgangs erfolgen ene Reihe an Ausgaben auf der Konsole. Am Ende wird eine URL mit einem Token
ausgegeben.

![docker_ausgabe_konsole.png](assets/docker_ausgabe_konsole.png "Ausgabe der Konsole")

Über einem Browser gelangt man hiermit zur Eingabekonsole des _Jupyter Notebooks_. Da bereits alle für Spark benötigten
Installationen und Einstellungen gemacht wurden, kann dort direkt wie oben unter [_Google
Colaboratory_](03_Mögliche_Umgebungen_für_Spark.md#spark-mit-google-colaboratory-colab "Hier geht es zum Abschnitt Spark mit Google Colaboratory (Colab)")
beschrieben gearbeitet werden.

![docker_ide_jupyter.png](assets/docker_ide_jupyter.png "Ausschnitt der Web IDE von Jupyter mit Docker")

### Vor- und Nachteile

Als Vorteile dieser Vorgehensweise sind zu nennen:

* kostenlos
* einfache Verfügbarkeit über _Docker Hub_
* einfache Nutzung, da alle Installationen und Einstellungen vorhanden sind
* eignet sich für Lehrnzwecke und lokales Arbeiten mit übersichtlichen Datenmengen
* Daten und Ergebnisse können mit dem Container serialisiert werden kann auch produktiv zum Aufbau der eigenen
  Infrastruktur eingesetzt werden
* kann auch im Serverumfeld - dann mit größeren Datenbeständen und/oder verteilt - eingesetzt werden

Als Nachteile sind zu nennen:

* sofern Anpassungen notwendig sind, werden auch hier tiefere Kenntnisse benötigt
* als Out-of-the-Box Lösung, ist man auf das Wissen und die Fähigkeiten der Anbieter angewiesen
* Notwendigkeit zur Installation einer _Docker Laufzeit_ mit privilegierten Rechten
* Sicherheitsrisiken im Umfeld von _Docker_ können das eigene System gefährden

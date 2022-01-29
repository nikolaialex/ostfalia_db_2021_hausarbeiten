# Grundlagen
Graphdatenbanken oder Graph Database Management Systems (GDMS) existieren seit den Achtzigerjahren. 
Seitdem haben sich diverse Software- und Hardwarelösungen auf dem Markt etabliert, welche sich als Alternative zu den weiter verbreiteten relationalen Datenbanken darstellen. [[1]](#gdms)

## Prinzipien
Graphdatenbanken wenden die Graphentheorie der Mathematik an, um sie für die Datenspeicherung und -organisation zu verwenden. 
Daten werden in Vertices und Edges (oder in der Informatik auch Knoten und Kanten) strukturiert und bilden so ein Informationsnetz.
Die modernen Graphen Technologien definieren sich vornehmlich durch zwei Aspekte: Das Datenbank Modell und das Graph Database Management System. [[1]](#gdms)[[2]](#graph-databases)


### Modellierung 
Als Modell einer Graphdatenbank wird das konzeptionelle  Designkonzept bezeichnet, nach welchem die Daten strukturiert werden. 
Dies beinhaltet die Abstrahierung der Daten, sodass sie der Form eines Graphen entsprechen. Entitäten werden in Form von Nodes modelliert, welche daraufhin mithilfe von Relationships miteinander in Verbindung gebracht werden und in einen semantischen Kontext eingeordnet werden. [[1]](#gdms)[[2]](#graph-databases)<br>

Auf dem Markt haben sich bis heute unterschiedliche Designphilosophien etabliert: 
* _Labeled Property Graph_: Das wohl am weitesten verbreitete Graphenmodell erweitert Nodes und Relationships, um eine beliebige Anzahl an Labels und Properties. Somit können komplexe Entitäten kategorisiert und repräsentiert werden.
  
* _Hypergraph model_: Das Hypergraph Modell führt eine komplexe Struktur für Edges ein, indem diese nicht wie im klassischen Sinne zwei Nodes verbinden, sondern mit einem beliebig großen Set an Nodes in Verbindung gebracht werden können. Dies ermöglicht eine flexible und detailreiche Gestaltung von Relationships.

* _Trees_: Die Daten werden in Form eines aus der Informatik bekannten n-nären Baum organisiert. Dies entspricht der Form von Dokumenttypen wie XML oder JSON und verspricht große Flexibilität und Skalierbarkeit.

* _Resource Description Framework_: Das ursprünglich vom W3C zur Darstellung von Metadaten im Web vorgeschlagene Resource Description Framework basiert auf einem Triplen System. Dadurch folgt der Graph immer einem Node-Relationship-Node Prinzip, welches fähig ist simple Subjekt-Verb-Objekt Aussagen zutreffen. 

### Graph Database Management Systeme
Graph Database Management Systeme sind Hard- und Softwarelösungen, welche für Graphdatenstrukturen optimiert sind. 
Sie lassen sich als transaktionelle Systeme beschreiben, welche klassische CRUD-Methoden zur Manipulation zur Verfügung stellen.  
Allgemein betrachtet besitzen GDMS zwei Eigenschaften nachdem sie unterschieden werden können: die Speicherung (storage) und die Verarbeitungsmethodik (processing engine) der Daten. <br>
Die Speicherung der Daten kann auf unterschiedliche Weise erfolgen. Manche GDMS nutzen unter der Haube andere DBMS, zum Beispiel relationale, und serialisieren lediglich die Graphenstruktur in das zugrundeliegende Datenbankmodell. Es gibt allerdings auch GDMS, welche optimiert sind, um Graphdatenstrukturen zu verarbeiten. Sogenannte _native graph storages_  heben sich daher in Hinsicht auf Performanz und Effizienz der Datenspeicherung deutlich ab. <br>
Auch die Verarbeitung von Graphdaten kann nativ oder unter Zuhilfenahmen von anderen DBMS geschehen. Sogenanntes _native graph processing_ verfügt dabei über die Eigenschaft der _index-free adjacency_. In einem GDMS, welches index-free adjacency implementiert, halten alle Nodes direkte Referenzen auf in der Nähe befindlichen Nodes. Dies macht Datenbankoperationen deutlich effizienter, als unter Zuhilfenahme von globalen Indices. [[1]](#gdms)[[2]](#graph-databases)

## Anbieter
Über die Jahre haben sich diverse Anbieter von GDMS am Markt etabliert. Zu den populärsten zählen die folgenden Technologien:

* **Neo4j**: Die (nach eigenen Angaben) weit verbreiteste Graphendatenbank. Sie nutzt native graph storage und native graph processing und die Manipulation erfolgt über die Query Language Cypher. Das Modell folgt dem Labelled Property Graph Konzept. [[3]](#neo4j)
  
* **ArangoDB**: ArangoDB ist eine multi-model DB. Man kann wählen zwischen Graphdatabase, Documentstore und Key-Value Store. Die Graphdatenbank ist konzipiert nach dem Labelled Property Graph und Datenbankabfragen werden über die hauseigene Sprache AQL gemacht. Die Graphdaten werden in RocksDB, einen Key-Value Store serialisiert, d.h. die Speicherung ist nicht nativ. Allerdings erfolgt die Verarbeitung der Daten über native graph processing. [[4]](#arango)

* **RedisGraph**: Redis ist ein populäres Datenbanksystem basierend auf einer Key-Value Datenstruktur. RedisGraph ist ein Erweiterungsmodul, um einen Labelled-Property-Graph zu implementieren. Speicherung und Verarbeitung erfolgen nicht nativ, aber als Query Language wird Cypher (bekannt von Neo4j) genutzt. [[5]](#redis)

<hr>
<a name="gdms">[1] </a> Renzo Angles, Claudio Gutierrez, An introduction to Graph Data Management, 2017 <br>
<a name="graph-databases">[2] </a> Ian Robinson, Jim Webber, Emil Eifrem, Graph Databases - New Opportunities for connected data, O'Reilly Media, Inc., 2015 <br>
<a name="neo4j">[3] </a> Neo4j, Inc., Neo4j Grap Data Platform, https://neo4j.com/, Abgerufen am 04.01.2021 <br>
<a name="arango">[4] </a> ArangoDB, Inc., ArangoDB Documentation, https://www.arangodb.com/documentation/, Abgerufen am 04.01.2021 <br>
<a name="redis">[5] </a> Redis Labs Ltd, RedisGraph, https://oss.redis.com/redisgraph/, Abgerufen am 04.01.2021 <br>

<hr>

[< Einleitung](./1_Einleitung.md) | [Allgemeine Gegenüberstellung von RDBS und GDB >](./3_Comparison.md)

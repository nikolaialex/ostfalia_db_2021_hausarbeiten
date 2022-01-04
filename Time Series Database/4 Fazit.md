# 4 Fazit

Die Arbeit beschäftigt sich mit Open-Source-Datenbankmanagementsystemen für Zeitreihen, auch *Time Series Database* genannt. Drei Zeitreihendatenbanken wurden dabei beispielhaft für unterschiedliche Datenbankmodelle eingehender betrachtet: InfluxDB, GridDB und TimescaleDB. Jedes dieser Time Series DBMS vereint mehrere Datenbankmodelle. Während alle drei Zeitreihendatenbanken-Datenbankmanagementsysteme primär ein Time Series DBMS sind, unterscheiden sie sich in ihrem sekundären Ansatz des Datenbankmodells. Die mit Abstand populärste Time Series Database *InfluxDB* basiert sekundär auf dem Datenbankmodell des *Spatial DBMS*. *GridDB* verwendet als sekundäre Datenbankmodelle den *Key-Value Store* und das *relationale DBMS*. *TimescaleDB* nutzt als sekundäres Datenbankmodell ein relationales DBMS.  
Die drei Time Series DBMSe wurden nach verschiedenen Kriterien analysiert und verglichen. Ein Vergleichskriterium war das Datenmodell. Das Datenmodell von *InfluxDB* verwendet *Tag-Sets* und basiert auf *Measurements*. InfluxDB hat kein festes Schema. Dies ermöglicht eine große Flexibilität und erspart den Aufwand, der zum Beispiel beim Einrichten einer relationalen Struktur entsteht. *GridDB* setzt dagegen auf das *Key-Container*-Datenmodell, wobei die *Container* entweder *Time Series* mit Zeitwerten als *Key* oder *Collections* mit beliebigen Werten als *Key* enthalten können. GridDB verbindet mit seinem Datenmodell die Vorteile von klassischen relationalen DBMSen und NoSQL-DBMSen. *TimescaleDB* basiert als Erweiterung des DBMSs *PostgreSQL* auf einem relationalen Datenmodell und kann mit *Wide Tables* und *Narrow Tables* flexibel an verschiedene Anwendungsfälle angepasst werden.  
Die Partitionierungsmechanismen erleichtern den Umgang mit großen Datenmengen und wurden als weiteres Kriterium für den Vergleich der betrachteten Time Series DBMSen herangezogen. *InfluxDB* und *GridDB* verwenden *Sharding* für die Partitionierung. *TimescaleDB* setzt sowohl *Zeitpartitionierung* als auch *Zeit- und Raum-Partitierung* ein.  
Replikationsmechanismen erhöhen die Ausfallsicherheit, Verfügbarkeit und Lesegeschwindigkeit von Systemen. In einer *InfluxDB* müssen zwei Kopien von Daten in unterschiedlichen Shard-Gruppen und in separaten Knoten abgespeichert werden. Der Replikationsmechanismus und der Replikationsfaktor sind ansonsten frei wählbar, was die Flexibilität erhöht. In *GridDB* können verschiedene Replikationsstufen mit *Master-, Backup-* und *Catch-up*-Knoten definiert werden. *TimescaleDB* setzt  die *Streaming-Replikation* ein, bei der Daten in eine primäre Datenbank geschrieben werden und die Knoten mit den gespiegelten Daten als *Read-Replicas* definiert werden können.  
*InfluxDB*, *GridDB* und *TimescaleDB* unterstützen mehrere Programmiersprachen. *InfluxDB* wurde in Go geschrieben, *GridDB* in C++ und *TimescaleDB* in C. Alle der drei untersuchten Time Series DBMSe verfügen über eine hohe Perormance und können große Datenmengen verarbeiten. Sie werden daher bevorzugt im IoT-Bereich, für Echtzeitanalysen und Überwachungsszenarien eingesetzt.
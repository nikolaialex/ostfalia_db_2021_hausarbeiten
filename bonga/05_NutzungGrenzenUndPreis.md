# 5	Cloud Firestore Nutzung, Grenzen und Preis

Cloud Firestore ist nicht kostenlos. Die Kosten für die Cloud Firestore Nutzung werden von mehreren Faktoren beeinflusst. Folgende Faktoren beeinflussen die Kosten von Cloud Firestore: <br><br>
•	Die Anzahl der Dokumente, die gelesen, geschrieben und gelöscht werden <br>
•	Die Menge an Speicherplatz, die die Datenbank verwendet, einschließlich Overhead für Metadaten und Indizes.<br>
•	Die Menge an Netzwerkbandbreite, die verwendet wird.<br><br>

Die Cloud Firestore Kosten hängen auch von dem Standort ab, wo die Daten gespeichert sind. Die Tabelle 2 zeigt die Cloud Firestore Preise pro Aktion für ein paar Standorte. 


| Aktion / Funktion    | USA (Mehrere Regionen)      | Montréal      | São Paulo      |    Frankfurt |
|:---------------------| :---         |:--------------|    :---       | :---         | 
| Lesen                |0,06 $ pro 100.000 Dokumente| 0,033 $ pro 100.000 Dokumente         |0,045 $ pro 100.000 Dokumente|0,039 $ pro 100.000 Dokumente| 
| Schreiben            |0,18 $ pro 100.000 Dokumente|0,099 $ pro 100.000 Dokumente|0,135 $ pro 100.000 Dokumente|0,117 $ pro 100.000 Dokumente|
| Löschen              |0,02 $ pro 100.000 Dokumente|0,011 $ pro 100.000 Dokumente|0,015 $ pro 100.000 Dokumente|0,013 $ pro 100.000 Dokumente |
| Speichern            |0,18 $/GiB/Monat| 0,099 $/GiB/Monat|0,135 $/GiB/Monat|0,117 $/GiB/Monat| 


Tabelle 2: Cloud Firestore Preise pro Aktion und Region

<br><br>

Für alle Cloud Firestore Aktionen oder Funktionen gibt es kostenlose Kontingente. Diese Preise der Tabelle 2 werden aber nur angewendet, nachdem die kostenlose Kontingente verbraucht wurden. Die Grenzen für kostenlose Kontingente sind in der Tabelle 3 aufgelistet.




|                    | firefly        |
|:-------------------|:---------------| 
| Gespeicherte Daten | 1 GB           | 
| Lesen              | 50.000 po Tag  | 
| Schreiben          | 20.000 pro Tag |
| Löschen            | 20.000 pro Tag |
 Netwerk Verwendung | 10 GiB pro Monat|

Tabelle 3: Cloud Firestore kostenlose Kontingente



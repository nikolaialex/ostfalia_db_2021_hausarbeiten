# 1. Einleitung

Heutzutage muss fast jede Applikation Daten speichern oder auf Daten zugreifen, die irgendwo gespeichert sind. Für die Speicherung der Daten waren SQL-Datenbanken lange Zeit die Standardlösung. Mit der Zeit haben sich immer mehr Alternative entwickelt, zum Beispiel, NoSQL Datenbanken. In dieser Arbeit wird die NoSQL Datenbank Cloud Firestore vorgestellt.

## 1.1 NoSQL Datenbanken?

In der Vergangenheit waren SQL-Datenbanken der Standard. In SQL-Datenbanken werde Elemente in Tabelle gespeichert, die ein bestimmtes Schema haben. Es ist genau definiert welche Spalten jede Zeile haben muss und welche Datentypen in den Zellen gespeichert werden. Aus diesem Grund kann man in der Regel nur einen einzigen Objekttyp in einer Tabelle Speichern und bei jeder Änderung des Datenmodells, müssen alle alten Daten angepasst werden.
In einer NoSQL Datenbank, gibt es keine Einschränkung was die Datentypen angeht, die in dir Datenbank gespeichert werden können. Es gibt auch keine festen Schemata, wie in SQL-Datenbanken. In einer NoSQL-Datenbank gibt es verschiedene Möglichkeiten Daten zu speichern. Man kann Daten als Key-Value Paare, als eine verschachtelte Baum-Struktur, als JSON-Objekte oder als etwas anderes speichern. Daten, die in der SQL-Welt in unterschiedlichen Tabellen gespeichert wären, können alle zusammen in NoSQL Datenbanken gespeichert werden. In einer NoSQL Datenbank müssen nicht alle Einträge die gleichen Felder haben oder die gleiche Länge. Das gibt Entwicklern eine große Flexibilität, weil bei Änderungen nicht gleich alle alten Einträge angepasst werden müssen.


## 1.2 Firebase Cloud Firestore?

Firebase Cloud Firestore ist eine, in der Cloud gehostete, horizontal skalierbare NoSQL Datenbank . Sie wurde von Google entwickelt. Eine Cloud Firestore Datenbank besteht aus Dokumenten und Sammlungen von Dokumenten, die in einer Baumstruktur gespeichert sind. Dokumente ähneln JSON Objekte. Sie bestehen aus Key-Value Paare, die Felder genannt werden. In einer Cloud Firestore Datenbank kann man sehr unterschiedliche Datentypen speichern. Die Tabelle 1 zeigt eine Übersicht der Datentypen, die in Cloud Firestore verwendet werden können.



| Datentyp              | Sortierreihenfolge | Anmerkungen   |
|:----------------------|:-------------------|:--------------|
| Array                 | 12                 | 23            |
| Boolean               | 1                  | 	          30 |
| Bytes                 | 11                 | 	28           |
| Date and time         | 3                  | 28            | 
| Floating-point number | 2                  | 11            |
| Geographical point    | 1                  | 10            |
| Integer               | 8                  | 23            |
| Map                   | 7                  | 22            |
| Null                  | *field value*      | *field value* |
| Reference             | 7                  | 22            |
| Text string           | *field value*      | *field value* |

Tabelle 1: Cloud Firestore unterstützte Datentypen

<br>

Die Tabelle 1 zeigt auch die Sortierreihenfolge der Datentypen, die unterstützt werden. Es kommt aber vor, dass unterschiedliche Datentypen in Abfragen gemischt werden. In diesem Fall gilt die folgende Sortierreihenfolge:

1-  Null values\
2-  Boolean values\
3-  Integer and floating-point values, sorted in numerical order\
4-  Date values\
5-  Text string values\
6-  Byte values\
7-  Cloud Firestore references\
8-  Geographical point values\
9-  Array values\
10- Map values

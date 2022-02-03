# 1 Einleitung

Im Zeitalter von Big Data, dem Aufkommen des Internet der Dinge oder auch der Künstlichen Intelligenz wächst das Aufkommen von zeitindizierten Daten. 
Es gibt kaum noch Bereiche, die nicht auf die Verarbeitung von zeitbasierten Daten setzen und für die der Einsatz einer Zeitreihendatenbank einen Mehrwert liefern kann.  

Zeitreihen-DBMS haben sich in den vergangenen Jahren zu einem der wichtigsten Datenbankmanagementsysteme entwickelt und sich durch eine spezielle Funktionsweise gegenüber anderen Datenbanken durchsetzen können. 
In dieser Arbeit werden diese Vorteile aufgegriffen und anhand ausgewählter Zeitreihendatenbanken detaillierter beschrieben.  
Zu Beginn gibt die Arbeit einen Überblick über die notwendigen Grundlagen von Zeitreihendatenbanken. Durch die Erklärung von Big Data, dessen zunehmenden Aufkommen und der Zusammenhang zu leistungsstarken Datenbanken gibt eine Basis, welche Idee hinter der Struktur und dem Erfolg von Zeitreihendatenbanken steht.
Anschließend folgt die Beschreibung erster Umsetzungen für die Verarbeitung von Zeitreihendaten sowie ein Überblick über den aktuellen Stand und unterschiedliche Einsatzbereiche von Zeitreihendatenbanken.  
Neben Vorteilen wird außerdem auf auftretende Schwierigkeiten, die sich im Hinblick auf Big Data ergeben, hingewiesen. 

Für den Vergleich werden die Zeitreihendatenbanken InfluxDB, GridDB und TimescaleDB nach zuvor definierten Kriterien analysiert.   
Für die Auswahl dieser Datenbanken wurde sich auf das Ranking von DB Engine gestützt und sich für populäre Datenbanken entschieden, die sich in ihrer Funktionsweise voneinander unterscheiden [1.1.1].
Im Vordergrund des Vergleichs stehen Aspekte des Datenmodells, die Partionierungsmechanismen, Replikationsmechanismen, unterstützte Programmiersprachen, APIs und andere Konzeptzugriffe, Einsatzbereiche sowie Vorteile, Besonderheiten und Nachteile.   

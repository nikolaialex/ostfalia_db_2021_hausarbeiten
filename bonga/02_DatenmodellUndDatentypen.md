# 2. Cloud Firestore-Datenmodell und Datentypen

Cloud Firestore ist eine dokumentorientierte NoSQL-Datenbank. Das bedeutet, dass Daten in einer Cloud Firestore Datenbank in Dokumente gespeichert werden. Diese Dokumente werden in Sammlungen (collections) organisiert

![](media/image2.png)


Für eine Cloud Firestore Datenbank, gelten folgende Regeln:

•	Dokumente können Untersammlungen (subcollections) enthalten oder verschachtelte Objekte.\
•	Sammlungen können nur Dokumente enthalten \
•	und Dokumenten können nicht größer als 1 MB sein.\
•	Ein Dokument kann kein Dokument enthalten.\
•	Es kann maximum 40.000 Indexe in einem Dokument geben\
•	Zwei Dokumente in einer Sammlung / Kollektion können nicht den gleichen Namen haben.\

Die Größe der Dokumente ist begrenzt, weil Cloud Firestore für die Speicherung großer Sammlungen von vielen kleinen Dokumente optimiert ist.
Kollektionen müssen nicht explizit erstellt oder gelöscht werden. Bei einer Zuweisung wird die Kollektion automatisch erstellt, wenn sie noch nicht existiert. Wenn alle Dokumente gelöscht werden, existiert die Sammlung auch nicht mehr.





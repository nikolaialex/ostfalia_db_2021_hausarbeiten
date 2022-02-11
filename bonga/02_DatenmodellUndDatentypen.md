# 2. Cloud Firestore-Datenmodell und Datentypen

Cloud Firestore ist eine dokumentorientierte NoSQL-Datenbank. Das bedeutet, dass Daten in einer Cloud Firestore Datenbank in Dokumente gespeichert werden. Diese Dokumente werden in Sammlungen (collections) organisiert

![](media/image2.png)

Abbildung 1: Cloud Firestore Datenmodell

<br/>

Für eine Cloud Firestore Datenbank, gelten folgende Regeln:

•	Dokumente können Untersammlungen (subcollections) enthalten oder verschachtelte Objekte.\
•	Sammlungen können nur Dokumente enthalten \
•	und Dokumenten können nicht größer als 1 MB sein.\
•	Ein Dokument kann kein Dokument enthalten.\
•	Es kann maximum 40.000 Indexe in einem Dokument geben\
•	Zwei Dokumente in einer Sammlung / Kollektion können nicht den gleichen Namen haben.\

Die Größe der Dokumente ist begrenzt, weil Cloud Firestore für die Speicherung großer Sammlungen von vielen kleinen Dokumente optimiert ist.
Kollektionen müssen nicht explizit erstellt oder gelöscht werden. Bei einer Zuweisung wird die Kollektion automatisch erstellt, wenn sie noch nicht existiert. Wenn alle Dokumente gelöscht werden, existiert die Sammlung auch nicht mehr. <br><br>
In einem Dokument, unterstützt Cloud Firestore verschieden Datentypen. In einem Dokument kann man Boolean, Zahlen, Strings, Binären Blob, geo Punkte, und Zeitstempel speichern.
Für eine Chat-Applikation könnte man zum Beispiel die Benutzerdaten in einem Dokument speichern. Alle Benutzer könnten dann in einer Sammlung gespeichert werden. So ein Dokument könnte die folgende Struktur haben: <br>

![](media/image3.png) Schneider<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;firstaname: "Max" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lastname: "Schneider" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;geburtsdatum: "10.10.2010" <br><br>

Das ist aber nur eine Option. Das Dokument könnte auch eine andere Struktur haben: <br>


![](media/image3.png) Schneider<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name: "Max Schneider" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lastname: "Schneider" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;firstname: "Max" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;geburtsdatum: "10.10.2010" <br>

<br>

Solche komplexen, verschachtelten Objekte nennt man Maps in Cloud Firestore.
Cloud Firestore Dokumente können in der Regel so behandelt werden, wie JSON. In einer Sammlung, hat man Dokumenten. Eine Sammlung von Benutzer für eine Chat App könnte wie folgt aussehen:

![](media/image4.png)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![](media/image3.png) Schneider<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name: "Max Schneider" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lastname: "Schneider" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;firstname: "Max" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;geburtsdatum: "10.10.2010" <br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![](media/image3.png) Müller<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name: "Mark Müller" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lastname: "Müller" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;firstname: "Mark" <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;geburtsdatum: "01.05.2000" <br>

<br>






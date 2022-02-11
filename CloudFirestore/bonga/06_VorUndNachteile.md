# 6	Vor – und Nachteile von Firebase Cloud Firestore

Wie jede Technologie, hat Cloud Firestore Vor- und Nachteile.

## 6.1	Vorteile von Cloud Firestore

Die ersten Vorteile von Cloud Firestore sind die Vorteile einer NoSQL-Datenbank. Mit Cloud Firestore haben Entwickler mehr Flexibilität bei Änderungen der Struktur der Daten, weil es kein festes Schema gibt, wie bei SQL-Datenbanken.
<br><br>

Cloud Firestore ist Serverlos. Die Datenbank ist komplett in der Google Cloud, und komplett verwaltet. Entwickler müssen sich nicht um die Hardware oder die Verfügbarkeit der Datenbank kümmern. Sie können schneller mit der Entwicklung ihrer Apps starten, und die Daten können leicht von jedem Gerät aufgerufen werden oder zwischen Benutzer geteilt werden.
<br><br>

Echtzeit- /Live-Synchronisierung: Mit Cloud Firestore können Daten fast in Echtzeit synchronisiert werden. Anwendung können so entwickelt werden, dass die Synchronisierung automatisch passiert, wenn es Änderungen gibt, oder die Synchronisierung kann auch manuell gestartet werden. Der Entwickler kann frei entscheiden welche Strategie verwendet werden soll.

<br><br>

Unterstützung von Offline-Modus: Cloud Firestore unterstützt den Offline-Modus. Diese Eigenschaft ist direkt in Cloud Firestore integriert. Sie muss nicht mehr von Entwickler selbst implementiert werden. Die Apps, die mit Cloud Firestore entwickelt werden, funktionieren weiter, wenn man offline ist, da die Daten weiter verfügbar sind.
<br><br>

SDK und Server Client-Bibliotheken für viele Sprachen: Cloud Firestore hat mobile und web SDKs. Damit wird die Android, iOS und Web-Entwicklung mit Cloud Firestore vereinfacht. Alle diese SDKs sind gut dokumentiert. Es gibt Fälle, wo man zwischen Firebase und die Kunden einen Server haben will. Für diese Fälle hat Firestore Server Client Bibliotheken, die in vielen Sprachen verfügbar sind (C#, Go, Java, Node.js, PHP, Python, und Ruby).

<br><br>

Browser-Tool, um die Daten zu visualisieren: In der Firebase Konsole, hat Cloud Firestore einen sehr übersichtlichen Browser, um durch die Daten zu navigieren und diese Daten zu bearbeiten.

Multiregionale Datenreplikation: Cloud Firestore benutzt die Google Cloud Infrastruktur, und speichert die Daten in mehreren Standorten für mehr Zuverlässigkeit.

Wenn eine Anwendung mehr Leistung braucht, kann Cloud Firestore automatisch skalieren, um leistungsfähig zu bleiben.

Zu Firebase gehören viele andere Produkte, die zusammen mit Cloud Firestore arbeiten. Das ist zum Beispiel der Fall für Firebase Authentication, womit man seine Nutzer identifizieren und authentifizieren kann. Cloud Firestore bringt auch alle Vorteile der Google Cloud Plattform. Zum Beispiel Cloud Funktionen, die es ermöglichen einen Code oder Operationen in der Datenbank auszuführen.


## 6.2	Nachteile von Cloud Firestore


Obwohl Cloud Firestore sehr viele Vorteile hat, gibt es leider auch Nachteile.

Kein JOIN und SQL. Das Cloud Firestore eine NoSQL Datenbank ist, gibt es keine SQL-Abfragen. Es gibt auch kein JOIN.

Cloud Firestore ist nicht kostenlos. Cloud Firestore kann kostenlos getestet werden; weil es für fast alle Firebase Produkte und Funktionen ein freies Kontingent gibt. Für kleine Applikationen oder für Testzwecke kann das reichen aber, wenn die Applikation anfangen zu wachsen, muss man irgendwann bezahlen. Die kosten werden hauptsächlich von der Menge der Abfragen berechnet. Die Struktur der Datenbank beeinflusst die kosten.

Bei jedem Export wird eine Lese-Operation pro Dokument gezählt. Wenn man automatische Exporte konfiguriert, sollte man vorsichtig sein, wenn die Menge der Daten groß ist, weil Exporte Kosten verursachen könnten. Die Kosten, die durch Exporte verursacht werden, werden nicht in der Konsole angezeigt.

Cloud Firestore unterstützt Keine Volltextsuche. Wenn man Cloud Firestore für die Entwicklung einer Anwendung verwendet, die eine Volltextsuche haben soll, ist man auf externe Drittanbieter wie Elastic, Algolia oder Typesense angewiesen.

# Mnesia
Wie in den vorangegangen Kapiteln bereits erläutert, stellt *Erlang* viel von dem von Haus aus bereit, was in **Kapitel_3** an Anforderungen für verteilte nebenläufige Datenbanken gilt. Da eine Datenbank auch zu den Anforderungen eines modernen Software-Ökosystems gehört, ist die Datenbank **Mnesia** in den *OTP* integriert. Hierbei handelt es sich um ein komplettes **DDBMS**.


## Features
Zu den Features in *Mnesia* gehören:


<dl>
  <dt>Änderung zur Laufzeit</dt>
  <dd>Datenbankschema können dynamisch zur Laufzeit abgeändert werden</dd>
</dl>
<dl>
  <dt>Tabelleneigenschaften</dt>
  <dd>Tabellen können direkt Eigenschaft wie *Persistenz*, *Replikation* und weitere zugeordnet werden</dd>
</dl>
<dl>
  <dt>steigern der Ausfallsicherheit von Tabellen</dt>
  <dd>Tabellen können auf andere Knoten bewegt oder repliziert werden, um eine höhere Ausfallsicherheit zu gewährleisten.</dd>
</dl>
<dl>
  <dt>Transparente Replikation und Verschiebung</dt>
  <dd>Tabellen können transparent auf andere Knoten verschoben oder repliziert werden, also ohne dass dies sichtbar ist für den User</dd>
</dl>
<dl>
  <dt>Transaktionen</dt>
  <dd>Transaktionen können verteilt stattfinden, wobei mehrere Operationen in einer Transaktion durchgeführt werden können</dd>
</dl>
<dl>
  <dt>verteilte Transaktionen</dt>
  <dd>Transaktionen haben Eigenschaften, so kann ihnen z.B. zugeordnet werden, ob Sie auf allen Knoten oder keinem durchgeführt werden sollen</dd>
</dl>

<dl>
  <dt>2-Phasen-Commit</dt>
  <dd>Schreibende Änderungen werden im 2- (im Fehlerfall: 3-)Phasen-Commit erstellt [2]</dd>
</dl>

<dl>
  <dt>Unterstützte Datentypen</dt>
  <dd>Mnesia unterstützt native Erlang-Datentypen</dd>
</dl>

<dl>
  <dt>verschiedene Storagetypen</dt>
  <dd>Mnesia unterstützt RAM-, Storage- oder RAM+Storage-Schreibvorgänge</dd>
</dl>

<dl>
  <dt>Eigene Abfragesprache</dt>
  <dd>Mnesia nutzt nicht *SQL*, sondern eine *Erlang* eigene für die Abfragen</dd>
</dl>


### Abfragesprache
*Mnesia* stellt die eigene Abfragesprache **QLC** (Query List Comprehension) bereit. Mit ihr können erweiterte Funktionen erstellt werden, die zu verbesserten Abfragen führen, da sie von einem Compiler ausgewertet und optimiert werden. Außerdem können komplexe Abfragen z.T. vereinfacht dargestellt werden, da QLC die Auswertung über *List Comprehensions* erlaubt.

### Datentypen
Da *Mnesia* sehr stark in *Erlang* integriert sind, entsprechen die unterstützten Datentypen denen von *Erlang*, darunter fallen z.B. String, atoms, int, float, etc.


### Datenbank
#### Beispieltabelle: Warenlager - Buch

| Titel |  Autor | Verlag | Jahr | Preis | Anzahl |
|-------|--------|--------|------|-----|--------|
| Dem Rinde entlehnt | Rainer Hohn | Klett | 2022 | 16,46 | 426 |

Um Tabellendefinitionen darzustellen, werden in Mnesia **Records** genutzt. Diese schon erläuterten Datenstrukturen sind denkbar einfach angelegt:

``` erlang
-record(buch {titel, autor, jahr, preis, anzahl}).
```


#### Verteilung und Fehlertoleranz
Mnesia erfüllt die Anforderung der *lokalen Transparenz* und erlaubt es somit, direkt mit den Tabellen zu arbeiten, ohne ihren tatsächlichen Speicherort spezifizieren zu müssen. Um eine gewisse Fehlertoleranz ermöglichen zu können, erlaubt es *Mnesia* beim Anlegen der Tabellen festzulegen, wie viele Replicas erzeugt werden sollen. Dabei unterscheidet *Mnesia* 3 verschiedene Arten von Kopien die genutzt werden können:

<dl>
  <dt>ram_copies</dt>
  <dd>Hier wird eine Liste von *Mnesia*-Knoten übergeben, die diese Tabelle im Arbeitsspeicher vorhalten. *Mnesia* stellt Funktionen bereit, um einen Dump dieser Tabellen auf dem Storage zu erzeugen</dd>
</dl>

<dl>
  <dt>disc_copies</dt>
  <dd>Hierbei handelt es sich um die hybride Struktur zum Ablegen von Tabellen. Die Tabelle wird auf diesem Knoten sowohl im Arbeitsspeicher als auch auf dem lokalen Storage gespeichert.</dd>
</dl>

<dl>
  <dt>disc_only_copies</dt>
  <dd>Wie dem Namen zu entnehmen ist, werden hier die Tabellen nur auf dem Storage vorgehalten, nicht aber im Arbeitsspeicher. Das verlangsamt zwar den Zugriff, vereinfacht aber die Absicherung, das eine Datenkonsistenz noch gegeben ist.</dd>
</dl>

Tabellen können also auf Knoten entweder im *RAM* oder auf dem *lokalen Storage* abgelegt werden.
Dabei gelten die üblichen Vor- und Nachteile: Eintrage im *RAM* sind sehr schnell zugreifbar, aber auch flüchtig.
Befinden sich die Daten auf dem lokalen Storage nutzt Mnesia einen *disk log*. Alle Operationen werden zunächst in diesen
disk log geschrieben und anschließend periodisch in die Datenbank geschrieben. Wenn dieser Schreibzugriff erfolgreich war, wird der Log
gelöscht. Bei einem Systemcrash kann dieser *disk log* auf genutzt werden, um fehlende oder unvollständige Transaktionen der Datenbank zu korrigieren [8].

##### verteilte Daten - fragmentierte Tabellen
*Mnesia* unterstützt *horizontale Fragmentierung* von Tabellen. Auf diese Weise können sehr große Tabellen aufgeteilt auf viele Knoten abgelegt werden. Es gibt verschiedene Algorithmen, um fragmentierte Tabellen auf mehrere Knoten aufzuteilen. Um bewerten zu können, welcher Algorithmus für die eigenen Anforderungen am Besten ist, müssen verschiedene Faktoren berücksichtigt werden, z.B.

 -  ist das System stabil oder werden oft neue Knoten dazu- oder abgeschaltet
 -  ist die Speicherauslastung innerhalb definierter Parameter
 -  ist die Systemauslastung auf Dauer tragbar


### Nebenläufige Prozesse in Mnesia
Wie bereits hier erwähnt, können mehrere Funktionen (und somit Prozesse) innerhalb einer Transaktion aufgerufen werden. Dies beinhaltet nicht nur lesende, sondern auch schreibende Operationen. Diese Operationen können nebenläufig durchgeführt werden, wobei keine Synchronisation der Prozesse durch den User nötig ist. Alle Anfragen können so geschrieben werden, als ob dies der einzige Zugriff auf diese Daten ist, sämtliche Schritte um das System konsistent zu halten, werden vom System selbst durchgeführt.


### Operationen
#### Neue Einträge

Um einen Eintrag hinzufügen zu können wäre folgende Funktion eine mögliche. Dabei wird ein neuer Record angelegt und in die bereits
existierende Tabelle eingetragen:

``` erlang
add_new_book(Titel,Autor,Verlag,Jahr,Preis,Anzahl) ->
  Eintrag = #buch{titel = Titel, autor=Autor,verlag=Verlag,jahr=Jahr,preis=Preis,anzahl=Anzahl},
  Operation = fun() ->
    mnesia:write(Eintrag)
  end,
  mnesia:transaction(Operation).
```

#### Lesender Zugriff mit Bedingung
Um Bedingungen in den Abfragen nutzen zu können, definieren wir eine Funktion, die einen *QLC*-Query auslöst, z.B. die Ausgabe aller Bücher, die vor 2010 erschienen sind:

``` Erlang

alte_buecher() ->
  do(qlc:q([X#buch.titel || X <- mnesia:table(buch),
                            X#buch.jahr < 2010])).
```
Hier wird die Logik der Anfrage in der *List Comprehension* ausgedrückt.


[**Weiter**](./05_Fazit.md)

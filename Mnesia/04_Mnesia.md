# Mnesia
Wie in den vorrangegangen Kapiteln bereits erläutert, stellt Erlang viel von dem von Haus aus bereit, was in **Kapitel_3** an Anforderungen für verteilte nebenläufige Datenbanken gilt. Da eine Datenbank auch zu den Anforderungen eines modernen Programmier-Ökosystems gehört, ist die Datenbank **Mnesia** in den *OTP* integriert. Hierbei handelt es sich um ein komplettes **DBMS**. Mehrere Features, z.B. das Halten der Daten im Arbeitsspeicher oder das replizieren der Daten auf mehreren Maschinen wird in *Mnesia* von Haus aus unterstützt.


Hier noch ein bisschen blabla über: was für ein Datenbanktyp, OIDs, Records

## Datentypen
Da Mnesia sehr stark in Erlang integriert sind, entsprechen die unterstützten Datentypen denen von Erlang, darunter fallen z.B. String, atoms, int, float, etc.


## Beispieltabelle: Warenlager - Buch

| Titel |  Autor | Verlag | Jahr | Preis | Anzahl |
|-------|--------|--------|------|-----|--------|
| Dem Rinde entlehnt | Rainer Hohn | Klett | 2022 | 16,46 | 426 |

Um Tabellendefinitionen darzustellen, werden in Mnesia **Records** genutzt. Diese schon erläuterten Datenstrukturen sind denkbar einfach angelegt:

``` erlang
-record(buch {titel, autor, jahr, preis, anzahl}).
```

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


## Nebenläufigkeit in Mnesia
Mnesia ist sehr vielfältig konfigurierbar.
#### lokal
Tabellen können auf lokalen Rechnern entweder im *RAM* oder auf dem *lokalen Storage* abgelegt werden.
Dabei gelten die üblichen Vor- und Nachteile: Eintrage im *RAM* sind sehr schnell zugreifbar, aber auch flüchtig.
Befinden sich die Daten auf dem lokalen Storage nutzt Mnesia einen *disk log*. Alle Operationen werden zunächst in diesen
disk log geschrieben und anschließend periodisch in die Datenbank geschrieben. Wenn dieser Schreibzugriff erfolgreich war, wird der Log
gelöscht. Bei einem Systemcrash kann dieser *disk log* auf genutzt werden, um fehlende oder unvollständige Transaktionen der Datenbank zu korrigieren.

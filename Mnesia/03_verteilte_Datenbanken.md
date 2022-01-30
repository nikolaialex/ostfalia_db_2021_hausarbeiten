# verteilte Datenbanken

# Warum

# Anforderungen
Die Anforderungen an verteilte Datenbanken macht sichtbar, warum eine Einführung in Erlang notwendig war, und warum
Erlang eine gute Grundlage sein kann.
Die Herausforderungen, auch als **Fallacies of Distributed Computing**[3] bekannt, sind 8 Trugschlüsse, die beim Arbeiten mit nebenläufigen Datenbanken
angenommen werden könnten.
### Fallacies of Distributed Computing
1. Das Netzwerk ist ausfallsicher
2. Die Latenzzeit ist gleich null
3. Der Datendurchsatz ist unbegrenzt
4. Das Netzwerk ist sicher
5. Die Netzwerktopologie wird sich nicht ändern
6. Es gibt immer nur einen Netzwerkadministrator
7. Die Kosten des Datentransports können mit null angesetzt werden.
8. Das Netzwerk ist homogen.


# Lösungen
Wie genau Mnesia diese Probleme löst, wird im nächsten Kapitel genauer erläutert, allerdings wird hier schon auffällig, dass
die unterliegende Programmiersprache bereits einige der Probleme als Kernprobleme anerkennt und Lösungen bereitstellt.

## ACID

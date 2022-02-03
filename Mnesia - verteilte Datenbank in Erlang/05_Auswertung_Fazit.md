# Auswertung und Fazit

Das Ökosystem *Erlang* und die verteilte Datenbank *Mnesia* sind leider zu groß, um sie hier vollständig zu erklären. Das Ziel dieser Ausarbeitung ist es, die Kernkompetenzen zu umreißen und darzustellen und zu prüfen, ob *Mnesia* das Merkmal eines verteilten Datenbankmanagementsystems erfüllt. Da bereits Anforderungen an ein DDBMS aufgestellt wurde,

## Auswertung der Anforderung
Setzt man nun nochmal die Anforderungen an eine *DDBMS* an und vergleicht mit den vorhanden Features von *Mnesia*, kommt es zu einem eindeutigen Ergebnis.

|Anforderung | von Mnesia erfüllt |
|-----------|-------------------|
| lokale Autonomie | ✓ |
| keine Abhängigkeit von zentralen Standorten | ✓ |
| kontinuierlicher Betrieb | ✓ |
| lokale Unabhängigkeit | ✓ |
| Unabhängigkeit der Fragmentierung | ✓ |
| Unabhängigkeit der Replikation | ✓ |
| verteilte Abfragenverarbeitung | ✓ |
| verteilte Transaktionsverarbeitung | ✓ |
| Unabhängigkeit der Hardware | ✓ |
| Unabhängigkeit des Betriebssystems | ✓ |
| Unabhängigkeit des Netzwerks | ✓ |
| Unabhängigkeit der Datenbank | (X) |

Da 11/12 Anforderungen von *Mnesia* erfüllt werden, und die letzten 4 recht schwammig sind, kann man die Daten so auslegen, dass *Mnesia* ein vollwertiges verteiltes DBMS ist.



[**Quellen**](./06_Literatur_Quellen.md)

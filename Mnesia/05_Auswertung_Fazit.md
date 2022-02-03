# Auswertung und Fazit

Das Ökosystem *Erlang* und die verteilte Datenbank *Mnesia* sind leider zu groß, um sie hier vollständig zu erklären. Das Ziel dieser Ausarbeitung ist es, die Kernkompetenzen zu umreißen und darzustellen und zu prüfen, ob *Mnesia* das Merkmal eines verteilten Datenbankmanagementsystems erfüllt. Da bereits Anforderungen an ein DDBMS aufgestellt wurde,

## Anforderungen

|Anforderung | von Mnesia erfüllt |
|-----------|-------------------|
| lokale Autonomie | ✓ |
| keine Abhängigkeit von zentralen Standorten | ✓ |
| kontinuierlicher Betrieb | ✓ |
| lokale Unabhängigkeit | ✓ |
| Unabhängigkeit der Fragmentierung | ✓ |
| Unabhängigkeit der Replikation | ✓ |
| verteilte Anfragenverarbeitung | ✓ |
| verteilte Transaktionsverarbeitung | ✓ |
| Unabhängigkeit der Hardware | ✓ |
| Unabhängigkeit des Betriebssystems | ✓ |
| Unabhängigkeit des Netzwerks | ✓ |
| Unabhängigkeit der Datenbank | (X) |

Da 11/12 Anforderungen von *Mnesia* erfüllt werden, und die letzten 4 recht schwammig sind, kann man die Daten so auslegen, dass *Mnesia* ein vollwertiges verteiltes DBMS ist.

## Einsatzorte

Mnesia
When to Use Mnesia
Mnesia is a great fit for applications that:
• Need to replicate data.
• Perform complex data queries.
• Need to use atomic transactions to safely update several records simultaneously.
• Require soft real-time characteristics


[**Quellen**](./06_Literatur_Quellen.md)

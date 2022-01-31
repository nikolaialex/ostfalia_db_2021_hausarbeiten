MATCH (a:Person)-[:BESUCHT]->(b:Schule {name: 'Hogwarts'})
RETURN a
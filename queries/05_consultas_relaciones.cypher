LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/inscripciones.csv'
AS row
MATCH (e:Estudiante {id: row.estudiante_id})
MATCH (m:Materia {id: row.materia_id})
CREATE (e)-[:INSCRITO_EN]->(m);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/amistades.csv'
AS row
MATCH (e1:Estudiante {id: row.estudiante1_id})
MATCH (e2:Estudiante {id: row.estudiante2_id})
CREATE (e1)-[:AMIGO_DE]->(e2);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: row.profesor_id})
MATCH (m:Materia {id: row.materia_id})
CREATE (p)-[:IMPARTE]->(m);
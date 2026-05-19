LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/inscripciones.csv'
AS row
MATCH (e:Estudiante {id: row.estudiante_id})
MATCH (m:Materia {id: row.materia_id})
CREATE (e)-[:INSCRITO_EN]->(m);


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/amistades.csv' AS row
MATCH (e1:Estudiante {id: row.estudiante_origen})
MATCH (e2:Estudiante {id: row.estudiante_destino})
MERGE (e1)-[:AMIGO_DE]->(e2);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: row.profesor_id})
MATCH (m:Materia {id: row.materia_id})
CREATE (p)-[:IMPARTE]->(m);


MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)
RETURN amigo.nombre AS amigo_directo;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN amigo.nombre AS amigo, m.nombre AS materia;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(m:Materia)<-[:IMPARTE]-(p:Profesor)
RETURN amigo.nombre AS amigo, m.nombre AS materia, p.nombre AS profesor;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE*1..2]->(conectado:Estudiante)
RETURN DISTINCT conectado.nombre AS estudiante_conectado;

MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
WHERE r.calificacion >= 90
RETURN e.nombre AS estudiante, m.nombre AS materia, r.calificacion AS calificacion;
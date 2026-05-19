LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/estudiantes.csv'
AS row

MERGE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/materias.csv'
AS row
MERGE (:Materia {
  id: row.id,
  nombre: row.nombre,
  area: row.area
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/profesores.csv'
AS row
MERGE (:Profesor {
  id: row.id,
  nombre: row.nombre,
  departamento: row.departamento
});

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
MERGE (p)-[:IMPARTE]->(m);

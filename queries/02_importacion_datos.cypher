// =======================
// Importación de Estudiantes
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/estudiantes.csv' AS row
MERGE (e:Estudiante {id: row.id})
SET e.nombre = row.nombre,
    e.carrera = row.carrera,
    e.semestre = toInteger(row.semestre);

// =======================
// Importación de Materias
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/materias.csv' AS row
MERGE (m:Materia {id: row.id})
SET m.nombre = row.nombre,
    m.area = row.area;

// =======================
// Importación de Profesores
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/profesores.csv' AS row
MERGE (p:Profesor {id: row.id})
SET p.nombre = row.nombre,
    p.departamento = row.departamento;

// =======================
// Importación de Inscripciones
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/inscripciones.csv' AS row
MATCH (e:Estudiante {id: row.estudiante_id})
MATCH (m:Materia {id: row.materia_id})
MERGE (e)-[:INSCRITO_EN]->(m);

// =======================
// Importación de Amistades
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/amistades.csv' AS row
MATCH (e1:Estudiante {id: row.estudiante_origen})
MATCH (e2:Estudiante {id: row.estudiante_destino})
MERGE (e1)-[:AMIGO_DE]->(e2);

// =======================
// Importación de Imparticiones
// =======================
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/imparticiones.csv' AS row
MATCH (p:Profesor {id: row.profesor_id})
MATCH (m:Materia {id: row.materia_id})
MERGE (p)-[:IMPARTE]->(m);

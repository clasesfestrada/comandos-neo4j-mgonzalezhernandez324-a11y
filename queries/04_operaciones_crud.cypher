MERGE (e:Estudiante {id: 'E006'})
SET e.nombre = 'Miguel',
    e.carrera = 'Sistemas',
    e.semestre = 2;


MATCH (e:Estudiante {id: 'E006'})
MATCH (m:Materia {id: 'M001'})
CREATE (e)-[:INSCRITO_EN]->(m);

MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

MATCH (e:Estudiante)-[r]->(n)
RETURN e.nombre, type(r), n;

MATCH (e:Estudiante {id: 'E006'})
SET e.semestre = 3;

MATCH (e:Estudiante {id: 'E006'})-[r:INSCRITO_EN]->(m:Materia {id: 'M001'})
DELETE r;

MATCH (e:Estudiante {id: 'E006'})
DELETE e;

MATCH (e:Estudiante {id: 'E006'})
DETACH DELETE e;

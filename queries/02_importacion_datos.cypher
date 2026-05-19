LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/materias.csv'
AS row
CREATE (:Materia {
  id: row.id,
  nombre: row.nombre,
  area: row.area
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-mgonzalezhernandez324-a11y/refs/heads/main/data/profesores.csv'
AS row
CREATE (:Profesor {
  id: row.id,
  nombre: row.nombre,
  departamento: row.departamento
});

Role.create(
  code:        'administrador',
  name:        'Administrador',
  status:      true,
  description: 'Persona encargada de gestionar todo el sistema'
)

Role.create(
  code:        'director_carrera',
  name:        'Director Carrera',
  status:      true,
  description: 'Persona encargada de gestionar las materias y planes de ' \
                 'estudio de una carrera'
)

Role.create(
  code:        'director_departamento',
  name:        'Director de departamento',
  status:      true,
  description: 'Persona encargada de gestionar los departamentos y sus ' \
               ' carreras'
)

Role.create(
  code:        'estudiante',
  name:        'Estudiante',
  status:      true,
  description: 'Persona que estudia en el campus'
)

Role.create(
  code:        'administrador',
  name:        'Administrador',
  status:      true,
  description: 'Persona encargada de gestionar todo el sistema'
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

Role.create(
  code:        'director_carrera',
  name:        'Director de carrera',
  status:      true,
  description: 'Persona encarga de gestionar materias de una carrera'
)

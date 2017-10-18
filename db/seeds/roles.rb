Role.create(
  code:        'Administrator',
  name:        'Administrador',
  status:      true,
  description: 'Persona encargada de gestionar todo el sistema'
)

Role.create(
  code:        'Department_Director',
  name:        'Director de departamento',
  status:      true,
  description: 'Persona encargada de gestionar los departamentos y sus ' \
               ' carreras'
)

Role.create(
  code:        'Student',
  name:        'Estudiante',
  status:      true,
  description: 'Persona que estudia en el campus'
)

Role.create(
  code:        'Career_Director',
  name:        'Director de carrera',
  status:      true,
  description: 'Persona encarga de gestionar materias de una carrera'
)

# This file create two users by default

User.create(
  name:       'Juan Carlos',
  last_name:  'Estebes González',
  password:   'contrasena',
  id_college: 'A01204421',
  email:      'A01204421@itesm.mx',
  phone:      '4485577888',
  gender:     'Masculino',
  birthday:   '24-06-2017',
  status:     true
)

User.create(
  name:       'Juan Manuel',
  last_name:  'Guerrero Hernández',
  password:   'contrasena',
  id_college: 'A01207672',
  email:      'A01207672@itesm.mx',
  phone:      '4421104433',
  gender:     'Masculino',
  birthday:   '10-05-2017',
  status:     true
)

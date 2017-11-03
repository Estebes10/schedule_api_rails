# In this file will create one campus and its departments for example use

# Create a campus by default
@campus = Campu.create(
  name:        'Instituto Tecnológico de Estudios Superior de Monterrey',
  code:        'QRO',
  status:      true,
  state:       'Querétaro',
  description: 'Campus úbicado en el estado de Querétaro',
)

# Create 20 departments associated to the previous campus
20.times do
  FactoryGirl.create(:department, campu_id: @campus.id)
end

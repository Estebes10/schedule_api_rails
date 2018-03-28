# This class is responsible to convert native ruby Department Model into JSON,
# XML or other content types. Also deserialize from parsed data into ruby
# objects.
class DepartmentSerializer < ActiveModel::Serializer

  # attributes to be serializer
  attributes :id, :name, :code, :description, :status, :created_at, :updated_at

  # associations to be serialized
  has_many :careers

end

# This class is responsible to convert native ruby Career Class into JSON, XML
# or other content types. Also deserialize from parsed data into ruby objects.
class CareerSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :code, :description, :status, :created_at, :updated_at

  # model associations to serialize
  has_many :study_programs

end

class DepartmentSerializer < ActiveModel::Serializer

  # This class serialize all attributes and associations in Department model
  # to send specific values in a JSON object

  # attributes to be serializer
  attributes :id, :name, :code, :description, :status, :created_at, :updated_at

  # associations to be serializer
  has_many :careers

end

class CareerSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :code, :description, :status, :created_at, :updated_at

  # model associations
  has_many :study_programs

end

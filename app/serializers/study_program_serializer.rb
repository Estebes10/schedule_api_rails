class StudyProgramSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :description, :status, :created_at, :updated_at
  # model association
  has_many :semesters

end

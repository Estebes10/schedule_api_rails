class CourseSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :code, :description, :units, :class_hours, :lab_hours, :status

  # model associations
  has_many :study_programs

end

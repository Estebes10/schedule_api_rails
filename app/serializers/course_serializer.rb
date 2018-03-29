# This class is responsible to convert native ruby Course Class into JSON, XML
# or other content types. Also deserialize from parsed data into ruby objects.
class CourseSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :code, :description, :units, :class_hours, :lab_hours, :status

  # model associations to serialize
  has_many :study_programs

end

# This class is responsible to convert native ruby StudyProgram Class into JSON,
# XML or other content types. Also deserialize from parsed data into ruby
# objects.
class StudyProgramSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :name, :description, :status, :created_at, :updated_at

  # model association to serialize
  has_many :semesters

end

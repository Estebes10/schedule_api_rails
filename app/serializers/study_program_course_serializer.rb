# This class is responsible to convert native ruby Department Model into JSON,
# XML or other content types. Also deserialize from parsed data into ruby
# objects.
class StudyProgramCourseSerializer < ActiveModel::Serializer

  # attributes to be serializer
  attributes :course_id, :semester_number, :created_at, :updated_at

  # associations to be serialized
  has_many :courses

end
